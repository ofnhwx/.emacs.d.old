;;; 40_twittering-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package twittering-mode
  :if (progn (quelpa 'twittering-mode)
             (locate-library "twittering-mode"))
  :defer t
  :custom
  (twittering-number-of-tweets-on-retrieval 50)
  (twittering-use-master-password t)
  (twittering-use-native-retweet t)
  :init
  (defvar twit:accounts nil
    "アカウントのリスト.")
  (defvar twit:account-default nil
    "`twit:start'で使用するアカウント.")
  (defvar twit:default-initial-timelines
    '(":direct_messages" ":mentions" ":favorites" ":home")
    "起動時に標準で表示するカラム.")
  (defmacro twit:define-user (user &optional default additional-timelines)
    "`twittering-mode'のアカウントを追加する."
    (declare (indent defun))
    `(progn
       (defvar ,(intern (format "twit:profile-%s" user))
         ,(e:expand (format "twit/%s.gpg" user) :local))
       (defvar ,(intern (format "twit:timelines-%s" user))
         ',(cl-concatenate 'list twit:default-initial-timelines additional-timelines))
       (defun ,(intern (format "twit:%s" user)) ()
         (interactive)
         (set-variable 'twittering-private-info-file
                       ,(intern (format "twit:profile-%s" user)))
         (set-variable 'twittering-initial-timeline-spec-string
                       ,(intern (format "twit:timelines-%s" user)))
         (twit:new))
       (add-to-list 'twit:accounts ',user)
       (when ,default
         (setq twit:account-default ',user)
         (set-variable 'twittering-private-info-file
                       ,(intern (format "twit:profile-%s" user)))
         (set-variable 'twittering-initial-timeline-spec-string
                       ,(intern (format "twit:timelines-%s" user))))))
  (e:load-local-config "twittering-mode")
  :config
  (bind-keys
   :map twittering-mode-map
   ("I" . twit:toggle-show-icon)
   ("C-c C-f" . twittering-favorite))
  (defun twit:toggle-show-icon ()
    "`twittering-mode'の全バッファでアイコンの表示/非表示を切り替える."
    (interactive)
    (let ((enable (not twittering-icon-mode)))
      (cl-dolist (buffer (twittering-get-buffer-list))
        (with-current-buffer buffer
          (twittering-icon-mode enable)))))
  (defun twit:new ()
    "`twittering-private-info-file'で指定されたアカウントで`twittering-mode'を起動する."
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
    (twit)))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
