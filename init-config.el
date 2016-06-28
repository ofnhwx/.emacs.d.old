;;; init-enhance.el --- 環境回りの設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/06/22 11:58:07>
;;

;;; Commentary:

;;; Code:

;;; 日本語環境の設定
;; 言語環境
(e:safe-exec (set-language-environment "Japanese"))
;; 文字コード
(e:safe-exec (prefer-coding-system          'utf-8))
(e:safe-exec (set-default-coding-systems    'utf-8))
(e:safe-exec (set-buffer-file-coding-system 'utf-8))
(e:safe-exec (set-terminal-coding-system    'utf-8))
(e:safe-exec (set-keyboard-coding-system    'utf-8))

;; -------------------------------------------------------------------- ;;
;; フォント
;; abcdefghijklmnopqrstuvwxyz
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                            │
;; └─────────────────────────────┘
;; -------------------------------------------------------------------- ;;
(cond
 ;; windows
 ((os-type-win-p)
  (or (e:set-font "MeiryoKe_Gothic" 90)
      (e:set-font "IPAゴシック"     90)))
 ;; linux
 ((os-type-linux-p)
  (or (e:set-font "IPAゴシック" 90)))
 ;; mac
 ((os-type-mac-p)
  (or (e:set-font "Ricty Diminished Discord" 140)
      (e:set-font "Monaco"                   110)))
 ;; その他
 (t
  (e:set-font "Monospace" 90)))

;;; シェバング(#!)があったら'chmod +x'する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; さらに細かなもの
(custom-set-variables
 ;; タイトルバーの書式
 '(frame-title-format
   `("" invocation-name " " emacs-version "@" system-name " - "
     (multiple-frames "[%F]: ")
     (byte-compiled "(byte compiled) ")
     (buffer-file-name "%f" "%b")))
 ;; 日付の書式
 '(display-time-format " %Y/%m/%d(%a) %H:%M")
 ;; -------------------------------------------------------------------- ;;
 '(menu-bar-mode window-system) ;; コンソールではメニューバーを表示しない
 '(ring-bell-function 'ignore)  ;; ビープ音はなし
 '(message-log-max     100000)  ;;
 '(blink-cursor-mode      nil)  ;; カーソルを点滅しない
 '(indent-tabs-mode       nil)  ;; インデントは空白
 '(tab-width              4)    ;; タブ幅は 4
 '(truncate-lines         t)    ;; 折り返さない
 '(column-number-mode     t)    ;; 列番号を表示
 '(display-battery-mode   t)    ;; バッテリー状態を表示
 '(display-time-mode      t)    ;; 時間を表示
 '(global-hl-line-mode    t)    ;; 下線を表示
 '(line-number-mode       t)    ;; 行番号を表示
 '(scroll-bar-mode        nil)  ;; スクロールバーを表示しない
 '(show-paren-mode        t)    ;; paren(対応する括弧のハイライト)を有効
 '(size-indication-mode   t)    ;; サイズを表示
 '(tool-bar-mode          nil)  ;; ツールバーを非表示
 '(tooltip-mode           nil)  ;; ツールチップを非表示
 '(completion-ignore-case t)    ;; 補完で大文字小文字の区別をしない
 '(inhibit-startup-screen t)    ;; スタートアップの画面を表示しない
 '(resize-mini-windows    t)    ;; ミニバッファ拡大防止
 '(mouse-drag-copy-region nil)  ;; 選択範囲を勝手にコピーしない
 '(create-lockfiles       nil)  ;; lockfileを作成しない
 '(require-final-newline  nil)  ;; 勝手に改行を追加しない
 '(mode-require-final-newline nil)
 ;; -------------------------------------------------------------------- ;;
 )

;;; 色設定
(custom-set-faces
 ;; デフォルト, カーソル, リージョン
 '(default ((t (:background "#000000" :foreground "#ffffff"))))
 '(cursor  ((t (:background "#ffff00"))))
 '(region  ((t (:background "#000080"))))
 ;; モードライン
 '(mode-line           ((t (:background "#f00000" :foreground "#ffffff" :box (:line-width 1 :color "#ffffff")))))
 '(mode-line-inactive  ((t (:background "#000000" :foreground "#ffffff" :box (:line-width 1 :color "#ffffff")))))
 '(mode-line-buffer-id          ((t (:background nil :foreground nil :box (:line-width 1 :color "#ffffff")))))
 '(mode-line-buffer-id-inactive ((t (:background nil :foreground nil :box (:line-width 1 :color "#ffffff")))))
 ;; 関数, 変数, 文字列
 '(font-lock-function-name-face   ((t (:foreground "#4169e1"))))
 '(font-lock-variable-name-face   ((t (:foreground "#00ffff"))))
 '(font-lock-string-face          ((t (:foreground "#ffff00"))))
 ;; キーワード, コメント
 '(font-lock-keyword-face ((t (:foreground "#4169e1"))))
 '(font-lock-comment-face ((t (:foreground "#228b22"))))
 ;; 型, ビルトイン, 定数
 '(font-lock-type-face     ((t (:foreground "#ffa500"))))
 '(font-lock-builtin-face  ((t (:foreground "#8470ff"))))
 '(font-lock-constant-face ((t (:foreground "#ffc0cb"))))
 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#ff0000"))))
 '(paren-face            ((t (:foreground "#ffffff"))))
 ;; 警告
 '(font-lock-warning-face ((t (:foreground "#ff0000"))))
 ;; 現在行のハイライト:`linum'
 '(hl-line ((t (:foreground nil :background nil :underline "#80ff80"))))
 ;; 空白文字の表示:`whitespace'
 '(whitespace-tab     ((t (:foreground "#ff0000" :background nil :underline t))))
 '(whitespace-space   ((t (:foreground "#ff0000" :background nil :underline t))))
 '(whitespace-newline ((t (:foreground "#228b22" :background nil))))
 ;; for:`anzu'
 '(anzu-mode-line ((t (:foreground "#000000" :background "#dd00dd"))))
 ;; for:`company'
 '(company-tooltip                  ((t (:foreground "black" :background "lightgrey"))))
 '(company-tooltip-common           ((t (:foreground "black" :background "lightgrey"))))
 '(company-tooltip-common-selection ((t (:foreground "white" :background "steelblue"))))
 '(company-tooltip-selection        ((t (:foreground "black" :background "steelblue"))))
 '(company-preview-common           ((t (:foreground "lightgrey" :background nil :underline t))))
 '(company-scrollbar-fg             ((t (:background "orange"))))
 '(company-scrollbar-bg             ((t (:background "gray40"))))
 ;; for:`dired'
 '(diredp-dir-heading            ((t (:foreground "#ff0000" :background nil))))
 '(diredp-dir-priv               ((t (:foreground "#ffff00" :backtround nil))))
 '(diredp-dir-name               ((t (:foreground "#ffff00" :background nil))))
 '(diredp-file-name              ((t (:foreground "#ffffff" :background nil))))
 '(diredp-file-suffix            ((t (:foreground "#ffffff" :background nil))))
 '(diredp-compressed-file-name   ((t (:foreground "#ff00ff" :background nil))))
 '(diredp-compressed-file-suffix ((t (:foreground "#ff00ff" :background nil))))
 '(diredp-ignored-file-name      ((t (:foreground "#a0a0a0" :background nil))))
 '(diredp-link-priv              ((t (:foreground "#80ffff" :background nil))))
 '(diredp-symlink                ((t (:foreground "#80ffff" :background nil))))
 '(diredp-number                 ((t (:foreground "#ffff80" :background nil))))
 '(diredp-date-time              ((t (:foreground "#8080ff" :background nil))))
 '(diredp-deletion               ((t (:foreground "#ffff00" :background "#ff0000"))))
 '(diredp-deletion-file-name     ((t (:foreground "#ffffff" :background "#800000"))))
 '(diredp-flag-mark              ((t (:foreground "#0000ff" :background "#80ff80"))))
 '(diredp-flag-mark-line         ((t (:foreground "#ffffff" :background "#008000"))))
 '(diredp-rare-priv              ((t (:foreground "#000000" :background "#ff0000"))))
 '(diredp-read-priv              ((t (:foreground "#ffcccc" :background nil))))
 '(diredp-write-priv             ((t (:foreground "#ccffcc" :background nil))))
 '(diredp-exec-priv              ((t (:foreground "#ccccff" :background nil))))
 '(diredp-other-priv             ((t (:foreground "#a0a0a0" :background nil))))
 '(diredp-no-priv                ((t (:foreground "#a0a0a0" :background nil))))
 ;; for:`elscreen'
 '(elscreen-tab-background-face     ((t (:background "#808080" :box (:color "#ffffff")))))
 '(elscreen-tab-control-face        ((t (:foreground "#ff0000" :background "#000000" :box (:color "#ffffff")))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#000000" :background "#ff0000" :box (:color "#ffffff")))))
 '(elscreen-tab-other-screen-face   ((t (:foreground "#ffffff" :background "#000000" :box (:color "#ffffff")))))
 ;; for:`powerline'
 '(powerline-active1   ((t (:foreground "#ffffff" :background "#b00000"))))
 '(powerline-active2   ((t (:foreground "#ffffff" :background "#800000"))))
 '(powerline-inactive1 ((t (:foreground "#ffffff" :background "#404040"))))
 '(powerline-inactive2 ((t (:foreground "#ffffff" :background "#808080"))))
 ;; for:`sunrise'
 '(sr-active-path-face    ((t (:foreground "#000000" :background "#ff0000"))))
 '(sr-highlight-path-face ((t (:foreground "#000000" :background "#ff0000"))))
 '(sr-directory-face      ((t (:foreground "#ffff00" :background nil))))
 )

;;; mac用の設定
(when (os-type-mac-p)
  ;; 対策: [Listing directory failed but `access-file' worked]
  (require 'ls-lisp nil t)
  (custom-set-variables
   '(ls-lisp-use-insert-directory-program nil))
  ;; CommandをMetaとして使用
  (custom-set-variables
   '(ns-command-modifier 'meta))
  ;; 自動的にIMEをオフにする
  (when (fboundp 'mac-change-language-to-us)
    (add-hook 'after-init-hook       'mac-change-language-to-us)
    (add-hook 'isearch-mode-hook     'mac-change-language-to-us)
    (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)))

(e:loaded)
(provide 'init-config)
;;; init-config.el ends here
