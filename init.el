;;; init.el --- load this file at first when emacs was started.
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パス設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((emacs-dir (file-name-directory (or load-file-name buffer-file-name))))
  (setq user-emacs-directory (abbreviate-file-name emacs-dir))
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; `cl-lib'を使用する
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 個人用の拡張・設定を読み込み
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-enhance)
(require 'init-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パッケージ関連の初期設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'package-pinned-packages '(use-package . "melpa"))
(e:add-package-repository "melpa-stable" "https://stable.melpa.org/packages/" 10)
(e:add-package-repository "melpa" "https://melpa.org/packages/")
(e:package-initialize)

(unless (require 'use-package nil t)
  (package-install 'use-package))

(use-package use-package
  :custom
  (use-package-check-before-init t)
  (use-package-verbose t)
  (use-package-minimum-reported-time 0.1)
  :config
  (use-package bind-key :ensure t)
  (use-package diminish :ensure t))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package quelpa
  :ensure t
  :init
  (set-variable 'quelpa-dir (e:expand "quelpa" :cache)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 共通で使用するライブラリ等をロード
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dash    :ensure t)
(use-package f       :ensure t)
(use-package s       :ensure t)
(use-package windata :ensure t)
(use-package hydra   :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 各種パッケージ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-loader
  :ensure t
  :init
  (set-variable 'init-loader-directory (e:expand "inits" :user))
  :config
  (unless (file-directory-p init-loader-directory)
    (make-directory init-loader-directory t))
  (init-loader-load))

(provide 'init)
;;; init.el ends here
