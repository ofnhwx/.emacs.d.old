;;; 30_navi2ch.el --- configurations.
;;; Commentary:
;;; Code:

(use-package navi2ch
  :if (e:ghq-add-load-path "navi2ch")
  :defer t
  :commands (navi2ch))

(use-package navi2ch
  :no-require t
  :after (evil)
  :hook (navi2ch-article-mode . evil-emacs-state)
  :custom
  (navi2ch-net-http-proxy "127.0.0.1:9080")
  :config
  (evil-set-emacs-state 'navi2ch-article-mode)
  (evil-set-emacs-state 'navi2ch-articles-mode)
  (evil-set-emacs-state 'navi2ch-board-mode)
  (evil-set-emacs-state 'navi2ch-bookmark-mode)
  (evil-set-emacs-state 'navi2ch-directory-mode)
  (evil-set-emacs-state 'navi2ch-history-mode)
  (evil-set-emacs-state 'navi2ch-list-mode)
  (evil-set-emacs-state 'navi2ch-message-mode)
  (evil-set-emacs-state 'navi2ch-popup-article-mode)
  (evil-set-emacs-state 'navi2ch-search-mode))

(provide '30_navi2ch)
;;; 30_navi2ch.el ends here
