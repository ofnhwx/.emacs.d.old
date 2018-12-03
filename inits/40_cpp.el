;;; 40_cpp.el --- configurations.
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :diminish irony-mode
  :defer t
  :hook
  ((irony-mode . irony-cdb-autosetup-compile-options)
   (c-mode     . irony:activate)
   (c++-mode   . irony:activate))
  :custom
  (irony-additional-clang-options '("-std=c++11"))
  (irony-user-dir (e:expand "irony" :cache))
  (irony-server-install-prefix irony-user-dir)
  :config
  (defun irony:activate ()
    (when (cl-member major-mode irony-supported-major-modes)
      (irony-mode 1)))
  (defun irony-add-include (path)
    (add-to-list 'irony-additional-clang-options (format "-I%s" path)))
  (e:load-local-config "irony"))

(use-package cc-mode
  :defer t
  :bind
  (:map c++-mode-map
        ("C-c /" . cc-switch-header/source))
  :config
  (defun cc-switch-header/source ()
    (interactive)
    (let* ((path (s-trim (shell-command-to-string "pwd")))
           (relative (s-trim (shell-command-to-string "git rev-parse --show-cdup")))
           (target (f-filename (buffer-file-name)))
           (candidate-str (s-trim (shell-command-to-string (format "git ls-files %s | grep -E '(^|/)%s\\.'" relative (file-name-sans-extension target)))))
           (candidate (--filter (not (string-equal target (f-filename it))) (--map (e:expand it path) (s-split "\n" candidate-str)))))
      (cond
       ((> (length candidate) 1)
        (helm :sources '((name . "Header <=> Source")
                         (candidates . candidate)
                         (action . find-file))))
       ((= (length candidate) 1)
        (find-file (car candidate)))
       (t
        (print "not found."))))))

(provide '40_cpp)
;;; 40_cpp.el ends here
