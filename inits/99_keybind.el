;;; 99_keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/19 13:00:08>
;;

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 基点
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(e:define-prefix-command base-command-map "他のコマンドへの派生元")
(bind-keys
 :map base-command-map
 (":" . avy-goto-char)
 (";" . avy-goto-word-1)
 ("b" . buffer-command-map)
 ("f" . file-command-map)
 ("g" . general-command-map)
 ("p" . projectile-command-map)
 ("t" . hydra-toggle/body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; いろいろ便利なやつ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(e:define-prefix-command general-command-map "よく使ういろいろなコマンド")
(bind-keys
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ファイル関連
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(e:define-prefix-command file-command-map "ファイル関連のコマンド")
(bind-keys
 :map file-command-map
 ("f" . find-file)
 ("g" . helm-ghq)
 ("h" . helm-find-files)
 ("m" . magit-find-file)
 ("p" . helm-find-files-with-projectile)
 ("r" . helm-recentf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; バッファー関連
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(e:define-prefix-command buffer-command-map "バッファー関連のコマンド")
(bind-keys
 :map buffer-command-map
 ("b" . switch-to-buffer)
 ("k" . kill-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; [Mac] ホイールによるスクロールを調整
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs標準のキーマップとか
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
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
 ("M-y" . helm-show-kill-ring)
 ("M-z" . avy-zap-to-char-dwim))

(bind-keys
 :map ctl-x-map
 ("f" . find-file)
 ("j" . skk-mode)
 ("o" . ace-window)
 ("C-b" . helm-multi-files)
 ("C-c" . execute-extended-command)
 ("C-f" . helm-find-files-with-projectile))

(bind-keys
 :map mode-specific-map
 (":" . avy-goto-char)
 (";" . avy-goto-word-1)
 ("i" . helm-imenu)
 ("t" . google-translate-enja-or-jaen)
 ("x" . shell-pop)
 ("z" . eshell))

(bind-keys
 :map search-map
 ("g" . dumb-jump-go)
 ("b" . dumb-jump-back)
 ("q" . dumb-jump-quick-look))

(bind-keys
 :map help-map
 ("a" . helm-apropos)
 ("b" . helm-descbinds))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;`hydra'によるキー定義
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defhydra hydra-toggle
  (:hint nil)
  "
^Toggle^
-----------------------------
[_h_]: hs-minor-mode   %(if hs-minor-mode \[*\] \[_\])
[_r_]: read-only-mode  %(if buffer-read-only \[*\] \[_\])
[_t_]: truncate-lines  %(if truncate-lines \[*\] \[_\])
[_w_]: whitespace-mode %(if whitespace-mode \[*\] \[_\])
"
  ("h" hs-minor-mode)
  ("r" read-only-mode)
  ("t" toggle-truncate-lines)
  ("w" whitespace-mode))

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
^Prev^           ^^^Next^           ^^^Sort^       ^Other^
----------------------------------------------------------------
[_p_,_<_]: mark    [_n_,_>_]: mark    [_o_]: asc   [_*_]: mark all
[_P_,_U_]: unmark  [_N_,_u_]: unmark  [_O_]: desc  [_d_]: mark all(dwim)
[_S_]^^  : skip    [_s_]^^  : skip    ^^           [_m_]: mark more
^^^^               ^^^^               ^^           [_i_]: insert numbers

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
