;;; init-setup.el --- 標準Lispでの設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-

;; Last updated: <2016/07/04 13:12:14>
;;

;;; Commentary:

;;; Code:

;; for:`abbrev'
(when (e:require 'abbrev t)
  (custom-set-variables
   '(abbrev-file-name (e:expand "abbrev.defs" :local))
   '(save-abbrevs t))
  (when (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file)))

;; for:`autoinsert'
(when (e:require 'autoinsert t)
  (custom-set-variables
   '(auto-insert-mode t)
   '(auto-insert-directory (e:expand "insert" :local))))

;; for:`bookmark'
(when (e:require 'bookmark t)
  (custom-set-variables
   '(bookmark-default-file (e:expand ".emacs.bmk" :local))))

;; for:`cua-mode'
(when (e:require 'cua-base t)
  (cua-mode t)
  (custom-set-variables
   '(cua-enable-cua-keys nil)))

;; for:`dired'
(when (e:require 'dired t)
  (e:require 'wdired t)
  (e:require 'dired-x t)
  (custom-set-variables
   ;; 'ls'に'--dired'をオプションとして渡す
   '(dired-use-ls-dired t)
   ;; ディレクトリを上に表示
   '(ls-lisp-dirs-first t)
   ;; 2つ開いてる場合にもう片方をデフォルトのターゲットに
   '(dired-dwim-target t)
   ;; ディレクトリを再帰的にコピーする
   '(dired-recursive-copies 'always)
   ;; diredバッファでC-sした時にファイル名だけにマッチするように
   '(dired-isearch-filenames t)
   ;; 'ls'に渡すオプション
   '(dired-listing-switches "ahl")))

;; for:`ediff'
(when (e:require 'ediff t)
  (custom-set-variables
   '(ediff-window-setup-function 'ediff-setup-windows-plain)
   '(ediff-split-window-function 'split-window-horizontally)))

;; for:`eldoc'
(when (e:require 'eldoc t)
  (custom-set-variables
   '(eldoc-idle-delay 0)
   '(eldoc-echo-area-use-multiline-p t))
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
  ;; 各種設定
  (custom-set-variables
   ;; eshellの基準ディレクトリを変更
   '(eshell-directory-name (e:expand "eshell" :local))
   ;; 履歴
   '(eshell-history-size 100000)
   ;; 補完時に大文字小文字を区別しない
   '(eshell-cmpl-ignore-case t)
   ;; 履歴で重複を無視する
   '(eshell-hist-ignoredups t)
   ;; 確認なしでヒストリ保存
   '(eshell-ask-to-save-history (quote always))
   ;; 補完時にサイクルしない
   '(eshell-cmpl-cycle-completions nil)
   ;;
   '(eshell-visual-commands
     '("elm" "less" "lynx" "rlogin" "more" "ncftp" "pine" "screen" "ssh" "telnet" "tin" "top" "trn" "vi"))
   ;;
   '(eshell-escape-control-x nil)
   ;; prompt 文字列の変更
   '(eshell-prompt-function
     (lambda () (concat "[" (e:unexpand (eshell/pwd)) "]\n" (if (zerop (user-uid)) "# " "$ "))))
   '(eshell-prompt-regexp "^[^#$]*[#$] ")))

;; for:`generic-x'
(when (e:require 'generic-x t)
  )

;; for:`recentf'
(when (e:require 'recentf t)
  (custom-set-variables
   '(recentf-save-file (e:expand ".recentf" :local))
   '(recentf-max-menu-items   20)
   '(recentf-max-saved-items 200)
   '(recentf-exclude
     `("^/[^/:]+:"
       "\\.howm$"
       "\\.org$"
       ,(rx bol (eval (e:get-dir :temp)))))
   '(recentf-filename-handlers
     '(abbreviate-file-name))
   '(recentf-mode t))
  (defadvice recentf-save-list (before recentf-save-list--convert-home activate)
    (let ((list nil))
      (dolist (file (mapcar 'abbreviate-file-name recentf-list))
        (or (member file list)
            (push file list)))
      (setq recentf-list (reverse list)))))

;; for:`eww'
(when (e:require 'eww t)
  (custom-set-variables
   '(eww-search-prefix "http://www.google.co.jp/search?q="))
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
  (custom-set-variables
   '(make-backup-files   t)  ;; バックアップを作成する
   '(backup-by-copying   t)  ;; コピーをバックアップする
   '(version-control     t)  ;; バックアップのバージョンを管理する
   '(delete-old-versions t)  ;; 古いバックアップを削除する
   '(kept-new-versions   3)  ;; 新しいバージョンの数
   '(kept-old-versions   3)) ;; 古いバージョンの数
  ;; for:`auto-save'
  (custom-set-variables
   '(auto-save-default t)
   '(auto-save-list-file-prefix (file-name-as-directory backup-directory))
   '(auto-save-file-name-transforms `((".*" ,backup-directory t)))))

;; for:`hideshow'
(when (e:require 'hideshow t)
  (add-hook 'lisp-interaction-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'lisp-mode-hook 'hs-minor-mode-hook)
  (add-hook 'css-mode-hook 'hs-minor-mode-hook)
  (add-hook 'php-mode-hook 'hs-minor-mode)
  (add-hook 'web-mode-hook 'hs-minor-mode))

;; for:`ido'
(when (e:require 'ido t)
  (custom-set-variables
   '(ido-everywhere t)
   '(ido-enable-flex-matching t)
   '(ido-mode 'both)
   '(ido-save-directory-list-file (e:expand ".ido.last" :local))))

;; for:`linum'
(when (e:require 'linum t)
  (custom-set-variables
   '(linum-format "%5d")
   '(global-linum-mode t))
  (defadvice linum-schedule (around linum-schedule--delay () activate)
    (run-with-idle-timer 0.2 nil #'linum-update-current))
  (defvar linum-ignore-mode-list nil
    "デフォルトで`linum-mode'を有効にしないモードのリスト")
  (defadvice linum-on (around linum-on--ignore activate)
    "`linum-ignore-mode-list'で指定されたモードでは`linum-mode'を有効にしない"
    (unless (member major-mode linum-ignore-mode-list)
      ad-do-it))
  ;; 行番号非表示にするモード
  (cl-pushnew 'eww-mode linum-ignore-mode-list)
  (cl-pushnew 'sr-mode  linum-ignore-mode-list))

;; for:`server'
(when (e:require 'server t)
  (custom-set-variables
   '(server-auth-dir (e:expand "server" :local)))
  (when window-system
    (add-hook 'after-init-hook 'server-start)))

;; for:`time-stamp'
(when (e:require 'time-stamp t)
  (add-hook 'before-save-hook 'time-stamp)
  (custom-set-variables
   '(time-stamp-active t)
   '(time-stamp-start  (concat "Last " "updated: <"))
   '(time-stamp-format "%04y/%02m/%02d %02H:%02M:%02S")
   '(time-stamp-end    ">")))

;; for:`uniquify'
(when (e:require 'uniquify t)
  (custom-set-variables
   '(uniquify-buffer-name-style 'post-forward-angle-brackets)))

;; for:`url-cookie'
(when (e:require 'url-cookie t)
  (custom-set-variables
   '(url-cookie-file (e:expand "cookies" :local))))

;; for:`whitespace'
(when (e:require 'whitespace t)
  (custom-set-variables
   '(whitespace-style
     '(face      ;; 'face'で色を付ける
       trailing  ;; 末尾の空白
       tabs      ;; TAB文字
       newline   ;; 改行文字
       spaces    ;; 空白文字
       space-mark
       tab-mark
       newline-mark
       ))
   '(whitespace-space-regexp "\\(\x3000+\\)")
   '(whitespace-display-mappings
     '((space-mark   ?\x3000 [?\□])
       (tab-mark     ?\t     [?\xBB ?\t])
       (newline-mark ?\x0A   [?\x24 ?\x0A]))))
  ;; すべてのバッファで有効にする
  (global-whitespace-mode))

(e:loaded)
(provide 'init-setup)
;;; init-setup.el ends here
