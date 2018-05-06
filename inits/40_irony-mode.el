;;; 40_irony-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :diminish irony-mode
  :defer t
  :hook
  ((irony-mode-hook . irony-cdb-autosetup-compile-options)
   (c-mode-hook     . irony-mode)
   (c++-mode-hook   . irony-mode))
  :custom
  (irony-additional-clang-options '("-std=c++11"))
  (irony-user-dir (e:expand "irony" :cache))
  (irony-server-install-prefix irony-user-dir)
  :config
  (defun irony-add-include (path)
    (add-to-list 'irony-additional-clang-options (format "-I%s" path)))
  (e:load-local-config "irony"))

(provide '40_irony-mode)
;;; 40_irony-mode.el ends here
