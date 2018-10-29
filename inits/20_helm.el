;;; 20_helm.el --- configurations.
;;; Commentary:
;;; Code:

(use-package helm
  :ensure t
  :demand t
  :bind
  (:map global-map
        ([remap execute-extended-command] . helm-M-x))
  :custom
  (helm-buffer-max-length nil))

(use-package helm
  :no-require t
  :after (windata)
  :config
  (defun my/helm-display-buffer (buffer &optional resume)
    (let ((helm-windata '(frame bottom 0.4 nil)))
      (apply 'windata-display-buffer buffer helm-windata)))
  (set-variable 'helm-display-function 'my/helm-display-buffer))

(e:use-package helm-ag
  (or (executable-find "rg")  ;; ripgrep
      (executable-find "pt")) ;; The Platinum Searcher
  :after (helm)
  :ensure t
  :defer t
  :init
  (cond
   ((executable-find "rg")
    (set-variable 'helm-ag-base-command "rg --color never --no-heading --smart-case --vimgrep"))
   ((executable-find "pt")
    (set-variable 'helm-ag-base-command "pt --nocolor --nogroup --smart-case")))
  :config
  (defun helm-ag--project-root ()
    (cl-loop for dir in '(".git" ".git/" ".hg/" ".svn/")
             when (locate-dominating-file default-directory dir)
             return it)))

(use-package helm-descbinds
  :ensure t
  :defer t)

(use-package helm-dired-history
  :after (dired)
  :ensure t)

(use-package helm-elscreen
  :after (elscreen)
  :ensure t
  :defer t
  :bind
  (:map elscreen-map
        ("C-z" . helm-elscreen)))

(use-package helm-flycheck
  :after (flycheck)
  :ensure t
  :defer t)

(e:use-package helm-ghq
  (executable-find "ghq")
  :ensure t
  :defer t)

(use-package helm-projectile
  :after (projectile)
  :ensure t
  :defer t
  :commands (helm-find-files-with-projectile)
  :config
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile)
      (helm-find-files arg))))

(use-package helm-swoop
  :after (helm)
  :ensure t
  :defer t)

(provide '20_helm)
;;; 20_helm.el ends here
