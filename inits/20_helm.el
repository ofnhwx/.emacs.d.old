;;; 20_helm.el --- setup helm.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:10:41>
;;

;;; Commentary:

;;; Code:

(use-package helm
  :bind
  (:map global-map
        ([remap execute-extended-command] . helm-M-x))
  :init
  (defun my/helm-display-buffer (buffer)
    (let ((helm-windata '(frame bottom 0.3 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (set-variable 'helm-display-function 'my/helm-display-buffer))

(use-package helm
  :after (projectile)
  :config
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile-find-file arg)
      (helm-find-files arg))))

(use-package helm-ag
  :after (helm)
  :init
  (cond
   ((executable-find "rg") ;; ripgrep
    (set-variable 'helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep"))
   ((executable-find "pt") ;; The Platinum Searcher
    (set-variable 'helm-ag-base-command "pt --nocolor --nogroup --smart-case")))
  :config
  (defun helm-ag--project-root ()
    (cl-loop for dir in '(".git" ".git/" ".hg/" ".svn/")
             when (locate-dominating-file default-directory dir)
             return it)))

(use-package helm-c-yasnippet
  :after (helm))

(use-package helm-descbinds
  :after (helm))

(use-package helm-dired-history
  :after (helm))

(use-package helm-dired-history
  :after (helm ido)
  :config
  (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil))

(use-package helm-elscreen
  :after (helm elscreen)
  :bind
  (:map elscreen-map
        ("C-z" . helm-elscreen)))

(use-package helm-flycheck
  :after (helm flycheck))

(use-package helm-ghq
  :after (helm))

(use-package helm-mode-manager
  :after (helm))

(use-package helm-projectile
  :after (helm projectile))

(use-package helm-swoop
  :after (helm))

(provide '20_helm)
;;; 20_helm.el ends here
