;;; 98_bridge.el --- setup bridge.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/29 11:17:49>
;;

;;; Commentary:

;;; Code:

(with-eval-after-load "php-mode"
  (with-eval-after-load "ctags-update"
    (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode))
  (with-eval-after-load "emmet-mode"
    (add-hook 'php-mode-hook 'emmet-mode))
  (with-eval-after-load "php-eldoc"
    (add-hook 'php-mode-hook 'php-eldoc-enable))
  (with-eval-after-load "rainbow-mode"
    (add-hook 'php-mode-hook 'rainbow-mode)))

(with-eval-after-load "web-mode"
  (with-eval-after-load "emmet-mode"
    (add-hook 'web-mode-hook 'emmet-mode))
  (with-eval-after-load "flycheck"
    (flycheck-add-mode 'html-tidy 'web-mode)
    (flycheck-add-mode 'php       'web-mode))
  (with-eval-after-load "php-eldoc"
    (add-hook 'web-mode-hook 'php-eldoc-enable))
  (with-eval-after-load "rainbow-mode"
    (add-hook 'web-mode-hook 'rainbow-mode)))

(provide '98_bridge)
;;; 98_bridge.el ends here
