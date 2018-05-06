;;; 20_migemo.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package migemo
  (executable-find "cmigemo")
  :ensure t
  :custom
  (migemo-command (executable-find "cmigemo"))
  (migemo-options '("-q" "--emacs"))
  (migemo-user-dictionary nil)
  (migemo-regex-dictionary nil)
  (migemo-coding-system 'utf-8-unix)
  :init
  (cond
   ((os-type-mac-p)
    (set-variable 'migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")))
  :config
  (migemo-init))

(provide '20_migemo)
;;; 20_migemo.el ends here
