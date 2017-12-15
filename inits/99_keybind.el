;;; 99_keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/15 13:12:52>
;;

;;; Commentary:

;;; Code:

(e:define-prefix-command base-command-map    "他のコマンドへの派生元")
(e:define-prefix-command buffer-command-map  "バッファー関連のコマンド")
(e:define-prefix-command file-command-map    "ファイル関連のコマンド")
(e:define-prefix-command general-command-map "よく使ういろいろなコマンド")

(bind-keys
 :map base-command-map
 ("b" . buffer-command-map)
 ("f" . file-command-map)
 ("g" . general-command-map)
 ("t" . hydra-toggle/body)
 :map buffer-command-map
 ("b" . switch-to-buffer)
 ("k" . kill-buffer)
 :map file-command-map
 ("f" . find-file)
 ("g" . helm-ghq)
 ("h" . helm-find-files)
 ("m" . magit-find-file)
 ("p" . helm-find-files-with-projectile)
 ("r" . helm-recentf)
 :map general-command-map
 ("," . helm-ag-pop-stack)
 ("." . helm-ag)
 ("/" . helm-ag-project-root)
 ("_" . helm-ag-this-file)
 ("d" . magit-diff-buffer-file-popup)
 ("e" . string-edit-at-point)
 ("g" . avy-goto-line)
 ("l" . magit-log-buffer-file-popup)
 ("m" . helm-switch-major-mode)
 ("s" . magit-status))

(bind-keys
 :map search-map ;; M-s
 ("g" . dumb-jump-go)
 ("b" . dumb-jump-back)
 ("q" . dumb-jump-quick-look)
 :map help-map ;; C-h
 ("a" . helm-apropos)
 ("b" . helm-descbinds)
 :map ctl-x-map
 ("f" . find-file)
 ("j" . skk-mode)
 ("o" . ace-window)
 ("C-b" . helm-multi-files)
 ("C-c" . helm-M-x)
 ("C-f" . helm-find-files-with-projectile)
 :map mode-specific-map ;; C-c
 ("i" . helm-imenu)
 ("t" . google-translate-enja-or-jaen)
 ("x" . shell-pop)
 ("z" . eshell)
 :map global-map
 ("C-," . base-command-map)
 ("C-:" . avy-goto-char)
 ("C-;" . avy-goto-word-1)
 ("C-<" . er/contract-region)
 ("C->" . er/expand-region)
 ("C-M-¥" . indent-region)
 ("C-^" . ace-window)
 ("C-¥" . skk-mode)
 ("M-%" . vr/query-replace)
 ("M-/" . bbyac-expand-symbols)
 ("M-:" . helm-eval-expression-with-eldoc)
 ("M-X" . lacarte-execute-command)
 ("M-g" . general-command-map)
 ("M-x" . helm-M-x)
 ("M-y" . helm-show-kill-ring)
 ("M-z" . avy-zap-to-char-dwim))

(when (os-type-mac-p)
  (defun scroll-down-with-lines ()
    (interactive)
    (scroll-down 3))
  (defun scroll-up-with-lines ()
    (interactive)
    (scroll-up 3))
  (bind-keys
   :map global-map
   ("<wheel-up>"          . scroll-down-with-lines)
   ("<wheel-down>"        . scroll-up-with-lines)
   ("<double-wheel-up>"   . scroll-down-with-lines)
   ("<double-wheel-down>" . scroll-up-with-lines)
   ("<triple-wheel-up>"   . scroll-down-with-lines)
   ("<triple-wheel-down>" . scroll-up-with-lines)))

(defhydra hydra-toggle
  ()
  "toggle"
  ("h" hs-minor-mode         "hideshow")
  ("r" read-only-mode        "readonly")
  ("t" toggle-truncate-lines "truncate")
  ("w" whitespace-mode       "whitespace"))

(defhydra hydra-jump
  (global-map "M-g")
  "jump"
  ("n" next-error               "next-error")
  ("p" previous-error           "prev-error")
  ("N" git-gutter:next-hunk     "next-hunk")
  ("P" git-gutter:previous-hunk "prev-hunk"))

(defhydra hydra-mc
  (global-map "C-t" :color pink :hint nil)
  "
^Prev^           ^Next^           ^Sort^       ^Other^
----------------------------------------------------------------
[_p_,_<_]: mark    [_n_,_>_]: mark    [_o_]: asc   [_*_]: mark all
[_P_,_U_]: unmark  [_N_,_u_]: unmark  [_O_]: desc  [_d_]: mark all(dwim)
[_S_]  : skip    [_s_]  : skip               [_m_]: mark more
                                         [_i_]: insert numbers

"
  ;; Prev
  ("p" mc/mark-previous-like-this)
  ("<" mc/mark-previous-like-this)
  ("P" mc/unmark-previous-like-this)
  ("U" mc/unmark-previous-like-this)
  ("S" mc/skip-to-previous-like-this)
  ;; Next
  ("n" mc/mark-next-like-this)
  (">" mc/mark-next-like-this)
  ("N" mc/unmark-next-like-this)
  ("u" mc/unmark-next-like-this)
  ("s" mc/skip-to-next-like-this)
  ;; Sort
  ("o" mc/sort-regions)
  ("O" mc/reverse-regions)
  ;; Other
  ("*" mc/mark-all-like-this)
  ("d" mc/mark-all-like-this-dwim)
  ("m" mc/mark-more-like-this-extended)
  ("i" mc/insert-numbers)
  ("q" nil "quit" :color blue))

(defhydra hydra-wc
  (global-map "C-c" :color amaranth :hint nil)
  "
^Other window^              ^This window^
---------------------------------------------------------
[_n_]: scroll down          [_=_]: balance
[_p_]: scroll up            [_~_]: shrink
[_N_]: scroll down (page)   [_{_]: enlarge (horizontally)
[_P_]: scroll up   (page)   [_}_]: shrink  (horizontally)

"
  ("n" (lambda () (interactive) (scroll-other-window  1)))
  ("p" (lambda () (interactive) (scroll-other-window -1)))
  ("N" (lambda () (interactive) (scroll-other-window)))
  ("P" (lambda () (interactive) (scroll-other-window '-)))
  ("=" balance-windows)
  ("~" shrink-window)
  ("^" enlarge-window)
  ("{" shrink-window-horizontally)
  ("}" enlarge-window-horizontally)
  ("q" nil "quit" :color blue))

(mykie:set-keys global-map
  "C-w"
  :default (kill-region (line-beginning-position) (line-end-position))
  :region kill-region
  "M-w"
  :default (kill-ring-save (line-beginning-position) (line-end-position))
  :region kill-ring-save)

(provide '99_keybind)
;;; 99_keybind.el ends here
