;;; init-enhance.el --- 環境回りの設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2016/10/20 18:00:25>
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
 ;; 認証ファイル
 '(auth-sources `(,(e:expand ".authinfo.gpg" :local)))
 ;; -------------------------------------------------------------------- ;;
 '(menu-bar-mode window-system) ;; コンソールではメニューバーを表示しない
 '(ring-bell-function 'ignore)  ;; ビープ音はなし
 '(message-log-max     100000)  ;;
 '(kill-ring-max          200)  ;;
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

(defalias 'exit 'save-buffers-kill-terminal)

;;; mac用の設定
(when (os-type-mac-p)
  ;; 対策: [Listing directory failed but `access-file' worked]
  (require 'ls-lisp nil t)
  (custom-set-variables
   '(ls-lisp-use-insert-directory-program nil))
  ;; Emacsで使うshellはzsh(fishは'&&'->'; and'で問題あり)
  (custom-set-variables
   `(shell-file-name ,(executable-find "zsh")))
  ;; IME関連の設定
  (custom-set-variables
   '(default-input-method "MacOSX"))
  (when (fboundp 'mac-set-input-method-parameter)
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman"          'title "[G]")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman"          'cursor-color "#ffff00")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base"           'title "[ぐ]")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base"           'cursor-color "#ff0000")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Katakana"       'title "[グ]")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Katakana"       'cursor-color "#00ff00")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.FullWidthRoman" 'title "[Ｇ]")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.FullWidthRoman" 'cursor-color "#ff00ff")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.HalfWidthKana"  'title "[ｸﾞ]")
    (mac-set-input-method-parameter "com.google.inputmethod.Japanese.HalfWidthKana"  'cursor-color "#0000ff"))
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
