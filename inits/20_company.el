;;; 20_company.el --- configurations.
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :custom
  (company-lighter-base "C")
  (company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance))
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (ompany-selection-wrap-around t)
  :config
  (defun set-company-backends (backends)
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends (--filter (or (fboundp it) (eq it :with)) backends)))
  (global-company-mode))

(use-package company
  :no-require t
  :after (smartparens)
  :hook
  ((company-completion-started   . disable-smartparens-with-company)
   (company-completion-finished  . revert-smartparens-with-company)
   (company-completion-cancelled . revert-smartparens-with-company))
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
      (smartparens-global-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company-php
  :after (company php-mode)
  :ensure t
  :defer t
  :custom
  (ac-php-tags-path (e:expand "ac-php" :cache)))

(use-package company-web
  :after (company web-mode)
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
  :hook (php-mode . company-php-setup)
  :config
  (defun company-php-setup()
    (set-company-backends '(company-ac-php-backend :with company-dabbrev-code))))

(use-package company
  :no-require t
  :after (web-mode)
  :hook (web-mode . company-web-setup)
  :config
  (defun company-web-setup()
    (set-company-backends '(company-ac-php-backend company-web-html :with company-dabbrev-code))))

(use-package company
  :no-require t
  :after (irony)
  :hook (irony-mode . company-irony-setup)
  :config
  (defun company-irony-setup ()
    (set-company-backends '(company-irony company-irony-c-headers :with company-dabbrev-code company-yasnippet))))

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
