;;; init-enhance.el --- 個人設定用の拡張機能.
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 必要なライブラリ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; OSの判定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パッケージの管理等
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar e:package-repository nil
  "パッケージをインストールする際に使用するリポジトリ.")

(defvar e:package-initialized-p nil
  "パッケージの初期化が完了しているか.")

(defun e:add-package-repository (name url &optional priority)
  "パッケージリポジトリを追加する.
NAME, URL は必須、PRIORITY は必要な場合のみ指定する."
  (add-to-list 'e:package-repository (list name url (or priority 0)) t))

(defun e:package-initialize ()
  "パッケージの初期化."
  (unless e:package-initialized-p
    (cl-dolist (item e:package-repository)
      (let ((archive (car item))
            (location (cadr item))
            (priority (or (cl-caddr item) 0)))
        (when (os-type-win-p)
          (setq location (replace-regexp-in-string "https://" "http://" location)))
        (add-to-list 'package-archives (cons archive location))
        (add-to-list 'package-archive-priorities (cons archive priority))))
    (unless (file-directory-p package-user-dir)
      (package-refresh-contents))
    (package-initialize)
    (setq e:package-initialized-p t)))

(defmacro e:use-package (name preconditions &rest args)
  "PRECONDITIONS が満たされる場合のみ、NAME, ARGS を使用して`use-package'を呼び出す."
  (declare (indent defun))
  `(when ,preconditions
     (use-package ,name ,@args)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パス関連の拡張
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar e:get-dir-alist
  '((:home (cond ((os-type-win-p) (file-truename "~/"))
                 ((os-type-bsd-p) "~/")
                 ((os-type-mac-p) "~/")
                 ((os-type-linux-p) "~/")))
    (:cache (e:expand "cache" (e:get-dir :user)))
    (:local (e:expand "local" (e:get-dir :user)))
    (:conf (e:expand "config" (e:get-dir :user)))
    (:config (e:expand "config" (e:get-dir :user)))
    (:lisp (e:expand "lisp" (e:get-dir :user)))
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

(defun e:shorten (filename &optional max)
  "指定された FILENAME を MAX 以下の長さに短縮する."
  (let ((filename (e:unexpand filename))
        (max (or max (window-width)))
        (target 3)
        (break nil))
    (while (and (> (length filename) max)
                (not break))
      (let ((parts (split-string filename "/")))
        (if (> (length parts) (+ target 2))
            (progn
              (if (equal (nth target parts) "...")
                  (setq parts (remove (nth (+ target 1) parts) parts))
                (setf (nth target parts) "..."))
              (setq filename (string-join parts "/")))
          (setq break t))))
    filename))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; その他便利なやつ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun e:bottom-left-window ()
  "分割されたウィンドウのうち左下のものを取得する."
  (car (--sort (> (window-top-line it) (window-top-line other))
               (--filter (zerop (window-left-column it)) (window-list)))))

(defun e:auth-source-get (property &rest spec)
  "認証情報から SPEC に一致する項目の PROPERTY を取得する."
  (let ((plist (car (apply 'auth-source-search spec)))
        (pkey (intern (format ":%s" property))))
    (when plist
      (plist-get plist pkey))))

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

(cl-defun e:set-font (fontname &key target (size 9))
  "FONTNAME で指定したフォントが存在する場合に、高さ HEIGHT でフォントを設定する."
  (let ((font (font-spec :family fontname :size size))
        (height (* size 10)))
    (when (find-font font)
      (if target
          (set-fontset-font t target font)
        (set-face-attribute 'default nil :family fontname :height height))
      t)))

(defmacro e:safe-exec (sexplist)
  "SEXPLIST を安全に実行する."
  `(if (fboundp (car ',sexplist))
       ,sexplist))

(defun e:loaded ()
  "ロード完了のメッセージをログに出力."
  (when load-in-progress
    (message "*Loading %s...done"
             (file-name-sans-extension (file-name-nondirectory load-file-name)))))

(defun e:ghq-get-path (name)
  "NAME で指定したディレクトリを取得する."
  (when (and (require 's nil t)
             (executable-find "ghq"))
    (let ((path (s-trim (shell-command-to-string (format "ghq list | grep %s" name)))))
      (unless (s-blank-p path)
        (e:expand path (s-trim (shell-command-to-string "ghq root")))))))

(defun e:ghq-add-load-path (name)
  "NAME で指定したディレクトリを`load-path'に追加する."
  (let ((path (e:ghq-get-path name)))
    (when path
      (add-to-list 'load-path path))))

(e:loaded)
(provide 'init-enhance)
;;; init-enhance.el ends here
