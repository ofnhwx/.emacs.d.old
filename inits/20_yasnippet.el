;;; 20_yasnippet.el --- setup yasnippet.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:15:20>
;;

;;; Commentary:

;;; Code:

(use-package yasnippet
  :init
  (set-variable 'yas--default-user-snippets-dir (e:expand "snippets" :conf))
  (set-variable 'yas-snippet-dirs '(yas--default-user-snippets-dir yas-installed-snippets-dir))
  (set-variable 'yas-prompt-functions '(yas-ido-prompt))
  :config
  (yas-global-mode t))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
