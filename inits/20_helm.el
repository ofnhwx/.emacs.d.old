;;; 20_helm.el --- setup helm.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:26:53>
;;

;;; Commentary:

;;; Code:

(use-package helm
  :if (e:require-package 'helm)
  :init
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (custom-set-variables
   '(helm-display-function 'my/helm-display-buffer))
  :config
  (use-package helm-ag
    :if (e:require-package 'helm-ag)
    :init
    (cond
     ;; ripgrep
     ((executable-find "rg")
      (custom-set-variables
       '(helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep")))
     ;; The Platinum Searcher
     ((executable-find "pt")
      (custom-set-variables
       '(helm-ag-base-command "pt --nocolor --nogroup --smart-case")))))
  (use-package helm-c-yasnippet
    :if (e:require-package 'helm-c-yasnippet))
  (use-package helm-descbinds
    :if (e:require-package 'helm-descbinds))
  (use-package helm-flycheck
    :if (e:require-package 'helm-flycheck))
  (use-package helm-flx
    :if (e:require-package 'helm-flx)
    :config
    (helm-flx-mode 1))
  (use-package helm-mode-manager
    :if (e:require-package 'helm-mode-manager))
  (use-package helm-projectile
    :if (e:require-package 'helm-projectile))
  (use-package helm-swoop
    :if (e:require-package 'helm-swoop)))

(provide '20_helm)
;;; 20_helm.el ends here
