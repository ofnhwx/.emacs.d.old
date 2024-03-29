;;; 20_yasnippet.el --- configurations.
;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :demand t
  :diminish yas-minor-mode
  :custom
  (yas--default-user-snippets-dir (e:expand "snippets" :conf))
  (yas-snippet-dirs '(yas--default-user-snippets-dir yas-installed-snippets-dir))
  (yas-prompt-functions '(yas-ido-prompt))
  :config
  (yas-global-mode t))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
