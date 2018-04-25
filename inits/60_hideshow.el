;;; 60_hideshow.el --- setup hideshow.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:48:59>
;;

;;; Commentary:

;;; Code:

(use-package hideshow
  :diminish hs-minor-mode
  :init
  (add-hook 'lisp-interaction-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'lisp-mode-hook 'hs-minor-mode)
  (add-hook 'css-mode-hook 'hs-minor-mode)
  (add-hook 'php-mode-hook 'hs-minor-mode)
  (add-hook 'web-mode-hook 'hs-minor-mode))

(provide '60_hideshow)
;;; 60_hideshow.el ends here
