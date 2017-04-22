;;; 20_yasnippet.el --- setup yasnippet.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:11:57>
;;

;;; Commentary:

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  '(yas-global-mode t)
  ;; スニペット名をidoで選択する
  '(yas-prompt-functions '(yas-ido-prompt)))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
