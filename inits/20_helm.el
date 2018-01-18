;;; 20_helm.el --- setup helm.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/17 16:21:34>
;;

;;; Commentary:

;;; Code:

(use-package helm
  :if (e:require-package 'helm nil t)
  :bind
  (:map global-map
        ([remap execute-extended-command] . helm-M-x))
  :init
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (set-variable 'helm-display-function 'my/helm-display-buffer))

(use-package helm-ag
  :if (e:require-package 'helm-ag nil t)
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
  :if (e:require-package 'helm-c-yasnippet nil t))

(use-package helm-descbinds
  :if (e:require-package 'helm-descbinds nil t))

(use-package helm-dired-history
  :if (e:require-package 'helm-dired-history nil t)
  :config
  (eval-after-load "ido"
    (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil)))

(use-package helm-elscreen
  :if (e:require-package 'helm-elscreen nil t)
  :bind
  (:map elscreen-map
        ("C-z" . helm-elscreen)))

(use-package helm-flycheck
  :if (e:require-package 'helm-flycheck nil t))

(use-package helm-ghq
  :if (and (executable-find "ghq")
           (e:require-package 'helm-ghq nil t)))

(use-package helm-mode-manager
  :if (e:require-package 'helm-mode-manager nil t))

(use-package helm-projectile
  :if (e:require-package 'helm-projectile nil t))

(use-package helm-swoop
  :if (e:require-package 'helm-swoop nil t))

(provide '20_helm)
;;; 20_helm.el ends here
