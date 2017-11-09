;;; 30_tempbuf.el --- setup tempbuf.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:31:00>
;;

;;; Commentary:

;;; Code:

(use-package tempbuf
  :config
  (defmacro enable-tempbuf--hook (hook)
    `(add-hook ,hook 'turn-on-tempbuf-mode)))

(provide '30_tempbuf)
;;; 30_tempbuf.el ends here
