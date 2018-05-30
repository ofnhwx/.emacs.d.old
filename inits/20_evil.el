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
  :bind
  (:map evil-normal-state-map
        ("<down>" . evil-next-visual-line)
        ("<up>" . evil-previous-visual-line)
        ("j" . evil-next-visual-line)
        ("k" . evil-previous-visual-line)
        ("gj" . evil-next-line)
        ("gk" . evil-previous-line)
        ("g0" . elscreen-jump)
        ("g1" . elscreen-jump)
        ("g2" . elscreen-jump)
        ("g3" . elscreen-jump)
        ("g4" . elscreen-jump)
        ("g5" . elscreen-jump)
        ("g6" . elscreen-jump)
        ("g7" . elscreen-jump)
        ("g8" . elscreen-jump)
        ("g9" . elscreen-jump)
        ("gt" . elscreen-next)
        ("gT" . elscreen-previous))
  :config
  (add-to-list 'evil-emacs-state-modes 'dired-mode)
  (add-to-list 'evil-emacs-state-modes 'eshell-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-history-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-mode)
  (add-to-list 'evil-emacs-state-modes 'help-mode)
  (add-to-list 'evil-emacs-state-modes 'messsages-buffer-mode)
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
  (defun evil-save-and-normal-state ()
    "Save and force normal state."
    (interactive)
    (save-buffer)
    (evil-force-normal-state))
  (defun evil-keyboard-quit ()
    "Keyboard quit and force normal state."
    (interactive)
    (evil-force-normal-state)
    (keyboard-quit)))

(use-package evil
  :no-require t
  :bind
  ;; モーションモード(motion -> normal -> visual)
  (:map evil-motion-state-map
        ("C-^" . nil) ;; evil-buffer
        ("C-g" . evil-keyboard-quit))
  ;; 通常モード
  (:map evil-normal-state-map
        ("SPC" . base-command-map))
  ;; ビジュアルモード
  (:map evil-visual-state-map)
  ;; 挿入モード
  (:map evil-insert-state-map
        ("C-g" . evil-keyboard-quit)
        ("C-x C-s" . evil-save-and-normal-state)
        ("<escape>" . evil-force-normal-state))
  ;; オペレーターモード
  (:map evil-operator-state-map)
  ;; 置き換えモード
  (:map evil-replace-state-map)
  ;; Emacsモード
  (:map evil-emacs-state-map
        ("C-z z" . evil-exit-emacs-state)))

(use-package evil
  :no-require t
  :after (skk)
  :hook
  ((evil-insert-state-entry . skk-latin-mode-on)
   (evil-insert-state-exit  . skk-mode-exit)))

(use-package evil-args
  :ensure t
  :demand t
  :bind
  (:map evil-inner-text-objects-map
        ("a" . evil-inner-arg))
  (:map evil-outer-text-objects-map
        ("a" . evil-outer-arg)))

(use-package evil-exchange
  :ensure t
  :demand t
  :config
  (evil-exchange-install))

(use-package evil-matchit
  :ensure t
  :demand t
  :config
  (global-evil-matchit-mode 1))

(use-package evil-nerd-commenter
  :ensure t
  :demand t
  :config
  (evilnc-default-hotkeys))

(use-package evil-numbers
  :ensure t
  :defer t
  :bind
  (:map evil-normal-state-map
        ("C-c +" . evil-numbers/inc-at-pt)
        ("C-c -" . evil-numbers/dec-at-pt)))

(use-package evil-little-word
  :if (progn (quelpa '(evil-plugins :fetcher github :repo "tarao/evil-plugins"))
             (locate-library "evil-little-word"))
  :demand t)

(use-package evil-string-inflection
  :ensure t
  :defer t
  :init
  (when (fboundp 'evil-operator-snakecamelfy)
    (defalias 'evil-operator-string-inflection 'evil-operator-snakecamelfy))
  :bind
  (:map evil-normal-state-map
        ("g~" . evil-operator-string-inflection)))

(use-package evil-surround
  :ensure t
  :demand t
  :config
  (global-evil-surround-mode 1))

(use-package evil-tutor-ja
  :ensure t
  :defer t
  :custom
  (evil-tutor-working-directory (e:expand "tutor/" :cache))
  (evil-tutor-ja-working-directory (e:expand "tutor/" :cache)))

(use-package evil-visualstar
  :ensure t
  :demand t
  :config
  (global-evil-visualstar-mode 1))

(use-package linum-relative
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

(provide '20_evil)
;;; 20_evil.el ends here
