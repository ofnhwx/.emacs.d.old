;;; 20_yasnippet.el --- configurations.
;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (set-variable 'yas--default-user-snippets-dir (e:expand "snippets" :conf))
  (set-variable 'yas-snippet-dirs '(yas--default-user-snippets-dir yas-installed-snippets-dir))
  (set-variable 'yas-prompt-functions '(yas-ido-prompt))
  :config
  (yas-global-mode t))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
