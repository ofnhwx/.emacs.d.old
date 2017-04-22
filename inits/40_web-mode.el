;;; 40_web-mode.el --- setup web-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:45:39>
;;

;;; Commentary:

;;; Code:

(use-package web-mode
  :ensure t
  :mode (("\\.twig\\'" . web-mode))
  :config
  (custom-set-variables
   '(web-mode-comment-keywords "\\(?:BUG\\|FIXME\\|HACK\\|KLUDGE\\|OPTIMIZE\\|RE\\(?:FACTOR\\|VIEW\\)\\|TODO\\|WORKAROUND\\|XXX\\|MEMO\\)")
   ;; offset
   '(web-mode-markup-indent-offset 2)
   '(web-mode-css-indent-offset    2)
   '(web-mode-code-indent-offset   4)
   '(web-mode-attr-indent-offset   2)
   ;; padding
   '(web-mode-style-padding  1)
   '(web-mode-script-padding 1)
   '(web-mode-block-padding  0))
  ;; インデント再調整
  (with-eval-after-load "editorconfig"
    (add-hook
     'editorconfig-custom-hooks
     (lambda (props)
       (setq web-mode-script-padding 1)
       (setq web-mode-style-padding  1)
       (setq web-mode-block-padding  0)))))

(provide '40_web-mode)
;;; 40_web-mode.el ends here
