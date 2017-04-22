;;; 20_powerline.el --- setup powerline.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 01:22:02>
;;

;;; Commentary:

;;; Code:

(use-package powerline
  :ensure t)

(with-eval-after-load "evil"
  (defface powerline-evil-normal-face   '((t (:foreground "#000000" :background "#59ff59"))) "NORMAL state."   :group 'powerline)
  (defface powerline-evil-insert-face   '((t (:foreground "#000000" :background "#5959ff"))) "INSERT state."   :group 'powerline)
  (defface powerline-evil-visual-face   '((t (:foreground "#000000" :background "#ff5959"))) "VISUAL state."   :group 'powerline)
  (defface powerline-evil-operator-face '((t (:foreground "#000000" :background "#59ffff"))) "OPERATOR state." :group 'powerline)
  (defface powerline-evil-replace-face  '((t (:foreground "#000000" :background "#ffff59"))) "REPLACE state."  :group 'powerline)
  (defface powerline-evil-motion-face   '((t (:foreground "#000000" :background "#ff59ff"))) "MOTION state."   :group 'powerline)
  (defface powerline-evil-emacs-face    '((t (:foreground "#000000" :background "#ff00ff"))) "EMACS state."    :group 'powerline)
  (defun powerline-evil-state ()
    (upcase (format "[%s]" evil-state)))
  (defun powerline-evil-face ()
    (let ((face (intern (format "powerline-evil-%s-face" evil-state))))
      (if (facep face)
          face
        nil))))

(defun get-buffer-file-eol-type ()
  "バッファの改行コードを取得する."
  (cl-case (coding-system-eol-type buffer-file-coding-system)
    (0 "LF")
    (1 "CRLF")
    (2 "CR")
    (otherwise "??")))

(defun get-buffer-coding-type-without-eol-type ()
  "バッファの文字コードを取得する."
  (let ((s (symbol-name buffer-file-coding-system))
        (rep-strings '(("-\\(dos\\|unix\\|mac\\)$" "")
                       ("-with-signature" "(bom)")
                       ("japanese-shift-jis" "sjis"))))
    (cl-dolist (rep-string rep-strings)
      (setq s (replace-regexp-in-string (cl-first rep-string) (cl-second rep-string) s)))
    (upcase s)))

(defpowerline powerline-coding-type
  (concat (get-buffer-coding-type-without-eol-type) "[" (get-buffer-file-eol-type) "]"))

(setq-default
 mode-line-format
 `("%e"
   (:eval
    (let* ((active (powerline-selected-window-active))
           (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
           (mode-line           (if active 'mode-line 'mode-line-inactive))
           (face1               (if active 'powerline-active1 'powerline-inactive1))
           (face2               (if active 'powerline-active2 'powerline-inactive2))
           (separator-left  (intern (format "powerline-%s-%s" (powerline-current-separator) (car powerline-default-separator-dir))))
           (separator-right (intern (format "powerline-%s-%s" (powerline-current-separator) (cdr powerline-default-separator-dir))))
           ;;
           (lhs
            (list
             ;; ステート(evil)
             (when (bound-and-true-p evil-mode)
               (powerline-raw (powerline-evil-state) (powerline-evil-face)))
             ;; 状態(%:readonly, *:modified, -:otherwise)
             (powerline-raw "%*" mode-line 'l)
             ;; IME
             ;;(powerline-raw mode-line-mule-info mode-line)
             (powerline-raw current-input-method-title mode-line)
             (powerline-coding-type mode-line)
             ;; バッファー名
             (powerline-buffer-id mode-line-buffer-id 'r)
             ;; 関数名(wchich-func-mode)
             (when (bound-and-true-p which-func-mode)
               (powerline-raw which-func-format nil 'l))
             ;; >>>
             (funcall separator-left mode-line face1)
             ;; 更新チャンネル(erc)
             (when (bound-and-true-p erc-track-minor-mode)
               (powerline-raw erc-modified-channels-object face1 'l))
             ;; メジャーモード
             (powerline-major-mode face1 'l)
             ;; 実行中のプロセス
             (powerline-process face1)
             ;; マイナーモード
             (powerline-minor-modes face1 'l)
             ;; Narrowing([C-x n n] ⇔ [C-x n w])
             (powerline-narrow face1 'l)
             ;; >>>
             (funcall separator-left face1 face2)
             ;; Version Control
             (powerline-vc face2 'r)))
           ;;
           (rhs
            (list
             ;; バッテリー、時刻等
             ;;(powerline-raw global-mode-string face2 'r)
             ;; <<<
             (funcall separator-right face2 face1)
             ;; 行・列
             (powerline-raw "%4l" face1)
             (powerline-raw ":" face1)
             (powerline-raw "%3c" face1 'r)
             ;; <<<
             (funcall separator-right face1 mode-line)
             ;; バッファー内での位置
             (powerline-raw "%6p" mode-line 'r)
             ;; perspeen
             (when (boundp 'perspeen-modestring)
               (powerline-raw perspeen-modestring))
             ;; スクロールバー
             (powerline-hud face2 face1))))
      (concat
       (powerline-render lhs)
       (powerline-fill face2 (powerline-width rhs))
       (powerline-render rhs))))))

(provide '20_powerline)
;;; 20_powerline.el ends here
