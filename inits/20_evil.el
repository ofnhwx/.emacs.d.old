;;; 20_evil.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/19 15:37:29>
;;

;;; Commentary:

;;; Code:

(use-package evil
  :if (e:require-package 'evil nil t)
  :init
  (set-variable 'evil-cross-lines t)
  (set-variable 'evil-insert-state-map (make-sparse-keymap))
  (set-variable 'evil-move-cursor-back nil)
  (set-variable 'evil-toggle-key "C-z z")
  (set-variable 'evil-want-fine-undo t)
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
    :init
    (set-variable 'linum-relative-format "%5s")
    (set-variable 'linum-relative-current-symbol "=>")
    (set-variable 'linum-relative-plusp-offset 0)
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
  ;; モーションモード(motion -> normal -> visual)
  (bind-keys
   :map evil-motion-state-map
   ("C-^" . nil) ;; evil-buffer
   ("C-g" . evil-keyboard-quit))
  ;; 通常モード
  (bind-keys
   :map evil-normal-state-map
   ("SPC" . base-command-map))
  ;; ビジュアルモード
  (bind-keys
   :map evil-visual-state-map)
  ;; 挿入モード
  (bind-keys
   :map evil-insert-state-map
   ("C-g" . evil-keyboard-quit)
   ("<escape>" . evil-force-normal-state))
  ;; オペレーターモード
  (bind-keys
   :map evil-operator-state-map)
  ;; 置き換えモード
  (bind-keys
   :map evil-replace-state-map)
  ;; Emacsモード
  (bind-keys
   :map evil-emacs-state-map
   ("C-z z" . evil-exit-emacs-state)))

(use-package evil-numbers
  :if (e:require-package 'evil-numbers nil t)
  :config
  (bind-keys
   :map evil-normal-state-map
   ("C-c +" . evil-numbers/inc-at-pt)
   ("C-c -" . evil-numbers/dec-at-pt)))

(provide '20_evil)
;;; 20_evil.el ends here
