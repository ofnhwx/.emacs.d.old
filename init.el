;;; init.el --- load this file at first when emacs was started.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/06/05 23:44:10>
;;

;;; Commentary:

;;; Code:

;; use:`cl'
(require 'cl-lib)

;; load:`init-enhance', `init-custom', `init-setup'
(cl-eval-when (compile load eval)
  (let* ((default-directory user-emacs-directory)
         (enhance (expand-file-name "init-enhance"))
         (config  (expand-file-name "init-config"))
         (setup   (expand-file-name "init-setup")))
    (require 'init-enhance enhance t)
    (require 'init-config  config  t)
    (require 'init-setup   setup   t)))

;; add:`load-path'
(add-to-list 'load-path (e:expand "lisp" :user))

;; use:`@libraries'
(use-package "dash" :ensure t)
(use-package "f"    :ensure t)
(use-package "s"    :ensure t)
(use-package "deferred"   :ensure t)
(use-package "concurrent" :ensure t)
(use-package "cl-lib-highlight"
  :ensure t
  :config
  (cl-lib-highlight-initialize)
  (cl-lib-highlight-warn-cl-initialize))

;; 各種パッケージ設定

(use-package "exec-path-from-shell"
  :if (not (os-type-win-p))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package "ace-jump-mode"
  :ensure t
  :config
  (use-package "ace-link"
    :ensure t
    :config
    (ace-link-setup-default))
  (use-package "ace-window"
    :ensure t))

(use-package "ag"
  :if (executable-find "ag")
  :ensure t)

(use-package "all"
  :ensure t
  :config
  (use-package "all-ext"
    :ensure t))

(use-package "anzu"
  :ensure t
  :config
  (custom-set-variables
   '(global-anzu-mode 1)))

(use-package "auto-save-buffers-enhanced"
  :ensure t
  :config
  (custom-set-variables
   '(auto-save-buffers-enhanced-quiet-save-p t)
   '(auto-save-buffers-enhanced-interval 3)
   ;; for `*scratch*'
   '(auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
   '(auto-save-buffers-enhanced-file-related-with-scratch-buffer
     (e:expand ".scratch" :conf)))
  (auto-save-buffers-enhanced t))

(use-package "bar-cursor"
  :ensure t
  :config
  (bar-cursor-mode 1))

(use-package "color-moccur"
  :ensure t
  :config
  (use-package "moccur-edit"
    :ensure t))

