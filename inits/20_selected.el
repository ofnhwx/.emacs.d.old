;;; 20_selected.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:12:30>
;;

;;; Commentary:

;;; Code:

(use-package selected
  :diminish selected-minor-mode
  :bind
  (:map selected-keymap
        ("=" . count-words-region)
        ("d" . downcase-region)
        ("q" . selected-off)
        ("u" . upcase-region))
  :config
  (selected-global-mode))

(use-package helm-selected
  :after (helm selected)
  :bind
  (:map selected-keymap
        ("?" . helm-selected)))

(provide '20_selected)
;;; 20_selected.el ends here
