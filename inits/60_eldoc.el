;;; 60_eldoc.el --- configurations.
;;; Commentary:
;;; Code:

(use-package eldoc
  :diminish eldoc-mode
  :hook
  ((emacs-lisp-mode-hook . turn-on-eldoc-mode)
   (lisp-interaction-mode-hook . turn-on-eldoc-mode)
   (ielm-mode-hook . turn-on-eldoc-mode))
  :custom
  (eldoc-idle-delay 0)
  (eldoc-echo-area-use-multiline-p t))

(use-package eldoc-extension
  :after (eldoc)
  :if (progn (quelpa '(eldoc-extension :fetcher github :repo "emacsmirror/eldoc-extension"))
             (locate-library "eldoc-extension")))

(use-package php-eldoc
  :after (eldoc)
  :ensure t
  :hook (php-mode-hook . php-eldoc-enable))

(use-package irony-eldoc
  :after (eldoc)
  :ensure t
  :hook (irony-mode-hook . irony-eldoc))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
