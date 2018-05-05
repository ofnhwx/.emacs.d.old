;;; 20_company.el --- configurations.
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :init
  (set-variable 'company-lighter-base "C")
  (set-variable 'company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance))
  (set-variable 'company-idle-delay 0)
  (set-variable 'company-minimum-prefix-length 1)
  (set-variable 'company-selection-wrap-around t)
  :config
  (defun set-company-backends (backends)
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends (--filter (or (fboundp it) (eq it :with)) backends)))
  (add-hook 'prog-mode-hook 'company-mode))

(use-package company
  :no-require t
  :after (smartparens)
  :config
  ;; `smartparens'を一時的に無効にする
  (defvar company-smartparens-enabled nil
    "`company'の補完中に`smartparens'の状態を保存しておく変数.")
  (defun disable-smartparens-with-company (arg)
    "`company'での補完開始時に`smartparens'を無効にする.引数 ARG は未使用."
    (setq company-smartparens-enabled smartparens-global-mode)
    (smartparens-global-mode 0))
  (defun revert-smartparens-with-company (arg)
    "`company'での補完終了時に`smartparens'の状態を戻す.引数 ARG は未使用."
    (when company-smartparens-enabled
      (smartparens-global-mode 1)))
  (add-hook 'company-completion-started-hook   'disable-smartparens-with-company)
  (add-hook 'company-completion-finished-hook  'revert-smartparens-with-company)
  (add-hook 'company-completion-cancelled-hook 'revert-smartparens-with-company))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company-php
  :after (company)
  :ensure t
  :defer t
  :init
  (set-variable 'ac-php-tags-path (e:expand "ac-php" :cache)))

(use-package company-web
  :after (company)
  :ensure t
  :defer t)

(use-package company-irony
  :after (company irony)
  :ensure t
  :defer t)

(use-package company-irony-c-headers
  :after (company irony)
  :ensure t
  :defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :no-require t
  :after (php-mode)
  :config
  (defun company-php-setup()
    (let (backends)
      (add-to-list 'backends 'company-dabbrev-code)
      (add-to-list 'backends 'company-ac-php-backend)
      (set-company-backends backends)))
  (add-hook 'php-mode-hook 'company-php-setup))

(use-package company
  :no-require t
  :after (web-mode)
  :config
  (defun company-web-setup()
    (let (backends)
      (add-to-list 'backends 'company-dabbrev-code)
      (add-to-list 'backends 'company-ac-php-backend)
      (add-to-list 'backends 'company-web-html)
      (set-company-backends backends)))
  (add-hook 'web-mode-hook 'company-web-setup))

(use-package company
  :no-require t
  :after (irony)
  :config
  (defun company-irony-setup ()
    (set-company-backends '(company-irony company-irony-c-headers :with company-dabbrev-code company-yasnippet)))
  (add-hook 'irony-mode-hook 'company-irony-setup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [2016-06-14] - とりあえず`ac-php'を`web-mode'でも動くように
(use-package company-php
  :no-require t
  :config
  (defun company-ac-php-backend (command &optional arg &rest ignored)
    (interactive (list 'interactive))
    (case command
      (interactive (company-begin-backend 'company-ac-php-backend))
      (prefix (and (or (eq major-mode 'php-mode)
                       (eq major-mode 'web-mode))
                   (company-ac-php--prefix)))
      (candidates (company-ac-php-candidate arg))
      (annotation (company-ac-php-annotation arg))
      (duplicates t)
      (post-completion
       (let((doc))
         (when (ac-php--tag-name-is-function arg)
           (setq doc (ac-php-clean-document (get-text-property 0 'ac-php-help arg)))
           (insert (concat doc ")"))
           (company-template-c-like-templatify (concat arg doc ")"))))))))

(provide '20_company)
;;; 20_company.el ends here
