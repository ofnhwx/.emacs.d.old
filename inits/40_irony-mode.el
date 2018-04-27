;;; 40_irony-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :diminish irony-mode
  :commands (irony-mode)
  :init
  (set-variable 'irony-additional-clang-options '("-std=c++11"))
  (set-variable 'irony-user-dir (e:expand "irony" :cache))
  (set-variable 'irony-server-install-prefix irony-user-dir)
  :config
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (defun irony-add-include (path)
    (add-to-list 'irony-additional-clang-options (format "-I%s" path)))
  (e:load-local-config "irony"))

(provide '40_irony-mode)
;;; 40_irony-mode.el ends here
