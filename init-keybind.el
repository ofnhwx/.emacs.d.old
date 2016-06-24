;;; init-keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-

;; Last updated: <2016/06/24 11:51:08>
;;

;;; Commentary:

;;; Code:

(use-package "bind-key"
  :ensure t
  :config
  (bind-keys :map ctl-x-map
             ("f" . find-file))
  (bind-keys :map mode-specific-map
             ("i" . imenu)
             ("t" . toggle-truncate-lines)
             ("z" . eshell))
  ;; for:`mac'
  (when (os-type-mac-p)
    (defun scroll-down-with-lines ()
      (interactive)
      (scroll-down 3))
    (defun scroll-up-with-lines ()
      (interactive)
      (scroll-up 3))
    (bind-keys ("<wheel-up>"          . scroll-down-with-lines)
               ("<wheel-down>"        . scroll-up-with-lines)
               ("<double-wheel-up>"   . scroll-down-with-lines)
               ("<double-wheel-down>" . scroll-up-with-lines)
               ("<triple-wheel-up>"   . scroll-down-with-lines)
               ("<triple-wheel-down>" . scroll-up-with-lines)))
  ;; for:`avy'
  (with-eval-after-load "avy"
    (bind-keys ("C-:" . avy-goto-char)
               ("C-;" . avy-goto-word-1)
               ("M-g M-g" . avy-goto-line))
    ;; for:`ace-window'
    (with-eval-after-load "ace-window"
      (bind-keys ("C-^" . ace-window)
                 :map ctl-x-map
                 ("o" . ace-window)))
    ;; for:`eww'
    (with-eval-after-load "ace-link"
      (bind-keys :map eww-mode-map
                 ("o" . ace-link-eww))))
  ;; for:`dired'
  (with-eval-after-load "dired"
    (with-eval-after-load "wdired"
      (bind-keys :map dired-mode-map
                 ("r" . wdired-change-to-wdired-mode))))
  ;; for:`expand-region'
  (with-eval-after-load "expand-region"
    (bind-keys ("C-M-SPC" . er/expand-region)))
  ;; for:`helm'
  (with-eval-after-load "helm"
    (bind-keys ("M-x" . helm-M-x)
               ("M-:" . helm-eval-expression-with-eldoc)
               ("C-h b" . helm-descbinds)
               :map ctl-x-map
               ("C-b" . helm-buffers-list)
               ("M-f" . helm-find-files))
    ;; for::`helm-ag'
    (with-eval-after-load "helm-ag"
      (bind-keys ("M-g ," . helm-ag-pop-stack)
                 ("M-g ." . helm-ag)
                 ("M-g /" . helm-ag-project-root)
                 ("M-g _" . helm-ag-this-file)))
    ;; for::`helm-projectile'
    (with-eval-after-load "helm-projectile"
      (defun helm-find-files-with-projectile (&optional arg)
        (interactive "P")
        (if (projectile-project-p)
            (helm-projectile-find-file arg)
          (helm-find-files arg)))
      (bind-keys :map ctl-x-map
                 ("C-f" . helm-find-files-with-projectile))))
  ;; for:`lacarte'
  (with-eval-after-load "lacarte"
    (bind-keys ("M-X" . lacarte-execute-command)))
  ;; for:`magit'
  (with-eval-after-load "magit"
    (bind-keys ("M-g s" . magit-status)))
  ;; for:`neotree'
  (with-eval-after-load "neotree"
    (bind-keys ("<f8>" . neotree-toggle)))
  ;; for:`php-mode'
  (with-eval-after-load "php-mode"
    ;; for:`ac-php'
    (with-eval-after-load "ac-php"
      (bind-keys :map php-mode-map
                 ("C-]" . ac-php-find-symbol-at-point)
                 ("C-}" . ac-php-location-stack-back))))
  ;; for:`skk'
  (with-eval-after-load "skk"
    (bind-keys ("C-\¥" . skk-mode)))
  ;; for:`web-mode'
  (with-eval-after-load "web-mode"
    ;; for:`ac-php'
    (with-eval-after-load "ac-php"
      (bind-keys :map web-mode-map
                 ("C-]" . ac-php-find-symbol-at-point)
                 ("C-}" . ac-php-location-stack-back))))
  ;; for:`whitespace'
  (with-eval-after-load "whitespace"
    (bind-keys :map mode-specific-map
               ("w" . whitespace-mode)))
  )

(use-package "smartrep"
  :ensure t
  :config
  ;;
  (smartrep-define-key
   global-map
   "M-g" '(("n" . 'next-error)
           ("p" . 'previous-error)
           ("N" . 'next-error)
           ("P" . 'previous-error)
           ))
  ;;
  (smartrep-define-key
   global-map
   "C-c" '(("n" . (lambda () (scroll-other-window  1)))
           ("p" . (lambda () (scroll-other-window -1)))
           ("N" . (lambda () (scroll-other-window)))
           ("P" . (lambda () (scroll-other-window '-)))
           ("~" . 'shrink-window)
           ("^" . 'enlarge-window)
           ("{" . 'shrink-window-horizontally)
           ("}" . 'enlarge-window-horizontally)
           ))
  ;;
  (use-package "multiple-cursors"
    :config
    (bind-key "C-t" nil)
    (smartrep-define-key
     global-map
     "C-t" '(("C-t" . 'mc/mark-next-like-this)
             ("n"   . 'mc/mark-next-like-this)
             ("p"   . 'mc/mark-previous-like-this)
             ("m"   . 'mc/mark-more-like-this-extended)
             ("u"   . 'mc/unmark-next-like-this)
             ("U"   . 'mc/unmark-previous-like-this)
             ("s"   . 'mc/skip-to-next-like-this)
             ("S"   . 'mc/skip-to-previous-like-this)
             ("*"   . 'mc/mark-all-like-this)
             ("d"   . 'mc/mark-all-like-this-dwim)
             ("i"   . 'mc/insert-numbers)
             ("o"   . 'mc/sort-regions)
             ("O"   . 'mc/reverse-regions)))))

(e:loaded)
(provide 'init-keybind)
;;; init-keybind.el ends here
