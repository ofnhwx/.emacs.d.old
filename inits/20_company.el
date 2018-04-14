;;; 20_company.el --- setup company.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/10 17:11:26>
;;

;;; Commentary:

;;; Code:

(use-package company
  :diminish company-mode
  :init
  (set-variable 'company-idle-delay 0.1)          ;; 補完候補をすぐに表示
  (set-variable 'company-minimum-prefix-length 1) ;; 補完開始文字数
  (set-variable 'company-selection-wrap-around t) ;; 上下でループ
  :config
  ;; ヘルパー関数
  (defun set-company-backends (backends)
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends backends))
  ;; 有効化
  (global-company-mode))

(use-package company
  :after (smartparens)
  :config
  ;; `smartparens'を一時的に無効にする
  (defvar company-smartparens-enabled nil
    "`company'の補完中に`smartparens'の状態を保存しておく変数.")
  (defun disable-smartparens-with-company (arg)
    "`company'での補完開始時に`smartparens'を無効にする.引数 ARG は未使用."
    (setq company-smartparens-enabled smartparens-global-mode)
    (smartparens-global-mode 0))
  (defun revert-smartparens-with-company (arg)
    "`company'での補完終了時に`smartparens'の状態を戻す.引数 ARG は未使用."
    (when company-smartparens-enabled
      (smartparens-global-mode 1)))
  (add-hook 'company-completion-started-hook   'disable-smartparens-with-company)
  (add-hook 'company-completion-finished-hook  'revert-smartparens-with-company)
  (add-hook 'company-completion-cancelled-hook 'revert-smartparens-with-company))

(use-package company-php
  :after (company php-mode)
  :if
  (set-variable 'ac-php-tags-path (e:expand "ac-php" :cache))
  :config
  (defun company-php-setup()
    (set-company-backends '(company-ac-php-backend company-dabbrev-code)))
  (add-hook 'php-mode-hook 'company-php-setup))

(use-package company;;web
  :after (web-mode)
  :config
  (defun company-web-setup()
    (let ((backends '(company-dabbrev-code)))
      (when (e:require 'company-php t)
        (add-to-list 'backends 'company-ac-php-backend))
      (when (e:require 'company-web t)
        (add-to-list 'backends 'company-web-html))
      (set-company-backends backends)))
  (add-hook 'web-mode-hook 'company-web-setup))

(use-package company;;irony
  :after (irony)
  :config
  (defun company-irony-setup ()
    (let ((backends '(company-yasnippet company-dabbrev-code)))
      (when (e:require 'company-yasnippet t)
        (add-to-list 'backends 'company-yasnippet))
      (when (e:require 'company-irony t)
        (add-to-list 'backends 'company-irony))
      (when (e:require 'company-irony-c-headers t)
        (add-to-list 'backends 'company-irony-c-headers))
      (set-company-backends backends)))
  (add-hook 'irony-mode-hook 'company-irony-setup))

;; [2016-06-14] - とりあえず`ac-php'を`web-mode'でも動くように
(defun company-ac-php-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-ac-php-backend))
    (prefix (and (or (eq major-mode 'php-mode)
                     (eq major-mode 'web-mode))
                 (company-ac-php--prefix)))
    (candidates (company-ac-php-candidate arg))
    (annotation (company-ac-php-annotation arg))
    (duplicates t)
    (post-completion
     (let((doc))
       (when (ac-php--tag-name-is-function arg)
         (setq doc (ac-php-clean-document (get-text-property 0 'ac-php-help arg)))
         (insert (concat doc ")"))
         (company-template-c-like-templatify (concat arg doc ")")))))))

(provide '20_company)
;;; 20_company.el ends here
