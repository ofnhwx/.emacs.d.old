;;; 15_mail.el --- configurations.
;;; Commentary:
;;; Code:

(use-package notmuch
  :preface (executable-find "notmuch")
  :ensure t
  :init
  (set-variable 'notmuch-archive-tags '("-inbox" "-unread"))
  (set-variable 'notmuch-column-control 1.0)
  (set-variable 'notmuch-hello-hide-tags
                '("encrypted" "drafts" "flagged" "inbox" "sent" "signed" "spam" "unread"))
  (set-variable 'notmuch-hello-thousands-separator ",")
  (set-variable 'notmuch-saved-searches
                '((:name "受信トレイ" :query "tag:inbox"   :key "i")
                  (:name "未読　　　" :query "tag:unread"  :key "u")
                  (:name "スター付き" :query "tag:flagged" :key "f")
                  (:name "送信済み　" :query "tag:sent"    :key "t")
                  (:name "下書き　　" :query "tag:draft"   :key "d")
                  (:name "すべて　　" :query "*"           :key "a")
                  (:name "迷惑メール" :query "tag:spam"    :key "s")))
  (set-variable 'notmuch-search-oldest-first nil)
  (set-variable 'notmuch-show-empty-saved-searches t)
  (set-variable 'notmuch-show-logo nil)
  :config
  (setenv "XAPIAN_CJK_NGRAM" "1"))

(use-package message
  :preface (executable-find "msmtp")
  :init
  (set-variable 'message-send-mail-function 'message-send-mail-with-sendmail)
  (set-variable 'sendmail-program (executable-find "msmtp"))
  (set-variable 'message-sendmail-extra-arguments '("--read-envelope-from"))
  (set-variable 'message-sendmail-f-is-evil t)
  (set-variable 'message-kill-buffer-on-exit t))

(provide '15_mail)
;;; 15_mail.el ends here
