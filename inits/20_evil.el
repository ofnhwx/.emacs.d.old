;;; 20_evil.el --- configurations.
;;; Commentary:
;;; Code:

(use-package evil
  :after (elscreen)
  :ensure t
  :init
  (set-variable 'evil-cross-lines t)
  (set-variable 'evil-insert-state-map (make-sparse-keymap))
  (set-variable 'evil-move-cursor-back nil)
  (set-variable 'evil-toggle-key "C-z z")
  (set-variable 'evil-want-fine-undo t)
  :config
  (add-to-list 'evil-emacs-state-modes 'dired-mode)
  (add-to-list 'evil-emacs-state-modes 'eshell-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-history-mode)
  (add-to-list 'evil-emacs-state-modes 'help-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-mode)
  (add-to-list 'evil-emacs-state-modes 'prodigy-mode)
  (add-to-list 'evil-emacs-state-modes 'srefactor-ui-menu-mode)
  (add-to-list 'evil-emacs-state-modes 'term-mode)
  (cl-dolist (mode evil-emacs-state-modes)
    (delete mode evil-insert-state-modes)
    (delete mode evil-motion-state-modes))
  (evil-mode))

(use-package evil
  :no-require t
  :config
  (defun evil-keyboard-quit ()
    "Keyboard quit and force normal state."
    (interactive)
    (message "%s" evil-state)
    (when (bound-and-true-p evil-mode)
      (evil-force-normal-state))
    (keyboard-quit))
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

(use-package evil
  :no-require t
  :after (skk)
  :config
  (add-hook 'evil-insert-state-entry-hook 'skk-latin-mode-on)
  (add-hook 'evil-insert-state-exit-hook 'skk-mode-exit))

(use-package linum-relative
  :after (evil)
  :ensure t
  :init
  (set-variable 'linum-relative-backend 'display-line-numbers-mode)
  :config
  (defvar temp-linum-mode-state nil)
  (defun linum-relative-on-and-update ()
    (setq temp-linum-mode-state display-line-numbers-mode)
    (linum-relative-on)
    (linum-update-current))
  (defun linum-relative-off-and-restore ()
    (linum-relative-off)
    (when temp-linum-mode-state
      (display-line-numbers-mode)))
  (add-hook 'evil-operator-state-entry-hook 'linum-relative-on-and-update)
  (add-hook 'evil-operator-state-exit-hook 'linum-relative-off-and-restore))

(use-package evil-surround
  :after (evil)
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-numbers
  :after (evil)
  :ensure t
  :config
  (bind-keys
   :map evil-normal-state-map
   ("C-c +" . evil-numbers/inc-at-pt)
   ("C-c -" . evil-numbers/dec-at-pt)))

(provide '20_evil)
;;; 20_evil.el ends here
