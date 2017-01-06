;;; init.el --- load this file at first when emacs was started.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/01/06 17:24:32>
;;

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;; use:`cl'
(require 'cl-lib)

;; load:`init-enhance', `init-custom', `init-setup'
(cl-eval-when (compile load eval)
  (let* ((default-directory user-emacs-directory)
         (enhance (expand-file-name "init-enhance"))
         (config  (expand-file-name "init-config"))
         (color   (expand-file-name "init-color"))
         (setup   (expand-file-name "init-setup")))
    (require 'init-enhance enhance t)
    (require 'init-config  config  t)
    (require 'init-color   color   t)
    (require 'init-setup   setup   t)))

(set-variable 'custom-file (e:expand "custom.el" :local))

;; add:`load-path'
(add-to-list 'load-path (e:expand "lisp" :user))

;; use:`@libraries'
(use-package "dash" :ensure t)
(use-package "f"    :ensure t)
(use-package "s"    :ensure t)
(use-package "deferred"   :ensure t)
(use-package "concurrent" :ensure t)
(use-package "windata"    :ensure t)
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
  :diminish anzu-mode
  :config
  (custom-set-variables
   '(global-anzu-mode 1)))

(use-package "ctags-update"
  :if (executable-find "ctags")
  :ensure t
  :config
  (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode))

(use-package "auto-save-buffers-enhanced"
  :ensure t
  :config
  (custom-set-variables
   '(auto-save-buffers-enhanced-quiet-save-p t)
   '(auto-save-buffers-enhanced-interval 3)
   ;; for `*scratch*'
   '(auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
   '(auto-save-buffers-enhanced-file-related-with-scratch-buffer
     (e:expand ".scratch" :local)))
  (auto-save-buffers-enhanced t))

(use-package "auto-shell-command"
  :ensure t
  :config
  (defun ascmd:toggle--display-status ()
    (message "ascmd: %s." (if ascmd:active "enabled" "disabled")))
  (advice-add 'ascmd:toggle :after 'ascmd:toggle--display-status)
  (e:load-config "auto-shell-command" t))

(use-package "avy"
  :ensure t
  :config
  (use-package "ace-link"
    :ensure t
    :config
    (ace-link-setup-default))
  (use-package "ace-window"
    :ensure t)
  (use-package "avy-zap"
  :ensure t)
  (use-package "avy-migemo"
    :ensure t
    :config
    (avy-migemo-mode 1)))

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
  :diminish company-mode
  :config
  (e:load-config "company")
  (global-company-mode))

