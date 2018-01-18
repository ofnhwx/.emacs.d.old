;;; init.el --- load this file at first when emacs was started.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/18 14:32:36>
;;

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パス設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((emacs-dir (file-name-directory (or load-file-name buffer-file-name))))
  (setq user-emacs-directory (abbreviate-file-name emacs-dir)))
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; `cl-lib'を使用する
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 個人用の拡張・設定を読み込み
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cl-eval-when (compile load eval)
  (let* ((default-directory user-emacs-directory))
    (require 'init-enhance (expand-file-name "init-enhance") t)
    (require 'init-config  (expand-file-name "init-config")  t)
    (require 'init-setup   (expand-file-name "init-setup")   t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs標準のパッケージを使用
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (e:require 'package t)
  (cl-dolist (item '(("melpa-stable" "https://stable.melpa.org/packages/" 10)
                     ("melpa" "https://melpa.org/packages/")
                     ))
    (let ((archive (car item))
          (location (cadr item))
          (priority (or (cl-caddr item) 0)))
      (when (os-type-win-p)
        (setq location (replace-regexp-in-string "https://" "http://" location)))
      (add-to-list 'package-archives (cons archive location))
      (add-to-list 'package-archive-priorities (cons archive priority))))
  (unless (file-directory-p package-user-dir)
    (package-refresh-contents))
  (package-initialize))

(unless (e:require-package 'use-package t t)
  (defmacro use-package (&rest args)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 共通で使用するライブラリ等をロード
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dash :ensure t)
(use-package f    :ensure t)
(use-package s    :ensure t)
(use-package deferred   :ensure t)
(use-package concurrent :ensure t)
(use-package windata    :ensure t)
(use-package hydra :ensure t)
(use-package mykie :ensure t)
(use-package cl-lib-highlight
  :ensure t
  :config
  (cl-lib-highlight-initialize)
  (cl-lib-highlight-warn-cl-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 各種パッケージ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-loader
  :if (e:require-package 'init-loader nil t)
  :init
  (set-variable 'init-loader-directory (e:expand "inits" :user))
  :config
  (unless (file-directory-p init-loader-directory)
    (make-directory init-loader-directory t))
  (init-loader-load))

(provide 'init)
;;; init.el ends here
