;;; 40_irony-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :diminish irony-mode
  :defer t
  :init
  (set-variable 'irony-additional-clang-options '("-std=c++11"))
  (let ((dir (e:expand "irony" :cache)))
    (set-variable 'irony-user-dir dir)
    (set-variable 'irony-server-install-prefix dir))
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  :config
  (defun irony-add-include (path)
    (add-to-list 'irony-additional-clang-options (format "-I%s" path)))
  (e:load-local-config "irony"))

(provide '40_irony-mode)
;;; 40_irony-mode.el ends here