(use-package "company"
  :ensure t
  :config
  (custom-set-variables
   ;; 補完候補をすぐに表示
   '(company-idle-delay 0)
   ;; 補完開始文字数
   '(company-minimum-prefix-length 2)
   ;; 上下でループ
   '(company-selection-wrap-around t))
  ;; ヘルパー関数
  (defun add-company-backends (backends)
    (make-local-variable 'company-backends)
    (dolist (backend backends company-backends)
      (add-to-list 'company-backends backend)))
  ;; PHP補完
  (when (and (e:require-package 'ac-php t t)
             (e:require-package 'company-php t t))
    (custom-set-variables
     '(ac-php-tags-path (e:expand "ac-php" :conf)))
    (defun add-company-php-backends ()
      (add-company-backends '(company-ac-php-backend)))
    (eval-after-load "php-mode"
      (add-hook 'php-mode-hook 'add-company-php-backends))
    (eval-after-load "web-mode"
      (add-hook 'web-mode-hook 'add-company-php-backends)))
  ;; WEB補完
  (when (e:require-package 'company-web t t)
    (defun add-company-web-backends ()
      (add-company-backends '(company-web-html)))
    (eval-after-load "web-mode"
      (add-hook 'web-mode-hook 'add-company-web-backends)))
  ;; 全バッファで有効化
  (global-company-mode))

(use-package "edbi"
  :ensure t
  :config
  (custom-set-variables
   '(edbi:ds-history-file (e:expand ".edbi-ds-history" :conf))))

(use-package "expand-region"
  :ensure t)

(use-package "flycheck"
  :ensure t
  :config
  (custom-set-variables
   '(global-flycheck-mode t))
  (eval-after-load "web-mode"
    (flycheck-add-mode 'php 'web-mode)))

(use-package "free-keys"
  :ensure t)

(use-package "git-gutter-fringe"
  :if window-system
  :ensure t
  :config
  (global-git-gutter-mode))
(use-package "git-gutter"
  :if (not window-system)
  :ensure t
  :config
  (global-git-gutter-mode))

(use-package "guide-key"
  :ensure t
  :config
  (custom-set-variables
   '(guide-key/guide-key-sequence
     '( ;; `multiple-cursors'
       "C-t"
       ;; ウィンドウ関連
       "C-x 4"
       ;; フレーム関連
       "C-x 5"
       ;; `two-column'
       "C-x 6"
       ;; 特殊文字
       "C-x 8" "C-x 8 \"" "C-x 8 '" "C-x 8 *" "C-x 8 ," "C-x 8 1"
       "C-x 8 3" "C-x 8 /" "C-x 8 ^" "C-x 8 ~" "C-x 8 _"
       ;; `abbrev'
       "C-x a"
       ;; レジスタ・矩型選択
       "C-x r"
       ;; 修飾子
       "C-x @"
       ;; 文字コード
       "C-x <RET>"))
   '(guide-key/popup-window-position 'right)
   '(guide-key-mode t)))

(use-package "helm"
  :ensure t
  :config
  (use-package "helm-backup"
    :ensure t)
  (use-package "helm-descbinds"
    :ensure t)
  (eval-after-load "ag"
    (use-package "helm-ag"
      :ensure t))
  (eval-after-load "yasnippet"
    (use-package "helm-c-yasnippet"
      :ensure t)))

(use-package "lacarte"
  :ensure t)

(use-package "magit"
  :ensure t
  :config
  (use-package "magit-gitflow"
    :ensure t
    :config
    (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)))

(use-package "migemo"
  :if (executable-find "cmigemo")
  :ensure t
  :config
  (custom-set-variables
   '(migemo-options '("-q" "--emacs"))
   '(migemo-user-dictionary nil)
   '(migemo-regex-dictionary nil)
   '(migemo-coding-system 'utf-8-unix))
  ;; for:`mac'
  (when (os-type-mac-p)
    (custom-set-variables
     '(migemo-command (executable-find "cmigemo"))
     '(migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")))
  ;; 有効化
  (migemo-init))

(use-package "multiple-cursors"
  :ensure t
  :config
  (custom-set-variables
   '(mc/list-file (e:expand ".mc-lists.el" :conf))))

(use-package "neotree"
  :ensure t
  :config
  (custom-set-variables
   ;; 隠しファイルをデフォルトで表示
   '(neo-show-hidden-files t)
   ;; neotree でファイルを新規作成した後、自動的にファイルを開く
   '(neo-create-file-auto-open t)
   ;; delete-other-window で neotree ウィンドウを消さない
   '(neo-persist-show t)
   ;; キーバインドをシンプルにする
   '(neo-keymap-style 'concise)
   ;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
   '(neo-smart-open t))
  (when neo-persist-show
    (add-hook 'popwin:before-popup-hook (lambda () (setq neo-persist-show nil)))
    (add-hook 'popwin:after-popup-hook  (lambda () (setq neo-persist-show t)))))

(use-package "popwin"
  :ensure t
  :config
  (setq display-buffer-function 'popwin:display-buffer))

(use-package "powerline"
  :ensure t
  :config
  (powerline-default-theme))

(use-package "smartparens"
  :ensure t
  :config
  (smartparens-global-mode t))

(use-package "sunrise-commander"
  :load-path "lisp/sunrise-commander")

(use-package "tempbuf"
  :config
  (defmacro enable-tempbuf--hook (hook)
    `(add-hook ,hook 'turn-on-tempbuf-mode))
  (enable-tempbuf--hook 'dired-mode-hook))

(use-package "undo-tree"
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package "yasnippet"
  :ensure t
  :config
  '(yas-global-mode t)
  ;; スニペット名をidoで選択する
  '(yas-prompt-functions '(yas-ido-prompt)))

;; 標準パッケージの追加設定

(use-package "dired"
  :config
  (use-package "dired+"
    :ensure t))

(use-package "eldoc"
  :config
  (use-package "eldoc-extension"
    :ensure t))

(use-package "linum"
  :config
  (use-package "hlinum"
    :ensure t
    :config
    (hlinum-activate)))

(use-package "ido"
  :config
  (use-package "ido-at-point"
    :ensure t
    :config
    (ido-at-point-mode))
  (use-package "ido-complete-space-or-hyphen"
    :ensure t)
  (use-package "ido-hacks"
    :ensure t
    :config
    (custom-set-variables
     '(ido-hacks-mode t)))
  (use-package "ido-ubiquitous"
    :ensure t
    :config
    (custom-set-variables
     '(ido-ubiquitous-mode t)))
  (use-package "ido-vertical-mode"
    :ensure t
    :config
    (custom-set-variables
     '(ido-vertical-mode t)))
  (use-package "ido-yes-or-no"
    :ensure t
    :config
    (custom-set-variables
     '(ido-yes-or-no-mode t)))
  (use-package "idomenu"
    :ensure t))

(use-package "menu-bar"
  :config
  (use-package "menu-bar+"
    :ensure t))

(use-package "minimap"
  :ensure t
  :config
  (custom-set-variables
   '(minimap-window-location 'right)))

(use-package "recentf"
  :config
  (use-package "recentf-ext"
    :ensure t))

;; モード関連の設定

(use-package "cobol-mode"
  :mode (("\\.cob\\'" . cobol-mode)
         ("\\.cbl\\'" . cobol-mode)
         ("\\.lst\\'" . cobol-mode)
         ("\\.pco\\'" . cobol-mode)
         ("\\.pcom\\'" . cobol-mode))
  :config
  (use-package "column-marker"
    :ensure t)
  (custom-set-variables
   '(cobol-column-marker-1 6)
   '(cobol-column-marker-2 72)))

(use-package "php-mode"
  :ensure t
  :commands (php-mode)
  :config
  ;; 各種設定
  (custom-set-variables
   '(php-mode-force-pear t)
   '(php-manual-path (e:expand "php-chunked-xhtml" :conf))
   '(php-search-url "http://www.php.net/")
   '(php-manual-url "http://www.php.net/manual/ja"))
  ;; symfonyのスタイルを有効に
  (add-hook 'php-mode-hook
            'php-enable-symfony2-coding-style))

(use-package "yaml-mode"
  :ensure t
  :mode (("\\.yaml\\'" . yaml-mode)))

(use-package "web-mode"
  :ensure t
  :mode (("\\.php\\'" . web-mode)))

;; キーバインドの設定

(let* ((default-directory user-emacs-directory)
       (keybind (expand-file-name "init-keybind")))
  (require 'init-keybind keybind t))

(provide 'init)
;;; init.el ends here
