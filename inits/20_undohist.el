;;; 20_undohist.el --- setup undohist.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:55:14>
;;

;;; Commentary:

;;; Code:

(use-package undohist
  :if (e:require-package 'undohist)
  :init
  (set-variable 'undohist-directory (e:expand "undohist" :local))
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
