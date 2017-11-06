;;; 40_web-mode.el --- setup web-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/01 11:39:50>
;;

;;; Commentary:

;;; Code:

(use-package web-mode
  :if (e:require-package 'web-mode)
  :mode (("\\.twig\\'" . web-mode))
  :init
  (set-variable 'web-mode-comment-keywords "\\(?:BUG\\|FIXME\\|HACK\\|KLUDGE\\|OPTIMIZE\\|RE\\(?:FACTOR\\|VIEW\\)\\|TODO\\|WORKAROUND\\|XXX\\|MEMO\\)")
   ;; offset
  (set-variable 'web-mode-markup-indent-offset 2)
  (set-variable 'web-mode-css-indent-offset    2)
  (set-variable 'web-mode-code-indent-offset   4)
  (set-variable 'web-mode-attr-indent-offset   2)
   ;; padding
  (set-variable 'web-mode-style-padding  2)
  (set-variable 'web-mode-script-padding 2)
  (set-variable 'web-mode-block-padding  2)
  :config
  ;; インデント再調整
  (with-eval-after-load "editorconfig"
    (add-hook
     'editorconfig-custom-hooks
     (lambda (props)
       (setq web-mode-script-padding 2)
       (setq web-mode-style-padding  2)
       (setq web-mode-block-padding  2)))))

(provide '40_web-mode)
;;; 40_web-mode.el ends here
