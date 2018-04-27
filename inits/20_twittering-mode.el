;;; 40_twittering-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package twittering-mode
  :preface (progn (quelpa 'twittering-mode)
                  (locate-library "twittering-mode"))
  :init
  (set-variable 'twittering-number-of-tweets-on-retrieval 50)
  (set-variable 'twittering-use-master-password t)
  :config
  (bind-keys
   :map twittering-mode-map
   ("I" . twit:toggle-show-icon))
  (defun twit:toggle-show-icon ()
    (interactive)
    (let ((enable (not twittering-icon-mode)))
      (cl-dolist (buffer (twittering-get-buffer-list))
        (with-current-buffer buffer
          (twittering-icon-mode enable)))))
  (defun twit:new ()
    (cl-mapcar
     (lambda (buffer)
       (twittering-deactivate-buffer buffer)
       (kill-buffer buffer))
     (twittering-get-buffer-list))
    (twittering-unregister-killed-buffer)
    (setq twittering-private-info-file-loaded nil)
    (setq twittering-account-authorization nil)
    (setq twittering-oauth-access-token-alist nil)
    (setq twittering-buffer-info-list nil)
    (setq twittering-timeline-data-table (make-hash-table :test 'equal))
    (twit))
  (defmacro twit:define-user (user &optional body)
    (declare (indent defun))
    `(progn
       (defvar,(intern (format "twit:profile-%s" user)) ,(e:expand (format "twit/%s.gpg" user) :local))
       (defun ,(intern (format "twit:%s" user)) ()
         (interactive)
         ,body
         (set-variable 'twittering-private-info-file ,(intern (format "twit:profile-%s" user)))
         (twit:new))))
  (e:load-local-config "twittering-mode"))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
