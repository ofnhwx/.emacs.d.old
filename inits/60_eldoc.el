;;; 60_eldoc.el --- configurations.
;;; Commentary:
;;; Code:

(use-package eldoc
  :diminish eldoc-mode
  :init
  (set-variable 'eldoc-idle-delay 0)
  (set-variable 'eldoc-echo-area-use-multiline-p t)
  :config
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

(use-package eldoc-extension
  :after (eldoc)
  :if (progn (quelpa '(eldoc-extension :fetcher github :repo "emacsmirror/eldoc-extension"))
             (locate-library "eldoc-extension")))

(use-package php-eldoc
  :after (eldoc)
  :ensure t
  :config
  (add-hook 'php-mode-hook 'php-eldoc-enable))

(use-package irony-eldoc
  :after (eldoc)
  :ensure t
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
