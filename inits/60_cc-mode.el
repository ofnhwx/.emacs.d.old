;;; 40_cc-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package cc-mode
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

(provide '40_cc-mode)
;;; 40_cc-mode.el ends here
