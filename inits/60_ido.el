;;; 60_ido.el --- setup ido.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 01:11:06>
;;

;;; Commentary:

;;; Code:

(use-package bbyac
  :ensure t
  :config
  (custom-set-variables
   '(bbyac-max-chars 99999))
  (defun bbyac--display-matches--use-ido (orig strlist)
    (cond ((null (cdr strlist))
           (car strlist))
          ((cl-notany #'bbyac--string-multiline-p strlist)
           (ido-completing-read "Bbyac: " strlist nil t))
          (t (apply orig strlist))))
  (advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode))

(use-package ido-at-point
  :ensure t
  :config
  (ido-at-point-mode))

(use-package ido-complete-space-or-hyphen
  :ensure t)

(use-package ido-hacks
  :ensure t
  :config
  (custom-set-variables
   '(ido-hacks-mode t)))

(use-package ido-ubiquitous
  :ensure t
  :config
  (custom-set-variables
   '(ido-ubiquitous-mode t)))

(use-package ido-vertical-mode
  :ensure t
  :config
  (custom-set-variables
   '(ido-vertical-mode t)))

(use-package ido-yes-or-no
  :ensure t
  :config
  (custom-set-variables
   '(ido-yes-or-no-mode t)))

(use-package idomenu
  :ensure t))

(provide '60_ido)
;;; 60_ido.el ends here
