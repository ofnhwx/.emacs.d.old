;;; evil.el --- 'evil'の設定
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/06/23 13:55:43>
;;

;;; Commentary:

;;; Code:

(custom-set-variables
 ;; カーソルを行の末尾に移動可能
 '(evil-move-cursor-back nil)
 ;; UNDOの単位を細かく
 '(evil-want-fine-undo t)
 ;; 行をまたいでカーソル前後移動
 '(evil-cross-lines t)
 ;; 挿入ステートでは基本Emacs
 '(evil-insert-state-map (make-sparse-keymap)))

(use-package "bind-key"
  :ensure t
  :config
  (bind-keys :map evil-normal-state-map
             ("C-^" . nil)
             :map evil-motion-state-map
             ("C-^" . nil)
             :map evil-insert-state-map
             ("C-g" . evil-keyboard-quit)
             ("C-z" . evil-emacs-state)
             ("<escape>" . evil-force-normal-state)
             :map evil-visual-state-map
             ("C-g" . evil-keyboard-quit)
             :map evil-operator-state-map
             :map evil-replace-state-map
             :map evil-emacs-state-map))

(use-package "evil-leader"
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  ;; for;`default'
  (evil-leader/set-key "bb" 'switch-to-buffer)
  (evil-leader/set-key "bk" 'kill-buffer)
  (evil-leader/set-key "ff" 'find-file)
  (evil-leader/set-key "w" 'evil-window-map)
  ;; for:`helm'
  (with-eval-after-load "helm"
    (evil-leader/set-key "fh" 'helm-find-files)
    (evil-leader/set-key "fr" 'helm-recentf)
    ;; for:`helm-projectile'
    (with-eval-after-load "helm-projectile"
      (evil-leader/set-key "fp" 'helm-find-files-with-projectile)))
  ;; for:`magit'
  (with-eval-after-load "magit"
    (evil-leader/set-key "gs" 'magit-status)
    (evil-leader/set-key "gl" 'magit-log-buffer-file-popup)))

(defun evil-keyboard-quit ()
  "Keyboard quit and force normal state."
  (interactive)
  (message "%s" evil-state)
  (when (bound-and-true-p evil-mode)
    (evil-force-normal-state))
  (keyboard-quit))

(e:loaded)
;;; evil.el ends here
