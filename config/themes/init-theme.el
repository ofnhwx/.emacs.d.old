;;; init-theme.el --- 色の設定.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/15 18:38:44>
;;

;;; Commentary:

;;; Code:

(deftheme init)

(custom-theme-set-faces
 'init
 ;; 文字・背景, カーソル, 選択範囲
 '(default ((t (:background "#000000" :foreground "#ffffff"))))
 '(cursor  ((t (:background "#ffff00"))))
 '(region  ((t (:background "#000080"))))
 ;; モードライン
 '(mode-line           ((t (:background "#f00000" :box (:line-width 1 :color "#ffffff")))))
 '(mode-line-inactive  ((t (:background "#000000" :box (:line-width 1 :color "#ffffff")))))
 ;; 関数, 変数, 文字列
 '(font-lock-function-name-face   ((t (:foreground "#4169e1"))))
 '(font-lock-variable-name-face   ((t (:foreground "#00ffff"))))
 ;; 型, ビルトイン, 定数
 '(font-lock-type-face     ((t (:foreground "#ffa500"))))
 '(font-lock-builtin-face  ((t (:foreground "#8470ff"))))
 '(font-lock-constant-face ((t (:foreground "#ffc0cb"))))
 ;; 文字列, コメント, キーワード
 '(font-lock-string-face  ((t (:foreground "#ffff00"))))
 '(font-lock-comment-face ((t (:foreground "#228b22"))))
 '(font-lock-keyword-face ((t (:foreground "#4169e1"))))
 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#ff0000"))))
 '(paren-face            ((t (:foreground "#ffffff"))))
 ;; 現在行のハイライト:`linum'
 '(hl-line ((t (:underline "#80ff80"))))
 ;; 空白文字の表示:`whitespace'
 '(whitespace-tab      ((t (:foreground "#404040"))))
 '(whitespace-space    ((t (:foreground "#404040"))))
 '(whitespace-trailing ((t (:foreground "#404040" :background "#800000"))))
 '(whitespace-newline  ((t (:foreground "#228b22"))))
 ;; 終了
 )

(with-eval-after-load "anzu"
  (custom-theme-set-faces
   'init
   '(anzu-mode-line ((t (:background "#dd00dd" :foreground "#000000"))))
   ))

(with-eval-after-load "company"
  (custom-theme-set-faces
   'init
   '(company-tooltip                  ((t (:background "#d3d3d3" :foreground "#000000"))))
   '(company-tooltip-selection        ((t (:background "#4682b4" :foreground "#ffffff"))))
   '(company-preview-common           ((t (:foreground "#80ff80" :underline t))))
   '(company-scrollbar-fg             ((t (:background "#ff9200"))))
   '(company-scrollbar-bg             ((t (:background "#666666"))))
   ))

(with-eval-after-load "dired"
  (custom-theme-set-faces
   'init
   '(diredp-dir-heading            ((t (:foreground "#ff4040"))))
   '(diredp-dir-priv               ((t (:foreground "#ffff80"))))
   '(diredp-dir-name               ((t (:foreground "#ffff80"))))
   '(diredp-file-name              ((t (:foreground "#ffffff"))))
   '(diredp-file-suffix            ((t (:foreground "#cccccc"))))
   '(diredp-compressed-file-name   ((t (:foreground "#ff80ff"))))
   '(diredp-compressed-file-suffix ((t (:foreground "#cc80cc"))))
   '(diredp-ignored-file-name      ((t (:foreground "#a0a0a0"))))
   '(diredp-link-priv              ((t (:foreground "#80ffff"))))
   '(diredp-symlink                ((t (:foreground "#80ffff"))))
   '(diredp-number                 ((t (:foreground "#ffff80"))))
   '(diredp-date-time              ((t (:foreground "#8080ff"))))
   '(diredp-deletion               ((t (:foreground "#000000" :background "#ff0000"))))
   '(diredp-deletion-file-name     ((t (:background "#800000"))))
   '(diredp-flag-mark              ((t (:foreground "#000000" :background "#00ff00"))))
   '(diredp-flag-mark-line         ((t (:background "#008000"))))
   '(diredp-rare-priv              ((t (:foreground "#000000" :background "#ff8080"))))
   '(diredp-read-priv              ((t (:foreground "#ffcccc"))))
   '(diredp-write-priv             ((t (:foreground "#ccffcc"))))
   '(diredp-exec-priv              ((t (:foreground "#ccccff"))))
   '(diredp-other-priv             ((t (:foreground "#a0a0a0"))))
   '(diredp-no-priv                ((t (:foreground "#a0a0a0"))))
  ))

