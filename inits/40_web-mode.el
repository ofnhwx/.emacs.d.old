;;; 40_web-mode.el --- setup web-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:31:16>
;;

;;; Commentary:

;;; Code:

(use-package web-mode
  :mode (("\\.twig\\'" . web-mode))
  :bind
  (:map web-mode-map
        ("C-]" . ac-php-find-symbol-at-point)
        ("C-}" . ac-php-location-stack-back))
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
  (set-variable 'web-mode-block-padding  2))

(use-package web-mode
  :after (editorconfig)
  :config
  ;; インデント再調整
  (add-hook
   'editorconfig-custom-hooks
   (lambda (props)
     (setq web-mode-script-padding 2)
     (setq web-mode-style-padding  2)
     (setq web-mode-block-padding  2))))

(provide '40_web-mode)
;;; 40_web-mode.el ends here
