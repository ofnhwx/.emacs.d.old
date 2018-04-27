;;; 30_tempbuf.el --- configurations.
;;; Commentary:
;;; Code:

(use-package tempbuf
  :preface (progn (quelpa '(tempbuf :fetcher wiki :files ("tempbuf.el")))
                  (locate-library "tempbuf"))
  :config
  (defmacro enable-tempbuf--hook (hook)
    `(add-hook ,hook 'turn-on-tempbuf-mode)))

(provide '30_tempbuf)
;;; 30_tempbuf.el ends here
