;;; 20_emmet-mode.el --- setup emmet-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 16:06:41>
;;

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :bind
  (:map emmet-mode-keymap
        ("<C-return>" . nil)
        ("C-c C-j" . emmet-expand-line)
        ("C-j" . nil))
  :init
  (set-variable 'emmet-indentation 2))

(use-package emmet-mode
  :after (php-mode)
  :config
  (add-hook 'php-mode-hook 'emmet-mode))

(use-package emmet-mode
  :after (web-mode)
  :config
  (add-hook 'web-mode-hook 'emmet-mode))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
