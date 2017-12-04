;;; 20_undohist.el --- setup undohist.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package undohist
  :if (e:require-package 'undohist nil t)
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
