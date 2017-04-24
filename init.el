;;; init.el --- load this file at first when emacs was started.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 14:33:38>
;;

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;; use:`cl'
(require 'cl-lib)

;; load:`init-enhance', `init-config', `init-setup'
(cl-eval-when (compile load eval)
  (let* ((default-directory user-emacs-directory))
    (require 'init-enhance (expand-file-name "init-enhance") t)
    (require 'init-config  (expand-file-name "init-config")  t)
    (require 'init-setup   (expand-file-name "init-setup")   t)))

;; テーマ
(load-theme 'init t)

;; use:`package'
(when (e:require 'package t)
  (cl-dolist (item '(("melpa" . "https://melpa.org/packages/")
                     ;;("marmalade" . "http://marmalade-repo.org/packages/")
                     ))
    (when (os-type-win-p)
      (setf (cdr item) (replace-regexp-in-string "https://" "http://" (cdr item))))
    (add-to-list 'package-archives item))
  (unless (file-directory-p package-user-dir)
    (package-refresh-contents))
  (package-initialize))

;; use:`use-package'
(unless (e:require-package 'use-package t t)
  (defmacro use-package (&rest args)))

;; カスタムファイル
(set-variable 'custom-file (e:expand "custom.el" :local))
;(load custom-file t)

;; add:`load-path'
(add-to-list 'load-path (e:expand "lisp" :user))

;; use:`@libraries'
(use-package dash :ensure t)
(use-package f    :ensure t)
(use-package s    :ensure t)
(use-package deferred   :ensure t)
(use-package concurrent :ensure t)
(use-package windata    :ensure t)
(use-package cl-lib-highlight
  :ensure t
  :config
  (cl-lib-highlight-initialize)
  (cl-lib-highlight-warn-cl-initialize))

;; 各種パッケージ設定
(use-package init-loader
  :if (e:require-package 'init-loader)
  :init
  (set-variable 'init-loader-directory (e:expand "inits" :user))
  :config
  (unless (file-directory-p init-loader-directory)
    (make-directory init-loader-directory t))
  (init-loader-load))

(provide 'init)
;;; init.el ends here
