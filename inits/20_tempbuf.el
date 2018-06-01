;;; 20_tempbuf.el --- configurations.
;;; Commentary:
;;; Code:

(use-package tempbuf
  :if (progn (quelpa '(tempbuf :fetcher wiki :files ("tempbuf.el")))
             (locate-library "tempbuf"))
  :demand t
  :config
  (defmacro enable-tempbuf--hook (hook)
    `(add-hook ,hook 'turn-on-tempbuf-mode)))

(provide '20_tempbuf)
;;; 20_tempbuf.el ends here
