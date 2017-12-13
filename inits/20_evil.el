;;; 20_evil.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/10 14:10:16>
;;

;;; Commentary:

;;; Code:

(use-package evil
  :if (e:require-package 'evil nil t)
  :init
  ;; カーソルを行の末尾に移動可能
  (set-variable 'evil-move-cursor-back nil)
  ;; UNDOの単位を細かく
  (set-variable 'evil-want-fine-undo t)
  ;; 行をまたいでカーソル前後移動
  (set-variable 'evil-cross-lines t)
  ;; 挿入ステートでは基本Emacs
  (set-variable 'evil-insert-state-map (make-sparse-keymap))
  :config
  (defun evil-keyboard-quit ()
    "Keyboard quit and force normal state."
    (interactive)
    (message "%s" evil-state)
    (when (bound-and-true-p evil-mode)
      (evil-force-normal-state))
    (keyboard-quit))
  ;; 必要に応じて相対行番号を表示
  (use-package linum-relative
    :if (e:require-package 'linum-relative nil t)
    :config
    (defun linum-relative-on-and-update ()
      (linum-relative-on)
      (linum-update-current))
    (add-hook 'evil-operator-state-entry-hook 'linum-relative-on-and-update)
    (add-hook 'evil-operator-state-exit-hook 'linum-relative-off))
  ;; 挿入モードでSKKを有効化
  (with-eval-after-load "skk"
    (add-hook 'evil-insert-state-entry-hook 'skk-latin-mode-on)
    (add-hook 'evil-insert-state-exit-hook 'skk-mode-exit))
  ;; 無効にするモード
  (add-to-list 'evil-emacs-state-modes 'dired-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-mode)
  ;; 有効化
  (evil-mode))

(use-package evil-surround
  :if (e:require-package 'evil-surround nil t)
  :config
  (global-evil-surround-mode 1))

(use-package evil
  :config
  ;; 通常モード
  (bind-keys
   :map evil-normal-state-map
   ("C-," . nil)
   ("C-^" . nil)
   ("C-z" . nil)
   ("C-z z" . evil-emacs-state))
  ;; モーションモード
  (bind-keys
   :map evil-motion-state-map
   ("C-^" . nil)
   ("C-z" . nil)
   ("C-z z" . evil-emacs-state))
  ;; 挿入モード
  (bind-keys
   :map evil-insert-state-map
   ("C-g" . evil-keyboard-quit)
   ("C-z" . nil)
   ("C-z z" . evil-emacs-state)
   ("<escape>" . evil-force-normal-state))
  ;; ビジュアルモード
  (bind-keys
   :map evil-visual-state-map
   ("C-g" . evil-keyboard-quit)
   ("C-z" . nil)
   ("C-z z" . evil-emacs-state))
  ;; オペレーターモード
  (bind-keys
   :map evil-operator-state-map)
  ;; 置き換えモード
  (bind-keys
   :map evil-replace-state-map)
  ;; Emacsモード
  (bind-keys
   :map evil-emacs-state-map
   ("C-z" . nil)
   ("C-z z" . evil-exit-emacs-state)))

(use-package evil-numbers
  :if (e:require-package 'evil-numbers nil t)
  :config
  (bind-keys
   :map evil-normal-state-map
   ("C-c +" . evil-numbers/inc-at-pt)
   ("C-c -" . evil-numbers/dec-at-pt)))

(use-package goto-chg
  :if (e:require 'goto-chg t)
  :config
  (bind-keys
   :map evil-normal-state-map
   ("g ;" . goto-last-change)
   ("g ," . goto-last-change-reverse)))

(provide '20_evil)
;;; 20_evil.el ends here
