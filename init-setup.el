;;; init-setup.el --- 標準Lispでの設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-

;; Last updated: <2017/04/24 12:44:30>
;;

;;; Commentary:

;;; Code:

;; for:`abbrev'
(when (e:require 'abbrev t)
  (set-variable 'abbrev-file-name (e:expand "abbrev.defs" :local))
  (set-variable 'save-abbrevs t)
  (when (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file)))

;; for:`autoinsert'
(when (e:require 'autoinsert t)
  (set-variable 'auto-insert-directory (e:expand "insert" :local))
  (auto-insert-mode 1))

;; for:`bookmark'
(when (e:require 'bookmark t)
  (set-variable 'bookmark-default-file (e:expand ".emacs.bmk" :local)))

;; for:`cua-mode'
(when (e:require 'cua-base t)
  (set-variable 'cua-enable-cua-keys nil)
  (cua-mode 1))

;; for:`dired'
(when (e:require 'dired t)
  (e:require 'wdired t)
  (e:require 'dired-x t)
  (set-variable 'dired-use-ls-dired t)           ;; 'ls'に'--dired'をオプションとして渡す
  (set-variable 'ls-lisp-dirs-first t)           ;; ディレクトリを上に表示
  (set-variable 'dired-dwim-target t)            ;; 2つ開いてる場合にもう片方をデフォルトのターゲットに
  (set-variable 'dired-recursive-copies 'always) ;; ディレクトリを再帰的にコピーする
  (set-variable 'dired-isearch-filenames t)      ;; diredバッファでC-sした時にファイル名だけにマッチするように
  (set-variable 'dired-listing-switches "ahl")   ;; 'ls'に渡すオプション
  (defun dired-show-details ()
    (dired-hide-details-mode 0))
  (add-hook 'dired-mode-hook 'dired-show-details))

;; for:`ediff'
(when (e:require 'ediff t)
  (set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
  (set-variable 'ediff-split-window-function 'split-window-horizontally))

;; for:`eldoc'
(when (e:require 'eldoc t)
  (set-variable 'eldoc-idle-delay 0)
  (set-variable 'eldoc-echo-area-use-multiline-p t)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

;; for:`eshell'
(when (e:require 'eshell t)
  ;; command - clear
  (defun eshell/clear ()
    "Clear the current buffer, leaving one prompt at the top."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))
  ;; command - less : written by Stefan Reichoer <reichoer@web.de>
  (defun eshell/less (&rest args)
    "Invoke `view-file' on the file. 
  \"less +42 foo\" also goes to line 42 in the buffer."
    (while args
      (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
          (let* ((line (string-to-number (match-string 1 (pop args))))
                 (file (pop args)))
            (view-file file)
            (goto-line line))
        (view-file (pop args)))))
  ;;; 各種設定
  ;; eshellの基準ディレクトリを変更
  (set-variable 'eshell-directory-name (e:expand "eshell" :local))
  ;; 履歴
  (set-variable 'eshell-history-size 100000)
  ;; 補完時に大文字小文字を区別しない
  (set-variable 'eshell-cmpl-ignore-case t)
  ;; 履歴で重複を無視する
  (set-variable 'eshell-hist-ignoredups t)
  ;; 確認なしでヒストリ保存
  (set-variable 'eshell-ask-to-save-history (quote always))
  ;; 補完時にサイクルしない
  (set-variable 'eshell-cmpl-cycle-completions nil)
  ;;
  (set-variable 'eshell-visual-commands '("elm" "less" "lynx" "rlogin" "more" "ncftp" "pine" "screen" "ssh" "telnet" "tin" "top" "trn" "vi"))
  ;;
  (set-variable 'eshell-escape-control-x nil)
  ;; prompt 文字列の変更
  (set-variable 'eshell-prompt-function  (lambda () (concat "[" (e:unexpand (eshell/pwd)) "]\n" (if (zerop (user-uid)) "# " "$ "))))
  (set-variable 'eshell-prompt-regexp "^[^#$]*[#$] "))

;; for:`generic-x'
(when (e:require 'generic-x t)
  )

;; for:`recentf'
(when (e:require 'recentf t)
  (set-variable 'recentf-save-file (e:expand ".recentf" :local))
  (set-variable 'recentf-max-menu-items 20)
  (set-variable 'recentf-max-saved-items 3000)
  (set-variable 'recentf-exclude `("^/[^/:]+:" "\\.howm$" "\\.org$" ,(rx bol (eval (e:get-dir :temp)))))
  (set-variable 'recentf-filename-handlers '(abbreviate-file-name))
  (run-with-idle-timer 300 t 'recentf-save-list)
  (defadvice recentf-save-list (before recentf-save-list--convert-home activate)
    (let ((list nil))
      (dolist (file (mapcar 'abbreviate-file-name recentf-list))
        (or (member file list)
            (push file list)))
      (setq recentf-list (reverse list))))
  (recentf-mode 1))

;; for:`eww'
(when (e:require 'eww t)
  (set-variable 'eww-search-prefix "http://www.google.co.jp/search?q=")
  ;; 色設定 [ http://rubikitch.com/2014/11/19/eww-nocolor/ ]
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "ewwで文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "ewwで文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload)))

;; for:`files'
(when (e:require 'files t)
  ;; バックアップディレクトリの設定
  (defconst backup-directory (e:expand "backup" :local))
  ;; for:`backup'
  (let ((item (cons "\\.*$" backup-directory)))
    (unless (member item backup-directory-alist)
      (cl-pushnew item backup-directory-alist)))
  (set-variable 'make-backup-files   t) ;; バックアップを作成する
  (set-variable 'backup-by-copying   t) ;; コピーをバックアップする
  (set-variable 'version-control     t) ;; バックアップのバージョンを管理する
  (set-variable 'delete-old-versions t) ;; 古いバックアップを削除する
  (set-variable 'kept-new-versions   3) ;; 新しいバージョンの数
  (set-variable 'kept-old-versions   3) ;; 古いバージョンの数
  ;; for:`auto-save'
  (set-variable 'auto-save-default t)
  (set-variable 'auto-save-list-file-prefix (file-name-as-directory backup-directory))
  (set-variable 'auto-save-file-name-transforms `((".*" ,backup-directory t))))

;; for:`hideshow'
(when (e:require 'hideshow t)
  (add-hook 'lisp-interaction-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'lisp-mode-hook 'hs-minor-mode)
  (add-hook 'css-mode-hook 'hs-minor-mode)
  (add-hook 'php-mode-hook 'hs-minor-mode)
  (add-hook 'web-mode-hook 'hs-minor-mode))

;; for:`ido'
(when (e:require 'ido t)
  (set-variable 'ido-enable-flex-matching t)
  (set-variable 'ido-save-directory-list-file (e:expand ".ido.last" :local))
  (ido-everywhere 1)
  (ido-mode 1))

;; for:`linum'
(when (e:require 'linum t)
  ;; 書式
  (set-variable 'linum-format "%5d")
  ;; アイドル時に更新
  (defadvice linum-schedule (around linum-schedule--delay () activate)
    (run-with-idle-timer 0.3 nil #'linum-update-current))
  ;; モード毎に無効にする設定
  (defvar linum-ignore-mode-list nil
    "デフォルトで`linum-mode'を有効にしないモードのリスト")
  (defadvice linum-on (around linum-on--ignore activate)
    "`linum-ignore-mode-list'で指定されたモードでは`linum-mode'を有効にしない"
    (unless (member major-mode linum-ignore-mode-list)
      ad-do-it))
  ;; 行番号非表示にするモード
  (cl-pushnew 'eww-mode linum-ignore-mode-list)
  (cl-pushnew 'sr-mode  linum-ignore-mode-list)
  ;; 有効可
  (global-linum-mode 1))

;; for:`server'
(when (e:require 'server t)
  (set-variable 'server-auth-dir (e:expand "server" :local))
  (when window-system
    (add-hook 'after-init-hook 'server-start)))

;; for:`time-stamp'
(when (e:require 'time-stamp t)
  (add-hook 'before-save-hook 'time-stamp)
  (set-variable 'time-stamp-active t)
  (set-variable 'time-stamp-start  (concat "Last " "updated: <"))
  (set-variable 'time-stamp-format "%04y/%02m/%02d %02H:%02M:%02S")
  (set-variable 'time-stamp-end    ">"))

;; for:`tramp'
(when (e:require 'tramp t)
  (set-variable 'tramp-persistency-file-name (e:expand "tramp" :local)))

;; for:`uniquify'
(when (e:require 'uniquify t)
  (set-variable 'uniquify-buffer-name-style 'post-forward-angle-brackets))

;; for:`url-cookie'
(when (e:require 'url-cookie t)
  (set-variable 'url-cookie-file (e:expand "cookies" :local)))

;; for:`whitespace'
(when (e:require 'whitespace t)
  (set-variable
   'whitespace-style
   '(face      ;; 'face'で色を付ける
     trailing  ;; 末尾の空白
     tabs      ;; TAB文字
     newline   ;; 改行文字
     spaces    ;; 空白文字
     space-mark
     tab-mark
     newline-mark))
  (set-variable 'whitespace-space-regexp "\\(\x3000+\\)")
  (set-variable
   'whitespace-display-mappings
   '((space-mark   ?\u3000 [?\u25A1])
     (tab-mark     ?\t     [?\u00BB ?\t])
     (newline-mark ?\n     [?\u21B5 ?\n])))
  ;; すべてのバッファで有効にする
  (global-whitespace-mode 1))

(e:loaded)
(provide 'init-setup)
;;; init-setup.el ends here
