;;; 40_cc-mode.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/24 16:54:56>
;;

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
      (if (zerop (length candidate))
          (print "not found.")
        (find-file (car candidate))))))

(provide '40_cc-mode)
;;; 40_cc-mode.el ends here
