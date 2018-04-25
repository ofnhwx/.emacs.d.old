;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:45:48>
;;

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
  :after (eldoc))

(use-package php-eldoc
  :after (eldoc php-mode)
  :config
  (add-hook 'php-mode-hook 'php-eldoc-enable))

(use-package irony-eldoc
  :after (eldoc irony)
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc))

(provide '60_eldoc)
;;; 60_eldoc.el ends here
