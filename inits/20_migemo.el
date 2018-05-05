;;; 20_migemo.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package migemo
  (executable-find "cmigemo")
  :ensure t
  :init
  (set-variable 'migemo-options '("-q" "--emacs"))
  (set-variable 'migemo-user-dictionary nil)
  (set-variable 'migemo-regex-dictionary nil)
  (set-variable 'migemo-coding-system 'utf-8-unix)
  (when (os-type-mac-p)
    (set-variable 'migemo-command (executable-find "cmigemo"))
    (set-variable 'migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
  :config
  (migemo-init))

(provide '20_migemo)
;;; 20_migemo.el ends here