(with-eval-after-load "skk"
  (custom-theme-set-faces
   'init
   '(skk-emacs-hiragana-face       ((t (:foreground "#000000" :background "pink"))))
   '(skk-emacs-katakana-face       ((t (:foreground "#000000" :background "green"))))
   '(skk-emacs-jisx0201-face       ((t (:foreground "#000000" :background "thistle"))))
   '(skk-emacs-jisx0208-latin-face ((t (:foreground "#000000" :background "gold"))))
   '(skk-emacs-abbrev-face         ((t (:foreground "#000000" :background "royalblue"))))
   ))

(with-eval-after-load "elscreen"
  (custom-theme-set-faces
   'init
   '(elscreen-tab-background-face     ((t (:background "#808080" :box (:color "#ffffff")))))
   '(elscreen-tab-control-face        ((t (:background "#000000" :foreground "#ff0000" :box (:color "#ffffff")))))
   '(elscreen-tab-current-screen-face ((t (:background "#ff0000" :foreground "#000000" :box (:color "#ffffff")))))
   '(elscreen-tab-other-screen-face   ((t (:background "#000000" :foreground "#ffffff" :box (:color "#ffffff")))))
   ))

(with-eval-after-load "helm"
  (custom-theme-set-faces
   'init
   '(helm-action                  ((t (:foreground "#ffffff"))))
   '(helm-candidate-number        ((t (:foreground "#000000" :background "#ffff80"))))
   '(helm-header                  ((t (:foreground "#ffffff" :background "#000000"))))
   '(helm-header-line-left-margin ((t (:foreground "#000000" :background "#ffff80"))))
   '(helm-selection               ((t (:foreground "#000000" :background "#80ff80"))))
   '(helm-selection-line          ((t (:foreground "#000000" :background "#80ff80"))))
   '(helm-visible-mark            ((t (:foreground "#000000" :background "#ffff80"))))
   '(helm-separator               ((t (:foreground "#ff8080"))))
   '(helm-source-header           ((t (:foreground "#ffffff" :background "#8080ff" :height 1.2 :weight bold :box t))))
   '(helm-match                   ((t (:box t))))
   ;; for:`helm-buffers'
   '(helm-buffer-directory ((t (:foreground "#ffff80"))))
   '(helm-buffer-file      ((t (:foreground "#8080ff"))))
   '(helm-buffer-not-saved ((t (:foreground "#80ff80"))))
   '(helm-buffer-size      ((t (:foreground "#ff80ff"))))
   '(helm-buffer-process   ((t (:foreground "#ff8080"))))
   '(helm-buffer-saved-out ((t (:inherit helm-buffer-not-saved :underline (:style wave)))))
   ;; for:`helm-files'
   '(helm-ff-directory        ((t (:foreground "#ffff80"))))
   '(helm-ff-dirs             ((t (:foreground "#ffff80"))))
   '(helm-ff-dotted-directory ((t (:foreground "#808080"))))
   '(helm-ff-executable       ((t (:foreground "#ff0000"))))
   '(helm-ff-file             ((t (:foreground "#ffffff"))))
   '(helm-ff-prefix           ((t (:foreground "#000000" :background "#ffff80"))))
   '(helm-ff-symlink          ((t (:foreground "#80ffff"))))
   '(helm-history-deleted     ((t (:foreground "#808080" :strike-through t))))
   '(helm-history-remote      ((t (:foreground "#ff80ff"))))
   '(helm-ff-invalid-symlink  ((t (:inherit helm-ff-symlink :strike-through t))))
   '(helm-ff-dotted-symlink-directory ((t (:inherit helm-ff-dotted-directory :underline (:style wave)))))
   ))

(with-eval-after-load "powerline"
  (custom-theme-set-faces
   'init
   '(powerline-active1   ((t (:background "#b00000"))))
   '(powerline-active2   ((t (:background "#800000"))))
   '(powerline-inactive1 ((t (:background "#404040"))))
   '(powerline-inactive2 ((t (:background "#808080"))))
   ))

(provide-theme 'init)

(e:loaded)
(provide 'init-theme)
;;; init-theme.el ends here
