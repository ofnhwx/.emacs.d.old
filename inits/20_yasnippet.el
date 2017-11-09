;;; 20_yasnippet.el --- setup yasnippet.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:15:34>
;;

;;; Commentary:

;;; Code:

(use-package yasnippet
  :if (e:require-package 'yasnippet)
  :config
  '(yas-global-mode t)
  ;; スニペット名をidoで選択する
  '(yas-prompt-functions '(yas-ido-prompt)))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
