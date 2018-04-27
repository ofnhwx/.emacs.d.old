;;; 60_eshell.el --- configurations.
;;; Commentary:
;;; Code:

(use-package eshell
  :init
  (set-variable 'eshell-directory-name (e:expand "eshell" :cache))
  (set-variable 'eshell-history-size 100000)
  (set-variable 'eshell-cmpl-ignore-case t)
  (set-variable 'eshell-hist-ignoredups t)
  (set-variable 'eshell-ask-to-save-history (quote always))
  (set-variable 'eshell-cmpl-cycle-completions nil)
  (set-variable 'eshell-visual-commands
                '("elm" "less" "lynx" "rlogin" "more" "ncftp" "pine"
                  "screen" "ssh" "telnet" "tin" "top" "trn" "vi"))
  (set-variable 'eshell-escape-control-x nil)
  (set-variable 'eshell-prompt-function
                (lambda () (concat "[" (e:unexpand (eshell/pwd)) "]\n" (if (zerop (user-uid)) "# " "$ "))))
  (set-variable 'eshell-prompt-regexp "^[^#$]*[#$] ")
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
  :config
  (defun eshell/setup-keys ()
    (bind-keys
     :map eshell-mode-map
     ("C-i" . helm-esh-pcomplete)
     ("M-h" . helm-eshell-history)))
  (add-hook 'eshell-mode-hook 'eshell/setup-keys))

(provide '60_eshell)
;;; 60_eshell.el ends here
