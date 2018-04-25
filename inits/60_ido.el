;;; 60_ido.el --- setup ido.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/26 13:50:50>
;;

;;; Commentary:

;;; Code:

(use-package ido
  :init
  (set-variable 'ido-enable-flex-matching t)
  (set-variable 'ido-save-directory-list-file (e:expand ".ido.last" :cache))
  :config
  (ido-everywhere 1)
  (ido-mode 1))

(use-package ido
  :after (helm-dired-history)
  :config
  (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil))

(use-package bbyac
  :init
  (set-variable 'bbyac-max-chars 99999))

(use-package flx-ido
  :config
  (flx-ido-mode))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode t))

(use-package ido-hacks
  :config
  (let ((hacks "^ido-hacks-"))
    (ad-enable-regexp hacks)
    (ad-activate-regexp hacks)))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode t))

(use-package ido-yes-or-no
  :config
  (ido-yes-or-no-mode t))

(provide '60_ido)
;;; 60_ido.el ends here
