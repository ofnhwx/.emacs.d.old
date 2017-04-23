;;; 60_ido.el --- setup ido.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:09:04>
;;

;;; Commentary:

;;; Code:

(use-package ido
  :config
  ;;
  (use-package bbyac
    :if (e:require-package 'bbyac)
    :init
    (custom-set-variables
     '(bbyac-max-chars 99999))
    :config
    (defun bbyac--display-matches--use-ido (orig strlist)
      (cond ((null (cdr strlist))
             (car strlist))
            ((cl-notany #'bbyac--string-multiline-p strlist)
             (ido-completing-read "Bbyac: " strlist nil t))
            (t (apply orig strlist))))
    (advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido))
  ;;
  (use-package flx-ido
    :if (e:require-package 'flx-ido)
    :config
    (flx-ido-mode))
  ;;
  (use-package ido-at-point
    :if (e:require-package 'ido-at-point)
    :config
    (ido-at-point-mode))
  ;;
  (use-package ido-complete-space-or-hyphen
    :if (e:require-package 'ido-complete-space-or-hyphen))
  ;;
  (use-package ido-hacks
    :if (e:require-package 'ido-hacks)
    :init
    (custom-set-variables
     '(ido-hacks-mode t)))
  ;;
  (use-package ido-ubiquitous
    :if (e:require-package 'ido-ubiquitous)
    :init
    (custom-set-variables
     '(ido-ubiquitous-mode t)))
  ;;
  (use-package ido-vertical-mode
    :if (e:require-package 'ido-vertical-mode)
    :init
    (custom-set-variables
     '(ido-vertical-mode t)))
  ;;
  (use-package ido-yes-or-no
    :if (e:require-package 'ido-yes-or-no)
    :init
    (custom-set-variables
     '(ido-yes-or-no-mode t)))
  ;;
  (use-package idomenu
    :if (e:require-package 'idomenu)))

(provide '60_ido)
;;; 60_ido.el ends here