(use-package "counsel"
  :ensure t
  :config
  (counsel-mode 1)
  (ivy-mode 1)
  (when (executable-find "rg")
    (custom-set-variables
     '(counsel-grep-base-command "rg --color never --no-heading --smart-case --vimgrep \"%s\" %s")))
  (custom-set-variables
   '(ivy-height 15)))

(use-package "dumb-jump"
  :ensure t)

(use-package "eclim"
  :ensure t
  :config
  (global-eclim-mode))

(use-package "edbi"
  :ensure t
  :config
  (custom-set-variables
   '(edbi:ds-history-file (e:expand ".edbi-ds-history" :local))))

(use-package "editorconfig"
  :ensure t
  :config
  (editorconfig-mode))

(use-package "elscreen"
  :ensure t
  :config
  (custom-set-variables
   '(elscreen-prefix-key (kbd "C-z"))
   '(elscreen-tab-display-kill-screen nil))
  (elscreen-start))

(use-package "emmet-mode"
  :ensure t
  :config
  (with-eval-after-load "php-mode"
    (add-hook 'php-mode-hook 'emmet-mode))
  (with-eval-after-load "web-mode"
    (add-hook 'web-mode-hook 'emmet-mode))
  (custom-set-variables
   '(emmet-indentation 2)))

(use-package "expand-region"
  :ensure t)

(use-package "flycheck"
  :ensure t
  :config
  (custom-set-variables
   '(global-flycheck-mode t))
  (with-eval-after-load "web-mode"
    (flycheck-add-mode 'html-tidy 'web-mode)
    (flycheck-add-mode 'php 'web-mode)))

(use-package "free-keys"
  :ensure t)

(use-package "git-gutter-fringe"
  :if window-system
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))
(use-package "git-gutter"
  :if (not window-system)
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(use-package "google-translate"
  :ensure t
  :config
  (defvar google-translate-english-chars "[:ascii:]’“”–"
    "これらの文字が含まれているときは英語とみなす")
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
          (cond ((stringp string)   string)
                (current-prefix-arg (read-string "Google Translate: "))
                ((use-region-p)     (buffer-substring (region-beginning) (region-end)))
                (t (save-excursion
                     (let (s)
                       (forward-char 1)
                       (backward-sentence)
                       (setq s (point))
                       (forward-sentence)
                       (buffer-substring s (point)))))))
    (let* ((asciip (string-match (format "\\`[%s]+\\'" google-translate-english-chars) string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate (if asciip "en" "ja") (if asciip "ja" "en") string))))

(use-package "helm"
  :ensure t
  :config
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (custom-set-variables
   '(helm-display-function 'my/helm-display-buffer))
  (use-package "helm-backup"       :ensure t)
  (use-package "helm-descbinds"    :ensure t)
  (use-package "helm-flx"
    :ensure t
    :config
    (helm-flx-mode 1))
  (use-package "helm-mode-manager" :ensure t)
  (use-package "helm-swoop"        :ensure t)
  (use-package "helm-ag"
    :ensure t
    :config
    (cond
     ;; ripgrep
     ((executable-find "rg")
      (custom-set-variables
       '(helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep")))
     ;; The Platinum Searcher
     ((executable-find "pt")
      (custom-set-variables
       '(helm-ag-base-command "pt --nocolor --nogroup --smart-case")))))
  (use-package "helm-flycheck"     :ensure t)
  (use-package "helm-projectile"   :ensure t)
  (use-package "helm-c-yasnippet"  :ensure t))

(use-package "lacarte"
  :ensure t)

(use-package "magit"
  :ensure t
  :config
  (custom-set-variables
   ;; 行内の差分に色付けする
   '(magit-diff-refine-hunk 'all)
   ;; 空白の差を無視しない
   '(smerge-refine-ignore-whitespace nil))
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
   '(mc/list-file (e:expand ".mc-lists.el" :local))))

(use-package "php-eldoc"
  :ensure t
  :config
  (add-hook 'php-mode-hook 'php-eldoc-enable)
  (add-hook 'web-mode-hook 'php-eldoc-enable))

(use-package "popwin"
  :ensure t
  :config
  (popwin-mode 1))

(use-package "powerline"
  :ensure t
  :config
  (e:load-config "powerline"))

(use-package "projectile"
  :ensure t
  :diminish projectile-mode
  :init
  (custom-set-variables
   '(projectile-keymap-prefix (kbd "C-x p")))
  :config
  (custom-set-variables
   '(projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :local))
   '(projectile-cache-file (e:expand "projectile.cache" :local)))
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile-find-file arg)
      (helm-find-files arg)))
  (projectile-global-mode))

(use-package "psysh"
  :if (executable-find "psysh")
  :ensure t)

(use-package "string-edit"
  :ensure t)

(use-package "rainbow-mode"
  :ensure t
  :diminish rainbow-mode
  :config
  (add-hook 'lisp-interaction-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'php-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode))

(use-package "smartparens"
  :ensure t
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(use-package "sudo-edit"
  :ensure t)

(use-package "tempbuf"
  :config
  (defmacro enable-tempbuf--hook (hook)
    `(add-hook ,hook 'turn-on-tempbuf-mode)))

(use-package "twittering-mode"
  :ensure t
  :config
  (custom-set-variables
   '(twittering-use-master-password t)))

(use-package "undo-tree"
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(use-package "undohist"
  :ensure t
  :config
  (custom-set-variables
   '(undohist-directory (e:expand "undohist" :local))
   '(undohist-ignored-files '(".authinfo.gpg")))
  ;; 無効リストに登録されているファイルのUndo履歴を保存させない
  (defun undohist-save-1--with-ignored ()
    (let ((file (make-undohist-file-name (buffer-file-name))))
      (undohist-recover-file-p file)))
  (advice-add 'undohist-save-1 :before-while 'undohist-save-1--with-ignored)
  ;;
  (undohist-initialize))

(use-package "visual-regexp"
  :ensure t)

(use-package "which-key"
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

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
  :diminish eldoc-mode
  :config
  (use-package "eldoc-extension"
    :ensure t))

(use-package "linum"
  :config
  (use-package "hlinum"
    :ensure t
    :config
    (hlinum-activate)))

(use-package "hideshow"
  :diminish hs-minor-mode)

(use-package "ido"
  :config
  (use-package "bbyac"
    ;; 単体ではなく`ido'がある場合のみ使用する
    :ensure t
    :config
    (custom-set-variables
     '(bbyac-max-chars 99999))
    (defun bbyac--display-matches--use-ido (orig strlist)
      (cond ((null (cdr strlist))
             (car strlist))
            ((cl-notany #'bbyac--string-multiline-p strlist)
             (ido-completing-read "Bbyac: " strlist nil t))
            (t (apply orig strlist))))
    (advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido))
  (use-package "flx-ido"
    :ensure t
    :config
    (flx-ido-mode))
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

(use-package "shell-pop"
  :ensure t
  :config
  (custom-set-variables
   '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   `(shell-pop-term-shell ,(executable-find "fish"))
   '(shell-pop-window-position "bottom")
   '(shell-pop-window-size 30)
   '(shell-pop-full-span t)))

(use-package "term"
  :config
  (use-package "term+"
    :ensure t)
  (use-package "term+mux"
    :ensure t))

(use-package "volatile-highlights"
  :ensure t
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode 1))

(use-package "whitespace"
  :diminish global-whitespace-mode)

;; モード関連の設定

(use-package "android-mode"
  :ensure t
  :config
  (custom-set-variables
   '(android-mode-sdk-dir "~/Library/Android/sdk")))

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

(use-package "csv-mode"
  :ensure t)

(use-package "php-mode"
  :ensure t
  :commands (php-mode)
  :config
  ;; 各種設定
  (custom-set-variables
   '(php-mode-force-pear t)
   '(php-manual-path (e:expand "php-chunked-xhtml" :local))
   '(php-search-url "http://www.php.net/")
   '(php-manual-url "http://www.php.net/manual/ja"))
  ;; symfonyのスタイルを有効に
  (add-hook 'php-mode-hook
            'php-enable-symfony2-coding-style))

(use-package "vimrc-mode"
  :ensure t)

(use-package "yaml-mode"
  :ensure t)

(use-package "web-mode"
  :ensure t
  :mode (("\\.twig\\'" . web-mode))
  :config
  (custom-set-variables
   '(web-mode-comment-keywords "\\(?:BUG\\|FIXME\\|HACK\\|KLUDGE\\|OPTIMIZE\\|RE\\(?:FACTOR\\|VIEW\\)\\|TODO\\|WORKAROUND\\|XXX\\|MEMO\\)")
   ;; offset
   '(web-mode-markup-indent-offset 2)
   '(web-mode-css-indent-offset    2)
   '(web-mode-code-indent-offset   4)
   '(web-mode-attr-indent-offset   2)
   ;; padding
   '(web-mode-style-padding  1)
   '(web-mode-script-padding 1)
   '(web-mode-block-padding  0))
  (with-eval-after-load "editorconfig"
    (add-hook
     'editorconfig-custom-hooks
     (lambda (props)
       (setq web-mode-script-padding 1)
       (setq web-mode-style-padding  1)
       (setq web-mode-block-padding  0)))))

;; キーバインドの設定
(require 'init-keybind (e:expand "init-keybind" :user) t)

;; カスタムファイル
;(load custom-file t)

(provide 'init)
;;; init.el ends here
