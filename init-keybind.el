;;; init-keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-

;; Last updated: <2016/07/05 17:42:58>
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

(use-package "hydra"
  :ensure t
  :config
  (defhydra hydra-toggle (base-command-map "t")
    "toggle"
    ("h" hs-minor-mode         "hideshow")
    ("r" read-only-mode        "readonly")
    ("t" toggle-truncate-lines "truncate")
    ("w" whitespace-mode       "whitespace"))
  (defhydra hydra-jump (global-map "M-g")
    "jump"
    ("n" next-error               "next-error")
    ("p" previous-error           "prev-error")
    ("N" git-gutter:next-hunk     "next-hunk")
    ("P" git-gutter:previous-hunk "prev-hunk"))
  (defhydra hydra-mc (global-map "C-t")
    "mc"
    ("C-t" mc/mark-next-like-this          "next")
    ("n"   mc/mark-next-like-this          "next")
    ("p"   mc/mark-previous-like-this      "prev")
    ("m"   mc/mark-more-like-this-extended "more")
    ("u"   mc/unmark-next-like-this        "unmark-next")
    ("U"   mc/unmark-previous-like-this    "unmark-prev")
    ("s"   mc/skip-to-next-like-this       "skip-next")
    ("S"   mc/skip-to-previous-like-this   "skip-prev")
    ("*"   mc/mark-all-like-this           "all")
    ("d"   mc/mark-all-like-this-dwim      "all-dwim")
    ("i"   mc/insert-numbers               "insert-numbers")
    ("o"   mc/sort-regions                 "sort")
    ("O"   mc/reverse-regions              "reverse"))
  (defhydra hydra-wc (global-map "C-c")
    ("n" (lambda () (interactive) (scroll-other-window  1)))
    ("p" (lambda () (interactive) (scroll-other-window -1)))
    ("N" (lambda () (interactive) (scroll-other-window)))
    ("P" (lambda () (interactive) (scroll-other-window '-)))
    ("=" balance-windows)
    ("~" shrink-window)
    ("^" enlarge-window)
    ("{" shrink-window-horizontally)
    ("}" enlarge-window-horizontally)))

(use-package "mykie"
  :ensure t
  :config
  (mykie:set-keys global-map
    "C-w"
    :default (kill-region (line-beginning-position) (line-end-position))
    :region kill-region
    "M-w"
    :default (kill-ring-save (line-beginning-position) (line-end-position))
    :region kill-ring-save))

(use-package "bind-key"
  :ensure t
  :config
  (bind-keys ("C-," . base-command-map))
  (bind-keys :map base-command-map
             ("b" . buffer-command-map)
             ("f" . file-command-map)
             ("g" . general-command-map)
             ("h" . hs-minor-command-map)
             ("t" . hydra-toggle/body))
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
             ("t" . hs-toggle-hiding)))

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
             ("M-%" . vr/query-replace)
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
  ;; for:`term+char-map'
  (bind-keys :map term+char-map
             ("C-^" . nil)
             ("C-z" . nil))
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

(e:loaded)
(provide 'init-keybind)
;;; init-keybind.el ends here
