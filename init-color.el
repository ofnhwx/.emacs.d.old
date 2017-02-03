;;; init-color.el --- 色の設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/02/03 10:29:09>
;;

;;; Commentary:

;;; Code:

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
 '(whitespace-tab     ((t (:foreground "#ff0000" :background nil))))
 '(whitespace-space   ((t (:foreground "#ff0000" :background nil))))
 '(whitespace-newline ((t (:foreground "#228b22" :background nil)))))

(custom-set-faces
 ;; for:`anzu'
 '(anzu-mode-line ((t (:foreground "#000000" :background "#dd00dd")))))

(custom-set-faces
 ;; for:`company'
 '(company-tooltip                  ((t (:foreground "black" :background "lightgrey"))))
 '(company-tooltip-common           ((t (:foreground "black" :background "lightgrey"))))
 '(company-tooltip-common-selection ((t (:foreground "white" :background "steelblue"))))
 '(company-tooltip-selection        ((t (:foreground "black" :background "steelblue"))))
 '(company-preview-common           ((t (:foreground "lightgrey" :background nil :underline t))))
 '(company-scrollbar-fg             ((t (:background "orange"))))
 '(company-scrollbar-bg             ((t (:background "gray40")))))

(custom-set-faces
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
 '(diredp-no-priv                ((t (:foreground "#a0a0a0" :background nil)))))

(custom-set-faces
 ;; for:`elscreen'
 '(elscreen-tab-background-face     ((t (:background "#808080" :box (:color "#ffffff")))))
 '(elscreen-tab-control-face        ((t (:foreground "#ff0000" :background "#000000" :box (:color "#ffffff")))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#000000" :background "#ff0000" :box (:color "#ffffff")))))
 '(elscreen-tab-other-screen-face   ((t (:foreground "#ffffff" :background "#000000" :box (:color "#ffffff"))))))

(custom-set-faces
 ;; for:`helm'
 '(helm-action                  ((t (:foreground "#ffffff" :background nil))))
 '(helm-candidate-number        ((t (:foreground "#000000" :background "#ffff00"))))
 '(helm-header                  ((t (:foreground "#ffffff" :background "#000000"))))
 '(helm-header-line-left-margin ((t (:foreground "#000000" :background "#ffff00"))))
 '(helm-selection               ((t (:foreground "#000000" :background "#00ff00"))))
 '(helm-selection-line          ((t (:foreground "#000000" :background "#00ff00"))))
 '(helm-visible-mark            ((t (:foreground "#000000" :background "#ffff00"))))
 '(helm-separator               ((t (:foreground "#ff0000" :background nil))))
 '(helm-source-header           ((t (:foreground "#ffffff" :background "#0000ff" :height 1.2 :weight bold :box t))))
 '(helm-match                   ((t (:box t))))
 ;; for:`helm-buffers'
 '(helm-buffer-directory ((t (:foreground "#ffff00" :background nil))))
 '(helm-buffer-file      ((t (:foreground "#8080ff" :background nil))))
 '(helm-buffer-not-saved ((t (:foreground "#00ff00" :background nil))))
 '(helm-buffer-size      ((t (:foreground "#ff00ff" :background nil))))
 '(helm-buffer-process   ((t (:foreground "#ff0000" :background nil))))
 '(helm-buffer-saved-out ((t (:inherit helm-buffer-not-saved :underline (:style wave)))))
 ;; for:`helm-files'
 '(helm-ff-directory        ((t (:foreground "#ffff00" :background nil))))
 '(helm-ff-dirs             ((t (:foreground "#ffff00" :background nil))))
 '(helm-ff-dotted-directory ((t (:foreground "#808080" :background nil))))
 '(helm-ff-executable       ((t (:foreground "#ff0000" :background nil))))
 '(helm-ff-file             ((t (:foreground "#ffffff" :background nil))))
 '(helm-ff-prefix           ((t (:foreground "#000000" :background "#ffff00"))))
 '(helm-ff-symlink          ((t (:foreground "#00ffff" :background nil))))
 '(helm-history-deleted     ((t (:foreground "#808080" :background nil :strike-through t))))
 '(helm-history-remote      ((t (:foreground "#ff00ff" :background nil))))
 '(helm-ff-invalid-symlink  ((t (:inherit helm-ff-symlink :strike-through t))))
 '(helm-ff-dotted-symlink-directory ((t (:inherit helm-ff-dotted-directory :underline (:style wave))))))

(custom-set-faces
 ;; for:`powerline'
 '(powerline-active1   ((t (:foreground "#ffffff" :background "#b00000"))))
 '(powerline-active2   ((t (:foreground "#ffffff" :background "#800000"))))
 '(powerline-inactive1 ((t (:foreground "#ffffff" :background "#404040"))))
 '(powerline-inactive2 ((t (:foreground "#ffffff" :background "#808080")))))

(custom-set-faces
 ;; for:`sunrise'
 '(sr-active-path-face    ((t (:foreground "#000000" :background "#ff0000"))))
 '(sr-highlight-path-face ((t (:foreground "#000000" :background "#ff0000"))))
 '(sr-directory-face      ((t (:foreground "#ffff00" :background nil)))))

(e:loaded)
(provide 'init-color)
;;; init-color.el ends here
