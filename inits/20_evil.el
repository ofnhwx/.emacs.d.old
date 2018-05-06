;;; 20_evil.el --- configurations.
;;; Commentary:
;;; Code:

(use-package evil
  :after (elscreen)
  :ensure t
  :custom
  (evil-cross-lines t)
  (evil-insert-state-map (make-sparse-keymap))
  (evil-move-cursor-back nil)
  (evil-toggle-key "C-z z")
  (evil-want-fine-undo t)
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
  :hook
  ((evil-insert-state-entry . skk-latin-mode-on)
   (evil-insert-state-exit  . skk-mode-exit)))

(use-package linum-relative
  :after (evil)
  :ensure t
  :defer t
  :hook
  ((evil-operator-state-entry . linum-relative-on-and-update)
   (evil-operator-state-exit  . linum-relative-off-and-restore))
  :init
  (cond
   ((fboundp 'display-line-numbers-mode)
    (set-variable 'linum-relative-backend 'display-line-numbers-mode))
   (t
    (set-variable 'linum-relative-format "%4s")
    (set-variable 'linum-relative-current-symbol "=>")
    (set-variable 'linum-relative-plusp-offset 1)))
  :config
  (defvar temp-linum-mode-state nil)
  (cond
   ((fboundp 'display-line-numbers-mode)
    (defun linum-relative-on-and-update ()
      (setq temp-linum-mode-state display-line-numbers-mode)
      (linum-relative-on))
    (defun linum-relative-off-and-restore ()
      (linum-relative-off)
      (when temp-linum-mode-state
        (display-line-numbers-mode))))
   (t
    (defun linum-relative-on-and-update ()
      (setq temp-linum-mode-state linum-mode)
      (linum-relative-on)
      (linum-update-current))
    (defun linum-relative-off-and-restore ()
      (linum-relative-off)
      (when temp-linum-mode-state
        (linum-mode))))))

(use-package evil-surround
  :after (evil)
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-numbers
  :after (evil)
  :ensure t
  :defer t
  :bind
  (:map evil-normal-state-map
        ("C-c +" . evil-numbers/inc-at-pt)
        ("C-c -" . evil-numbers/dec-at-pt)))

(provide '20_evil)
;;; 20_evil.el ends here
