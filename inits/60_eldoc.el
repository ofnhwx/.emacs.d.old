;;; 60_eldoc.el --- setup eldoc.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:48:21>
;;

;;; Commentary:

;;; Code:

(use-package eldoc
  :diminish eldoc-mode)

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
