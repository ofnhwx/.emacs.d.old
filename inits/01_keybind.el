;;; 01_keybind.el --- キーバインド.
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 拡張
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
 :prefix-map e:base-commands-map
 :prefix "C-,"
 (":" . avy-goto-char-timer)
 (";" . avy-goto-word-1)
 ("C-SPC" . git-complete)
 ("F" . e:frame-commands-map)
 ("SPC" . company-complete)
 ("b" . e:buffer-commands-map)
 ("f" . e:file-commands-map)
 ("g" . e:git-commands-map)
 ("p" . projectile-command-map)
 ("t" . e:git-commands-map)
 ("w" . e:window-commands-map)
 ("x" . execute-extended-command))

(defalias 'e:frame-commands-map 'ctl-x-5-prefix)

(bind-keys
 :prefix-map e:buffer-commands-map
 :prefix "C-, b"
 ("b" . switch-to-buffer)
 ("k" . kill-buffer))

(bind-keys
 :prefix-map e:common-commands-map
 :prefix "C-, c"
 ("," . helm-ag-pop-stack)
 ("." . helm-ag)
 ("/" . helm-ag-project-root)
 ("_" . helm-ag-this-file)
 ("e" . string-edit-at-point)
 ("g" . avy-goto-line))

(bind-keys
 :prefix-map e:file-commands-map
 :prefix "C-, f"
 ("f" . find-file)
 ("g" . helm-ghq)
 ("h" . helm-find-files)
 ("m" . magit-find-file)
 ("p" . helm-find-files-with-projectile)
 ("r" . helm-recentf))

(bind-keys
 :prefix-map e:git-commands-map
 :prefix "C-, g"
 ("d" . magit-diff-buffer-file-popup)
 ("l" . magit-log-buffer-file-popup)
 ("s" . magit-status))

(bind-keys
 :prefix-map e:toggle-commands-map
 :prefix "C-, t"
 ("t" . hydra-toggle/body))

(bind-keys
 :prefix-map e:window-commands-map
 :prefix "C-, w"
 ("w" . hydra-wc/body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 基本
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-keys
 :map global-map
 ("C-:" . avy-goto-char-timer)
 ("C-;" . avy-goto-word-1)
 ("C-<" . er/contract-region)
 ("C-<backspace>" . cycle-spacing)
 ("C->" . er/expand-region)
 ("C-@" . helm-multi-files)
 ("C-M-¥" . indent-region)
 ("C-\\" . skk-mode)
 ("C-^" . ace-window)
 ("C-¥" . skk-mode)
 ("ESC ESC ESC" . keyboard-quit)
 ("M-%" . vr/query-replace)
 ("M-/" . bbyac-expand-symbols)
 ("M-:" . helm-eval-expression-with-eldoc)
 ("M-X" . lacarte-execute-command)
 ("M-g" . e:common-commands-map)
 ("M-y" . helm-show-kill-ring)
 ("M-z" . avy-zap-to-char-dwim))

(bind-keys
 :map ctl-x-map
 ("!" . zoom-window-zoom)
 ("C-b" . helm-multi-files)
 ("C-c" . execute-extended-command)
 ("C-f" . helm-find-files-with-projectile)
 ("f" . find-file)
 ("j" . skk-mode)
 ("o" . ace-window))

(bind-keys
 :map ctl-x-r-map
 ("h" , helm-register))

(bind-keys
 :map mode-specific-map
 (":" . avy-goto-char-timer)
 (";" . avy-goto-word-1)
 ("=" . hydra-wc/body)
 ("i" . helm-imenu)
 ("o" . open-by-intellij)
 ("t" . google-translate-enja-or-jaen)
 ("x" . shell-pop)
 ("z" . eshell))

(bind-keys
 :map help-map
 ("a" . helm-apropos)
 ("b" . helm-descbinds))

(bind-keys
 :map search-map
 ("g" . dumb-jump-go)
 ("b" . dumb-jump-back)
 ("q" . dumb-jump-quick-look))

(bind-keys
 :map isearch-mode-map
 ("C-i" . avy-isearch)
 ("C-o" . helm-swoop-from-isearch))

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

(defhydra hydra-wc
  (:color amaranth :hint nil)
  "
^Other window^              ^^This window^^                 ^Rotate^
------------------------------------------------------------------------
[_n_]: scroll down          [_=_]^^: balance                [_w_]: window
[_p_]: scroll up            [_\\^_]: enlarge                [_l_]: layout
[_N_]: scroll down (page)   [_~_]^^: shrink
[_P_]: scroll up   (page)   [_{_]^^: enlarge (horizontally)
^^                          [_}_]^^: shrink  (horizontally)

"
  ("n" (lambda () (interactive) (scroll-other-window  1)))
  ("p" (lambda () (interactive) (scroll-other-window -1)))
  ("N" (lambda () (interactive) (scroll-other-window)))
  ("P" (lambda () (interactive) (scroll-other-window '-)))
  ("=" balance-windows)
  ("^" enlarge-window)
  ("~" shrink-window)
  ("{" enlarge-window-horizontally)
  ("}" shrink-window-horizontally)
  ("w" rotate-window)
  ("l" rotate-layout)
  ("q" nil "quit" :color blue))

(e:loaded)
(provide '01_keybind)
;;; 01_keybind.el ends here
