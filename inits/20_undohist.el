;;; 20_undohist.el --- setup undohist.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/17 16:31:17>
;;

;;; Commentary:

;;; Code:

(use-package undohist
  :if (e:require-package 'undohist nil t)
  :init
  (set-variable 'undohist-directory (e:expand "undohist" :cache))
  (set-variable 'undohist-ignored-files '(".authinfo.gpg"))
  :config
  ;; 無効リストに登録されているファイルのUndo履歴を保存させない
  (defun undohist-save-1--with-ignored ()
    (let ((file (make-undohist-file-name (buffer-file-name))))
      (undohist-recover-file-p file)))
  (advice-add 'undohist-save-1 :before-while 'undohist-save-1--with-ignored)
  ;; 初期化
  (undohist-initialize))

(provide '20_undohist)
;;; 20_undohist.el ends here
