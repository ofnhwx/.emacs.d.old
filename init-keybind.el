;;; init-keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-

;; Last updated: <2016/07/02 15:01:35>
;;

;;; Commentary:

;;; Code:

(progn
  (define-prefix-command 'base-command-map)
  (define-prefix-command 'buffer-command-map)
  (define-prefix-command 'file-command-map)
  (define-prefix-command 'general-command-map)
  (define-prefix-command 'hs-minor-command-map)
  (define-prefix-command 'toggle-command-map)
  (define-prefix-command 'meta-g-map))

(use-package "bind-key"
  :ensure t
  :config
  (bind-keys ("C-," . base-command-map))
  (bind-keys :map base-command-map
             ("b" . buffer-command-map)
             ("f" . file-command-map)
             ("g" . general-command-map)
             ("h" . hs-minor-command-map)
             ("t" . toggle-command-map))
  (bind-keys :map buffer-command-map
             ("b" . switch-to-buffer)
             ("k" . kill-buffer))
  (bind-keys :map file-command-map
             ("f" . find-file)
             ("h" . helm-find-files)
             ("p" . helm-find-files-with-projectile)
             ("r" . helm-recentf))
  (bind-keys :map general-command-map
             ("," . helm-ag-pop-stack)
             ("." . helm-ag)
             ("/" . helm-ag-project-root)
             ("_" . helm-ag-this-file)
             ("b" . backup-walker-start)
             ("c" . helm-flycheck)
             ("d" . magit-diff-buffer-file-popup)
             ("g" . avy-goto-line)
             ("l" . magit-log-buffer-file-popup)
             ("s" . magit-status))
  (bind-keys :map hs-minor-command-map
             ("H" . hs-hide-all)
             ("S" . hs-show-all)
             ("h" . hs-hide-block)
             ("l" . hs-hide-level)
             ("s" . hs-show--block)
             ("t" . hs-toggle-hiding))
  (bind-keys :map toggle-command-map
             ("h" . hs-minor-mode)
             ("r" . read-only-mode)
             ("t" . toggle-truncate-lines)
             ("w" . whitespace-mode)))

(use-package "bind-key"
  :ensure t
  :config
  ;; for:`mac'
  (when (os-type-mac-p)
    (defun scroll-down-with-lines ()
      (interactive)
      (scroll-down 3))
    (defun scroll-up-with-lines ()
      (interactive)
      (scroll-up 3))
    (bind-keys :map global-map
               ("<wheel-up>"          . scroll-down-with-lines)
               ("<wheel-down>"        . scroll-up-with-lines)
               ("<double-wheel-up>"   . scroll-down-with-lines)
               ("<double-wheel-down>" . scroll-up-with-lines)
               ("<triple-wheel-up>"   . scroll-down-with-lines)
               ("<triple-wheel-down>" . scroll-up-with-lines)))
  ;; for:`global-map'
  (bind-keys :map global-map
             ("<f8>" . neotree-toggle)
             ("C-:" . avy-goto-char)
             ("C-;" . avy-goto-word-1)
             ("C-^" . ace-window)
             ("C-\¥" . skk-mode)
             ("C-z C-z" . helm-elscreen)
             ("M-/" . bbyac-expand-symbols)
             ("M-:" . helm-eval-expression-with-eldoc)
             ("M-g" . meta-g-map)
             ("M-X" . lacarte-execute-command)
             ("M-x" . helm-M-x)
             ("M-y" . helm-show-kill-ring)
             ("C-M-SPC" . er/expand-region))
  ;; for:`ctl-x-map'
  (bind-keys :map ctl-x-map
             ("f" . find-file)
             ("o" . ace-window)
             ("C-b" . helm-multi-files)
             ("C-f" . helm-find-files-with-projectile))
  ;; for:`meta-g-map'
  (bind-keys :map meta-g-map
             ("," . helm-ag-pop-stack)
             ("." . helm-ag)
             ("/" . helm-ag-project-root)
             ("_" . helm-ag-this-file)
             ("d" . magit-diff-buffer-file-popup)
             ("l" . magit-log-buffer-file-popup)
             ("s" . magit-status)
             ("M-g" . avy-goto-line))
  ;; for:`mode-ific-map'
  (bind-keys :map mode-specific-map
             ("i" . imenu)
             ("t" . toggle-truncate-lines)
             ("z" . eshell))
  ;; for:`helm-map'
  (bind-keys :map help-map
             ("a" . helm-apropos)
             ("b" . helm-descbinds))
  ;; for:`dired-mode-map'
  (bind-keys :map dired-mode-map
             ("r" . wdired-change-to-wdired-mode))
  ;; for:`eshell-mode-map'
  (add-hook
   'eshell-mode-hook
   (lambda ()
     (bind-keys :map eshell-mode-map
                ("M-p" . helm-eshell-history)
                ("M-n" . helm-esh-pcomplete))))
  ;; for:`eww-mode-map'
  (bind-keys :map eww-mode-map
             ("o" . ace-link-eww))
  ;; for:`isearch-mode-map'
  (bind-keys :map isearch-mode-map
             ("C-o" . helm-swoop-from-isearch))
  ;; for:`php-mode-map'
  (with-eval-after-load 'php-mode
    (bind-keys :map php-mode-map
               ("C-]" . ac-php-find-symbol-at-point)
               ("C-}" . ac-php-location-stack-back)))
  ;; for:`web-mode-map'
  (with-eval-after-load 'web-mode
    (bind-keys :map web-mode-map
               ("C-]" . ac-php-find-symbol-at-point)
               ("C-}" . ac-php-location-stack-back)))
  )

(use-package "smartrep"
  :ensure t
  :config
  ;;
  (smartrep-define-key
   global-map
   "M-g" '(("n" . 'next-error)
           ("p" . 'previous-error)
           ("N" . 'next-error)
           ("P" . 'previous-error)
           ))
  ;;
  (smartrep-define-key
   global-map
   "C-c" '(("n" . (lambda () (scroll-other-window  1)))
           ("p" . (lambda () (scroll-other-window -1)))
           ("N" . (lambda () (scroll-other-window)))
           ("P" . (lambda () (scroll-other-window '-)))
           ("~" . 'shrink-window)
           ("^" . 'enlarge-window)
           ("{" . 'shrink-window-horizontally)
           ("}" . 'enlarge-window-horizontally)
           ))
  ;;
  (use-package "multiple-cursors"
    :config
    (bind-key "C-t" nil)
    (smartrep-define-key
     global-map
     "C-t" '(("C-t" . 'mc/mark-next-like-this)
             ("n"   . 'mc/mark-next-like-this)
             ("p"   . 'mc/mark-previous-like-this)
             ("m"   . 'mc/mark-more-like-this-extended)
             ("u"   . 'mc/unmark-next-like-this)
             ("U"   . 'mc/unmark-previous-like-this)
             ("s"   . 'mc/skip-to-next-like-this)
             ("S"   . 'mc/skip-to-previous-like-this)
             ("*"   . 'mc/mark-all-like-this)
             ("d"   . 'mc/mark-all-like-this-dwim)
             ("i"   . 'mc/insert-numbers)
             ("o"   . 'mc/sort-regions)
             ("O"   . 'mc/reverse-regions)))))

(e:loaded)
(provide 'init-keybind)
;;; init-keybind.el ends here
