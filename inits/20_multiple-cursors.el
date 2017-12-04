;;; 20_multiple-cursors.el --- setup multiple-cursors.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package multiple-cursors
  :if (e:require-package 'multiple-cursors nil t)
  :init
  (set-variable 'mc/list-file (e:expand ".mc-lists.el" :local))
  :config
  (setq mc/cmds-to-run-once
        '(hydra-mc/mc/insert-numbers
          hydra-mc/mc/mark-all-like-this
          hydra-mc/mc/mark-all-like-this-dwim
          hydra-mc/mc/mark-more-like-this-extended
          hydra-mc/mc/mark-next-like-this
          hydra-mc/mc/mark-previous-like-this
          hydra-mc/mc/reverse-regions
          hydra-mc/mc/skip-to-next-like-this
          hydra-mc/mc/skip-to-previous-like-this
          hydra-mc/mc/sort-regions
          hydra-mc/mc/unmark-next-like-this
          hydra-mc/mc/unmark-previous-like-this)))

(provide '20multiple-cursors)
;;; 20_multiple-cursors.el ends here
