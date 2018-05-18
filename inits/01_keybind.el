;;; 01_keybind.el --- キーバインド.
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; キーマップを定義
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(e:define-prefix-command base-command-map "他のコマンドへの派生元")
(e:define-prefix-command general-command-map "よく使ういろいろなコマンド")
(e:define-prefix-command file-command-map "ファイル関連のコマンド")
(e:define-prefix-command buffer-command-map "バッファー関連のコマンド")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 基点
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
 :map base-command-map
 ("," . hydra-mc/body)
 ("b" . buffer-command-map)
 ("f" . file-command-map)
 ("g" . general-command-map)
 ("t" . hydra-toggle/body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; いろいろ便利なやつ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
 :map general-command-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ファイル関連
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
 :map file-command-map
 ("f" . find-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; バッファー関連
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
 ("ESC ESC ESC" . keyboard-quit)
 ("C-," . base-command-map)
 ("C-<backspace>" . cycle-spacing)
 ("C-M-¥" . indent-region)
 ("M-g" . general-command-map))

(bind-keys
 :map ctl-x-map
 ("f" . find-file)
 ("C-c" . execute-extended-command))

(bind-keys
 :map mode-specific-map
 ("o" . open-by-intellij))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;`hydra'によるキー定義
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defhydra hydra-toggle
  (:hint nil)
  "
^Toggle^
-----------------------------
[_h_]: 折りたたみ     %(if hs-minor-mode        \[*\] \[_\])
[_r_]: 読取専用       %(if buffer-read-only     \[*\] \[_\])
[_t_]: 折り返し       %(if (not truncate-lines) \[*\] \[_\])
[_v_]: 表示行で移動   %(if visual-line-mode     \[*\] \[_\])
[_w_]: 空白文字を表示 %(if whitespace-mode      \[*\] \[_\])
"
  ("h" hs-minor-mode)
  ("r" read-only-mode)
  ("t" toggle-truncate-lines)
  ("v" visual-line-mode)
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

(e:loaded)
(provide '01_keybind)
;;; 01_keybind.el ends here
