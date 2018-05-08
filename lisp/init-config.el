;;; init-enhance.el --- 環境回りの設定.
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 日本語環境の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; abcdefghijklmnopqrstuvwxyz
;;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;;; `1234567890-=\[];',./
;;; ~!@#$%^&*()_+|{}:"<>?
;;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;;; 123456789012345678901234567890123456789012345678901234567890
;;; ABCdeＡＢＣｄｅ
;;; ┌─────────────────────────────┐
;;; │　　　　　　　　　　　　　罫線                            │
;;; └─────────────────────────────┘
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 言語環境
(e:safe-exec (set-language-environment "Japanese"))

;; 文字コード
(e:safe-exec (prefer-coding-system          'utf-8))
(e:safe-exec (set-default-coding-systems    'utf-8))
(e:safe-exec (set-buffer-file-coding-system 'utf-8))
(e:safe-exec (set-terminal-coding-system    'utf-8))
(e:safe-exec (set-keyboard-coding-system    'utf-8))

;; フォント
(or
 (e:set-font "Ricty Diminished Discord" :target 'japanese-jisx0208 :size 14)
 )
(or
 (e:set-font "Ricty Diminished Discord" :size 14)
 (e:set-font "Monaco" :size 11)
 (e:set-font "Takao")
 (e:set-font "MeiryoKe_Gothic")
 (e:set-font "IPAゴシック")
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; テーマ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-variable 'frame-background-mode 'dark)
(set-variable 'custom-theme-directory (e:expand "themes" :conf))
(load-theme 'init t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 環境設定(共通)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; コマンドに別名を追加
(defalias 'exit 'save-buffers-kill-terminal)
(defalias 'yes-or-no-p 'y-or-n-p)

;; シェバング(#!)があったら'chmod +x'する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; タイトルバーの書式
(set-variable 'frame-title-format
              '((multiple-frames "[%F]:")
                (buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; 行番号の表示
(cond
 ((fboundp 'display-line-numbers-mode)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 4))
 (t
  (add-hook 'prog-mode-hook 'linum-mode)
  (set-variable 'linum-format "%4d")
  (set-variable 'linum-delay t)
  (defadvice linum-schedule (around linum-schedule--delay () activate)
    (run-with-idle-timer 0.3 nil #'linum-update-current))))

;; ファイルを移動
;; [~/.emacs.d/cache]
(set-variable 'auto-insert-directory (e:expand "insert" :cache))
(set-variable 'bookmark-default-file (e:expand "bookmark" :cache))
(set-variable 'custom-file (e:expand "custom.el" :cache))
(set-variable 'save-place-file (e:expand "places" :cache))
(set-variable 'server-auth-dir (e:expand "server" :cache))
(set-variable 'tramp-persistency-file-name (e:expand "tramp" :cache))
(set-variable 'url-cache-directory (e:expand "url" :cache))
(set-variable 'url-cookie-file (e:expand "cookies" :cache))
;; [~/.emacs.d/config]
(set-variable 'auth-sources `(,(e:expand "authinfo.plist" :config)))
(set-variable 'org-directory (e:expand "org" :config))
(let ((org-agenda-dir (e:expand "org/agenda" :config)))
  (when (file-exists-p org-agenda-dir)
    (set-variable 'org-agenda-files (cl-remove-if 'file-directory-p (directory-files org-agenda-dir t)))))

;; さらに細かなもの
(menu-bar-mode window-system) ;; コンソールではメニューバーを表示しない
(auto-insert-mode 1)          ;; 新規ファイルでテンプレートを挿入
(blink-cursor-mode 0)         ;; カーソルを点滅しない
(column-number-mode 0)        ;; 列番号を非表示
(display-battery-mode 0)      ;; バッテリー状態を非表示
(display-time-mode 0)         ;; 時間を非表示
(global-hl-line-mode 0)       ;; 下線を非表示
(line-number-mode 0)          ;; 行番号を非表示
(save-place-mode 1)           ;; カーソル位置を保存
(scroll-bar-mode 0)           ;; スクロールバーを表示しない
(show-paren-mode 1)           ;; paren(対応する括弧のハイライト)を有効
(size-indication-mode 0)      ;; サイズを非表示
(tool-bar-mode 0)             ;; ツールバーを非表示
(tooltip-mode 0)              ;; ツールチップを非表示
(set-variable 'completion-ignore-case t)                                ;; 補完で大文字小文字の区別をしない
(set-variable 'create-lockfiles nil)                                    ;; lockfileを作成しない
(set-variable 'ediff-split-window-function 'split-window-horizontally)  ;; `ediff'を横に並べて表示
(set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)  ;; `ediff'でフレームを使用しない
(set-variable 'epa-pinentry-mode 'loopback)                             ;; GnuPGでloopbackを指定
(set-variable 'gc-cons-percentage 0.5)                                  ;; GC関連の調整
(set-variable 'gc-cons-threshold (* 128 1024 1024))                     ;; 〃
(set-variable 'inhibit-startup-screen t)                                ;; スタートアップの画面を表示しない
(set-variable 'kill-ring-max 1000)                                      ;; `kill-ring'の最大数
(set-variable 'max-lisp-eval-depth 10000)                               ;; 安全策
(set-variable 'max-specpdl-size 10000)                                  ;; 〃
(set-variable 'message-log-max 100000)                                  ;; `*Messages*'バッファの最大行数
(set-variable 'mode-require-final-newline nil)                          ;; 勝手に改行を追加しない(`EditorConfig'で管理)
(set-variable 'mouse-drag-copy-region nil)                              ;; 選択範囲を勝手にコピーしない
(set-variable 'password-cache-expiry 3600)                              ;; パスワードをキャッシュしておく
(set-variable 'plstore-encoded t)                                       ;; `plstore-mode'で暗号化する
(set-variable 'require-final-newline nil)                               ;; `mode-require-final-newline'
(set-variable 'resize-mini-windows t)                                   ;; ミニバッファ拡大防止
(set-variable 'ring-bell-function 'ignore)                              ;; ビープ音はなし
(set-variable 'truncate-partial-width-windows nil)                      ;; 折り返しは`truncate-lines'で制御
(set-variable 'uniquify-buffer-name-style 'post-forward-angle-brackets) ;; バッファ名をユニークにする
(setq-default bidi-display-reordering nil)                              ;; 右から左に読む言語に対応しない
(setq-default indent-tabs-mode nil)                                     ;; インデントは空白
(setq-default tab-width 4)                                              ;; タブ幅
(setq-default truncate-lines t)                                         ;; 折り返さない

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 環境設定(個別)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
(when window-system
  (add-hook 'after-init-hook 'server-start))

;; Linux/Mac用の設定
(when (or (os-type-linux-p)
          (os-type-mac-p))
  ;; 対策: [Listing directory failed but `access-file' worked]
  (require 'ls-lisp nil t)
  (set-variable 'ls-lisp-use-insert-directory-program nil)
  ;; Emacsで使うshellはzsh(fishは'&&'->'; and'で問題あり)
  (set-variable 'shell-file-name
                (or (executable-find "zsh")
                    (executable-find "bash")
                    (executable-find "sh"))))

;;; mac用の設定
(when (os-type-mac-p)
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
