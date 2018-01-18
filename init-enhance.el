;;; init-enhance.el --- 個人設定用の拡張機能.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/18 11:37:21>
;;

;;; Commentary:

;;; Code:

;; use:`cl-lib'
(eval-when-compile
  (require 'cl-lib))

;; define:`os-type-{x}-p'
(defconst os-type-bsd   'bsd  )
(defconst os-type-linux 'linux)
(defconst os-type-mac   'mac  )
(defconst os-type-win   'win  )
(defconst os-type
  (cond ((string-match-p "freebsd"      system-configuration) os-type-bsd  )
        ((string-match-p "linux"        system-configuration) os-type-linux)
        ((string-match-p "apple-darwin" system-configuration) os-type-mac  )
        ((string-match-p "mingw"        system-configuration) os-type-win  )))
(defun os-type-bsd-p   () "FreeBSD." (eq os-type os-type-bsd  ))
(defun os-type-linux-p () "Linux."   (eq os-type os-type-linux))
(defun os-type-mac-p   () "Mac."     (eq os-type os-type-mac  ))
(defun os-type-win-p   () "Windows." (eq os-type os-type-win  ))

(defun e:require (package &optional noerror)
  "指定された PACKAGE をロードする.
NOERROR が指定されている場合はエラーを無視する."
  (require package nil noerror))

(cl-defun e:require-package (package &optional load noerror)
  "指定された PACKAGE をインストールする.
LOAD が指定された場合はインストール後にロードする.
NOERROR が指定されている場合はエラーを無視する."
  (when (e:require 'package t)
    (condition-case err
        (or (package-installed-p package)
            (progn (message "install: %s." package)
                   (package-install package)))
      (error (message "%s" err)
             (cl-return-from e:require-package)))
    (if load
        (e:require package noerror)
      (package-installed-p package))))

(defun e:load-local-config (filename)
  "FILENAME で指定されたローカル設定を読み込む."
  (let* ((file (e:expand filename :local))
         (el (concat (file-name-sans-extension file) ".el"))
         (elc (concat el "c")))
    (unless (file-exists-p (file-name-directory file))
      (make-directory (file-name-directory file) t))
    (unless (file-exists-p el)
      (write-region (format ";; %s" filename) nil el))
    (if (file-exists-p elc)
        (load elc)
      (load el))))

(defun e:set-font (fontname height)
  "FONTNAME で指定したフォントが存在する場合に、高さ HEIGHT でフォントを設定する."
  (when (find-font (font-spec :name fontname))
    (set-face-attribute 'default nil :family fontname :height height)
    t))

(defvar e:get-dir-alist
  '((:home (cond ((os-type-win-p) (file-truename "~/"))
                 ((os-type-bsd-p) "~/")
                 ((os-type-mac-p) "~/")
                 ((os-type-linux-p) "~/")))
    (:cache (e:expand "cache" (e:get-dir :user)))
    (:local (e:expand "local" (e:get-dir :user)))
    (:conf (e:expand "config" (e:get-dir :user)))
    (:temp (e:unexpand (file-truename (e:expand ".emacs" temporary-file-directory))))
    (:user user-emacs-directory)))

(defun e:get-dir (dirtype)
  "DIRTYPE で指定したディレクトリを取得する."
  (let ((e (cadr (assoc dirtype e:get-dir-alist))))
    (if e (eval e) dirtype)))

(defun e:expand (filename &optional dirtype)
  "FILENAME と DIRTYPE に応じて展開したパスを取得する."
  (let ((directory (e:get-dir dirtype)))
    (expand-file-name filename directory)))

(defun e:unexpand (filename)
  "指定された FILENAME を短縮する."
  (abbreviate-file-name filename))

(defmacro e:safe-exec (sexplist)
  "SEXPLIST を安全に実行する."
  `(if (fboundp (car ',sexplist))
       ,sexplist))

(defmacro e:define-prefix-command (command-map &optional docstring)
  "COMMAND-MAP に DOCSTRING を設定して定義する."
  `(progn
     (defvar ,command-map nil ,docstring)
     (define-prefix-command ',command-map)))

(defun e:loaded ()
  "ロード完了のメッセージをログに出力."
  (when load-in-progress
    (message "*Loading %s...done"
             (file-name-sans-extension (file-name-nondirectory load-file-name)))))

(e:loaded)
(provide 'init-enhance)
;;; init-enhance.el ends here
