;;; 20_helm.el --- setup helm.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/14 12:35:12>
;;

;;; Commentary:

;;; Code:

(use-package helm
  :if (e:require-package 'helm)
  :init
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (set-variable 'helm-display-function 'my/helm-display-buffer)
  :config
  (use-package helm-ag
    :if (e:require-package 'helm-ag)
    :init
    (cond
     ;; ripgrep
     ((executable-find "rg")
      (set-variable 'helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep"))
     ;; The Platinum Searcher
     ((executable-find "pt")
      (set-variable 'helm-ag-base-command "pt --nocolor --nogroup --smart-case")))
    :config
    (defun helm-ag--project-root ()
      (cl-loop for dir in '(".git" ".git/" ".hg/" ".svn/")
               when (locate-dominating-file default-directory dir)
               return it)))
  (use-package helm-c-yasnippet
    :if (e:require-package 'helm-c-yasnippet))
  (use-package helm-descbinds
    :if (e:require-package 'helm-descbinds))
  (use-package helm-elscreen
    :if (e:require-package 'helm-elscreen))
  (use-package helm-flycheck
    :if (e:require-package 'helm-flycheck))
  (use-package helm-flx
    :if (e:require-package 'helm-flx)
    :config
    (helm-flx-mode 1))
  (use-package helm-ghq
    :if (and (executable-find "ghq")
             (e:require-package 'helm-ghq nil t)))
  (use-package helm-mode-manager
    :if (e:require-package 'helm-mode-manager))
  (use-package helm-projectile
    :if (e:require-package 'helm-projectile))
  (use-package helm-swoop
    :if (e:require-package 'helm-swoop)))

(provide '20_helm)
;;; 20_helm.el ends here
