;;; init-enhance.el --- 環境回りの設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/17 15:02:14>
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
;; テーマ関連
(set-variable 'custom-theme-directory (e:expand "themes" :user))

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
  (or (e:set-font "Takao" 90)
      (e:set-font "IPAゴシック" 90)))
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
;; タイトルバーの書式
(set-variable
 'frame-title-format
 `("" invocation-name " " emacs-version "@" system-name " - "
   (multiple-frames "[%F]: ")
   (byte-compiled "(byte compiled) ")
   (buffer-file-name "%f" "%b")))
;; 日付の書式
(set-variable 'display-time-format " %Y/%m/%d(%a) %H:%M")
;; 認証ファイル
(set-variable 'auth-sources `(,(e:expand ".authinfo.gpg" :local)))
;; -------------------------------------------------------------------- ;;
(menu-bar-mode window-system) ;; コンソールではメニューバーを表示しない
(tool-bar-mode             0) ;; ツールバーを非表示
(tooltip-mode              0) ;; ツールチップを非表示
(scroll-bar-mode           0) ;; スクロールバーを表示しない
(show-paren-mode           1) ;; paren(対応する括弧のハイライト)を有効
(blink-cursor-mode         0) ;; カーソルを点滅しない
(global-hl-line-mode       1) ;; 下線を表示
(size-indication-mode      1) ;; サイズを表示
(display-time-mode         1) ;; 時間を表示
(line-number-mode          1) ;; 行番号を表示
(column-number-mode        1) ;; 列番号を表示
(display-battery-mode      1) ;; バッテリー状態を表示
(set-variable 'max-specpdl-size     10000)  ;; 安全策
(set-variable 'max-lisp-eval-depth  10000)  ;;
(set-variable 'ring-bell-function 'ignore)  ;; ビープ音はなし
(set-variable 'message-log-max     100000)  ;;
(set-variable 'kill-ring-max          200)  ;;
(set-variable 'indent-tabs-mode       nil)  ;; インデントは空白
(set-variable 'tab-width              4)    ;; タブ幅は 4
(set-variable 'truncate-lines         t)    ;; 折り返さない
(set-variable 'truncate-partial-width-windows nil)
(set-variable 'completion-ignore-case t)    ;; 補完で大文字小文字の区別をしない
(set-variable 'inhibit-startup-screen t)    ;; スタートアップの画面を表示しない
(set-variable 'resize-mini-windows    t)    ;; ミニバッファ拡大防止
(set-variable 'mouse-drag-copy-region nil)  ;; 選択範囲を勝手にコピーしない
(set-variable 'create-lockfiles       nil)  ;; lockfileを作成しない
(set-variable 'require-final-newline  nil)  ;; 勝手に改行を追加しない
(set-variable 'mode-require-final-newline nil)
;; -------------------------------------------------------------------- ;;

(defalias 'exit 'save-buffers-kill-terminal)

;;; linux用の設定
(when (os-type-linux-p)
  ;; 対策: [Listing directory failed but `access-file' worked]
  (require 'ls-lisp nil t)
  (set-variable 'ls-lisp-use-insert-directory-program nil))

;;; mac用の設定
(when (os-type-mac-p)
  ;; 対策: [Listing directory failed but `access-file' worked]
  (require 'ls-lisp nil t)
  (set-variable 'ls-lisp-use-insert-directory-program nil)
  ;; Emacsで使うshellはzsh(fishは'&&'->'; and'で問題あり)
  (set-variable 'shell-file-name (executable-find "zsh"))
  ;; IME関連の設定
  (set-variable 'default-input-method "MacOSX")
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
  (set-variable 'ns-command-modifier 'meta)
  ;; 自動的にIMEをオフにする
  (when (fboundp 'mac-change-language-to-us)
    (add-hook 'after-init-hook       'mac-change-language-to-us)
    (add-hook 'isearch-mode-hook     'mac-change-language-to-us)
    (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)))

(e:loaded)
(provide 'init-config)
;;; init-config.el ends here
