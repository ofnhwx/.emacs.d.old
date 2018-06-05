;;; 20_helm.el --- configurations.
;;; Commentary:
;;; Code:

(use-package helm
  :ensure t
  :demand t
  :bind
  (:map file-command-map
        ("h" . helm-find-files)
        ("r" . helm-recentf))
  (:map global-map
        ([remap execute-extended-command] . helm-M-x)
        ("C-@" . helm-multi-files)
        ("M-:" . helm-eval-expression-with-eldoc)
        ("M-y" . helm-show-kill-ring))
  (:map ctl-x-map
        ("r h" . helm-register)
        ("C-b" . helm-multi-files))
  (:map mode-specific-map
        ("i" . helm-imenu))
  (:map help-map
        ("a" . helm-apropos)))

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
  :bind
  (:map general-command-map
        ("," . helm-ag-pop-stack)
        ("." . helm-ag)
        ("/" . helm-ag-project-root)
        ("_" . helm-ag-this-file))
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
  :defer t
  :bind
  (:map help-map
        ("b" . helm-descbinds)))

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
  :defer t
  :bind
  (:map file-command-map
        ("g" . helm-ghq)))

(use-package helm-projectile
  :after (projectile)
  :ensure t
  :defer t
  :bind
  (:map file-command-map
        ("p" . helm-find-files-with-projectile))
  (:map ctl-x-map
        ("C-f" . helm-find-files-with-projectile))
  :config
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile)
      (helm-find-files arg))))

(use-package helm-swoop
  :after (helm)
  :ensure t
  :defer t
  :bind
  (:map isearch-mode-map
        ("C-o" . helm-swoop-from-isearch)))

(provide '20_helm)
;;; 20_helm.el ends here
