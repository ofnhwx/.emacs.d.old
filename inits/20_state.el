;;; 20_state.el --- configurations.
;;; Commentary:
;;; Code:

(use-package state
  :ensure t
  :demand t
  :diminish state-mode
  :config
  (state-define-state junk
    :key "j"
    :in (and (buffer-file-name)
             (string-equal (file-name-directory (buffer-file-name)) (e:expand "junk/" :cache)))
    :switch open-junk-file)
  (state-define-state messages
    :key "m"
    :switch "*Messages*")
  (state-define-state notmuch
    :key "n"
    :in (and (require 'notmuch nil t)
             (notmuch-interesting-buffer (current-buffer)))
    :switch notmuch)
  (state-define-state scratch
    :key "s"
    :switch "*scratch*")
  (state-define-state twit
    :key "t"
    :exist (and (require 'twittering-mode nil t)
                (--filter (twittering-buffer-p it) (buffer-list)))
    :in (and (require 'twittering-mode nil t)
             (twittering-buffer-p))
    :switch twit
    :create twit:start)
  (state-define-state eshell
    :key "z"
    :in (eq major-mode 'eshell-mode)
    :switch eshell)
  (defun state--switch-back-before-to (to from key)
    (ignore-errors (state--switch-back from)))
  (advice-add 'state--switch-to :before 'state--switch-back-before-to)
  (state-global-mode))

(provide '20_state)
;;; 20_state.el ends here
