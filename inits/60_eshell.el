;;; 60_eshell.el --- configurations.
;;; Commentary:
;;; Code:

(use-package eshell
  :custom
  (eshell-directory-name (e:expand "eshell" :cache))
  (eshell-history-size 100000)
  (eshell-cmpl-ignore-case t)
  (eshell-hist-ignoredups t)
  (eshell-ask-to-save-history (quote always))
  (eshell-cmpl-cycle-completions nil)
  (eshell-visual-commands
   '("elm" "less" "lynx" "rlogin" "more" "ncftp" "pine"
     "screen" "ssh" "telnet" "tin" "top" "trn" "vi"))
  (eshell-escape-control-x nil)
  (eshell-prompt-function
   (lambda () (concat "[" (e:unexpand (eshell/pwd)) "]\n" (if (zerop (user-uid)) "# " "$ "))))
  (eshell-prompt-regexp "^[^#$]*[#$] ")
  :config
  ;; command - clear
  (defun eshell/clear ()
    "Clear the current buffer, leaving one prompt at the top."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))
  ;; command - less : written by Stefan Reichoer <reichoer@web.de>
  (defun eshell/less (&rest args)
    "Invoke `view-file' on the file.
  \"less +42 foo\" also goes to line 42 in the buffer."
    (while args
      (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
          (let* ((line (string-to-number (match-string 1 (pop args))))
                 (file (pop args)))
            (view-file file)
            (goto-line line))
        (view-file (pop args))))))

(use-package eshell
  :no-require t
  :after (helm)
  :hook (eshell-mode . eshell/setup-keys)
  :config
  (defun eshell/setup-keys ()
    (bind-keys
     :map eshell-mode-map
     ("C-i" . helm-esh-pcomplete)
     ("M-h" . helm-eshell-history))))

(provide '60_eshell)
;;; 60_eshell.el ends here
