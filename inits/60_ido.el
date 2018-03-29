;;; 60_ido.el --- setup ido.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:02:05>
;;

;;; Commentary:

;;; Code:


;; 'ido'を使用したシンボル補完
(use-package bbyac
  :init
  (set-variable 'bbyac-max-chars 99999)
  :config
  (defun bbyac--display-matches--use-ido (orig strlist)
    (cond ((null (cdr strlist))
           (car strlist))
          ((cl-notany #'bbyac--string-multiline-p strlist)
           (ido-completing-read "Bbyac: " strlist nil t))
          (t (apply orig strlist))))
  (advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido))

;; 曖昧検索を常に有効化
(use-package flx-ido
  :config
  (flx-ido-mode))

;; いろいろな場所で'ido'を使用
(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode t))

;; 最適化など
(use-package ido-hacks
  :config
  (let ((hacks "^ido-hacks-"))
    (ad-enable-regexp hacks)
    (ad-activate-regexp hacks)))

;; 候補を縦に表示
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode t))

;; yes/noの選択に使用
(use-package ido-yes-or-no
  :config
  (ido-yes-or-no-mode t))

(provide '60_ido)
;;; 60_ido.el ends here
