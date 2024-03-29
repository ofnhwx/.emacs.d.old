;;; 20_undohist.el --- configurations.
;;; Commentary:
;;; Code:

(use-package undohist
  :ensure t
  :demand t
  :config
  (setq undohist-directory (e:expand "undohist" :cache))
  (setq undohist-ignored-files '("\\.gpg$" "!COMMIT_EDITMSG$"))
  (defun undohist-save-1--with-ignored ()
    (let ((file (make-undohist-file-name (buffer-file-name))))
      (undohist-recover-file-p file)))
  (advice-add 'undohist-save-1 :before-while 'undohist-save-1--with-ignored)
  (undohist-initialize))

(provide '20_undohist)
;;; 20_undohist.el ends here
