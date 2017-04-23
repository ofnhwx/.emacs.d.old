;;; init-enhance.el --- 個人設定用の拡張機能.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:55:51>
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

;; define:`e:require'
(defun e:require (package &optional noerror)
  ""
  (require package nil noerror))

;; define:`e:require-package'
(cl-defun e:require-package (package &optional load noerror)
  ""
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

;; define:`e:load-config'
(defun e:load-config (filename &optional local)
  ""
  (let ((file (if local (e:expand (concat "config/" filename) :local)
                (e:expand filename :conf))))
    (when local
      (unless (file-exists-p (file-name-directory file))
        (make-directory (file-name-directory file) t))
      (unless (file-exists-p (concat (file-name-sans-extension file) ".el"))
        (write-region "" nil (concat (file-name-sans-extension file) ".el"))))
    (load file)))


;; define:`e:set-font'
(defun e:set-font (fontname height)
  ""
  (when (find-font (font-spec :name fontname))
    (set-face-attribute 'default nil :family fontname :height height)
    t))

;; define:`e:get-dir'
(defvar e:get-dir-alist
  '((:home (cond ((os-type-win-p) (file-truename "~/"))
                 ((os-type-bsd-p) "~/")
                 ((os-type-mac-p) "~/")
                 ((os-type-linux-p) "~/")))
    (:local (e:expand "local" (e:get-dir :user)))
    (:conf (e:expand "config" (e:get-dir :user)))
    (:temp (e:unexpand (file-truename (e:expand ".emacs" temporary-file-directory))))
    (:user user-emacs-directory)))
(defun e:get-dir (dirtype)
  ""
  (let ((e (cadr (assoc dirtype e:get-dir-alist))))
    (if e (eval e) dirtype)))

;; define:`e:expand'
(defun e:expand (filename &optional dirtype)
  ""
  (let ((directory (e:get-dir dirtype)))
    (expand-file-name filename directory)))

;; define:`e:unexpand'
(defun e:unexpand (filename)
  ""
  (abbreviate-file-name filename))

;; define:`e:safe-exec'
(defmacro e:safe-exec (sexplist)
  ""
  `(if (fboundp (car ',sexplist))
       ,sexplist))

;; define:`e:loaded'
(defun e:loaded ()
  ""
  (when load-in-progress
    (message "*Loading %s...done"
             (file-name-sans-extension (file-name-nondirectory load-file-name)))))

(e:loaded)
(provide 'init-enhance)
;;; init-enhance.el ends here
