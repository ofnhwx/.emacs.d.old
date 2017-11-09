;;; 98_bridge.el --- setup bridge.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:42:32>
;;

;;; Commentary:

;;; Code:

(with-eval-after-load "emmet-mode"
  (with-eval-after-load "php-mode"
    (add-hook 'php-mode-hook 'emmet-mode))
  (with-eval-after-load "web-mode"
    (add-hook 'web-mode-hook 'emmet-mode)))

(with-eval-after-load "ctags-update"
  (with-eval-after-load "php-mode"
    (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode)))

(with-eval-after-load "flycheck"
  (with-eval-after-load "web-mode"
    (flycheck-add-mode 'html-tidy 'web-mode)
    (flycheck-add-mode 'php       'web-mode)))

(with-eval-after-load "php-eldoc"
  (with-eval-after-load "php-mode"
    (add-hook 'php-mode-hook 'php-eldoc-enable))
  (with-eval-after-load "web-mode"
    (add-hook 'web-mode-hook 'php-eldoc-enable)))

(with-eval-after-load "rainbow-mode"
  (add-hook 'lisp-interaction-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook       'rainbow-mode)
  (add-hook 'html-mode-hook             'rainbow-mode)
  (add-hook 'css-mode-hook              'rainbow-mode)
  (with-eval-after-load "php-mode"
    (add-hook 'php-mode-hook 'rainbow-mode))
  (with-eval-after-load "web-mode"
    (add-hook 'web-mode-hook 'rainbow-mode)))

(provide '98_bridge)
;;; 98_bridge.el ends here
