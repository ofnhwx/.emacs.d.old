;;; 20_helm.el --- setup helm.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:38:25>
;;

;;; Commentary:

;;; Code:

(use-package helm
  :ensure t
  :config
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (custom-set-variables
   '(helm-display-function 'my/helm-display-buffer))
  (use-package helm-c-yasnippet  :ensure t)
  (use-package helm-descbinds    :ensure t)
  (use-package helm-flycheck     :ensure t)
  (use-package helm-mode-manager :ensure t)
  (use-package helm-projectile   :ensure t)
  (use-package helm-swoop        :ensure t)
  (use-package helm-ag
    :ensure t
    :config
    (cond
     ;; ripgrep
     ((executable-find "rg")
      (custom-set-variables
       '(helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep")))
     ;; The Platinum Searcher
     ((executable-find "pt")
      (custom-set-variables
       '(helm-ag-base-command "pt --nocolor --nogroup --smart-case")))))
  (use-package helm-flx
    :ensure t
    :config
    (helm-flx-mode 1)))

(provide '20_helm)
;;; 20_helm.el ends here
