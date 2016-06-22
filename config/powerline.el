;;; powerline.el --- 'powerline'の設定
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/06/22 12:56:54>
;;

;;; Commentary:

;;; Code:

(with-eval-after-load "evil"
  (use-package "powerline-evil"
    :ensure t))

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
               (powerline-raw (powerline-evil-tag) (powerline-evil-face)))
             ;; 状態(%:readonly, *:modified, -:otherwise)
             (powerline-raw "%*" mode-line 'l)
             ;; IME
             (powerline-raw mode-line-mule-info mode-line)
             ;; ファイルサイズ
             ;;(when powerline-display-buffer-size
             ;;  (powerline-buffer-size mode-line))
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
             (powerline-raw global-mode-string face2 'r)
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
             ;; スクロールバー
             (powerline-hud face2 face1))))
      (concat
       (powerline-render lhs)
       (powerline-fill face2 (powerline-width rhs))
       (powerline-render rhs))))))

(e:loaded)
;;; powerline.el ends here
