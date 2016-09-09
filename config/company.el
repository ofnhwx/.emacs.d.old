;;; company.el --- 'company'の設定
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/07/07 10:42:01>
;;

;;; Commentary:

;;; Code:

(custom-set-variables
 ;; 補完候補をすぐに表示
 '(company-idle-delay 0)
 ;; 補完開始文字数
 '(company-minimum-prefix-length 1)
 ;; 上下でループ
 '(company-selection-wrap-around t))

;; Fuzzy matching
(use-package "company-flx"
  :ensure t
  :config
  (company-flx-mode))

;; PHP補完
(use-package "company-php"
  :ensure t
  :config
  (custom-set-variables
   '(ac-php-tags-path (e:expand "ac-php" :local))))

;; WEB補完
(use-package "company-web"
  :ensure t)

;; ヘルパー関数
(defmacro add-company-backends (hook &rest backends)
  `(add-hook
    ',hook
    (lambda ()
      (make-local-variable 'company-backends)
      (add-to-list 'company-backends ',backends))))

;; モード毎の設定
(add-company-backends php-mode-hook company-ac-php-backend company-dabbrev-code)
(add-company-backends web-mode-hook company-web-html company-ac-php-backend company-dabbrev-code)

;; `smartparens'を一時的に無効にする
(with-eval-after-load 'smartparens
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

(e:loaded)
;;; company.el ends here