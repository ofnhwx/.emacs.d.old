;;; 40_twittering-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package twittering-mode
  :if (progn (quelpa 'twittering-mode)
             (locate-library "twittering-mode"))
  :custom
  (twittering-number-of-tweets-on-retrieval 50)
  (twittering-use-master-password t)
  :config
  ;; 機能追加
  (bind-keys
   :map twittering-mode-map
   ("I" . twit:toggle-show-icon))
  (defun twit:toggle-show-icon ()
    "`twittering-mode'の全バッファでアイコンの表示/非表示を切り替える."
    (interactive)
    (let ((enable (not twittering-icon-mode)))
      (cl-dolist (buffer (twittering-get-buffer-list))
        (with-current-buffer buffer
          (twittering-icon-mode enable)))))
  ;; アカウントの切り替え
  (defvar twit:accounts nil
    "アカウントのリスト.")
  (defvar twit:account-default nil
    "`twit:start'で使用するアカウント.")
  (defun twit:start ()
    "アカウントの設定を行い、`twittering-mode'を起動する."
    (interactive)
    (let* ((account (or twit:account-default (car twit:accounts)))
           (func (intern (format "twit:%s" account))))
      (funcall func)))
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
    (twit))
  (defmacro twit:define-user (user &optional body)
    "`twittering-mode'のアカウントを追加する."
    (declare (indent defun))
    (add-to-list 'twit:accounts user)
    `(progn
       (defvar,(intern (format "twit:profile-%s" user)) ,(e:expand (format "twit/%s.gpg" user) :local))
       (defun ,(intern (format "twit:%s" user)) ()
         (interactive)
         ,body
         (set-variable 'twittering-private-info-file ,(intern (format "twit:profile-%s" user)))
         (twit:new))))
  ;; 個別設定
  (e:load-local-config "twittering-mode"))

(provide '40_twittering-mode)
;;; 40_twittering-mode.el ends here
