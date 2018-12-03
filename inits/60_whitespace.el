;;; 60_whitespace.el --- configurations.
;;; Commentary:
;;; Code:

(use-package whitespace
  :demand t
  :diminish
  whitespace-mode
  :custom
  (whitespace-style
   '(face      ;; 'face'で色を付ける
     trailing  ;; 末尾の空白
     tabs      ;; TAB文字
     newline   ;; 改行文字
     spaces    ;; 空白文字
     space-mark
     tab-mark
     newline-mark))
  (whitespace-space-regexp "\\(\x3000+\\)")
  (whitespace-display-mappings
   '((space-mark   ?\u3000 [?\u25A1])
     (tab-mark     ?\t     [?\u00BB ?\t])
     (newline-mark ?\n     [?\u21B5 ?\n])))
  :hook (find-file . whitespace-mode))

(provide '60_whitespace)
;;; 60_whitespace.el ends here
