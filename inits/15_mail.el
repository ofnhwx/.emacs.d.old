;;; 15_mail.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package notmuch
  (executable-find "notmuch")
  :ensure t
  :defer t
  :custom
  (notmuch-archive-tags '("-inbox" "-unread"))
  (notmuch-column-control 1.0)
  (notmuch-hello-hide-tags '("encrypted" "drafts" "flagged" "inbox" "sent" "signed" "spam" "unread"))
  (notmuch-hello-thousands-separator ",")
  (notmuch-saved-searches '((:name "受信トレイ" :query "tag:inbox"   :key "i")
                            (:name "未読　　　" :query "tag:unread"  :key "u")
                            (:name "スター付き" :query "tag:flagged" :key "f")
                            (:name "送信済み　" :query "tag:sent"    :key "t")
                            (:name "下書き　　" :query "tag:draft"   :key "d")
                            (:name "すべて　　" :query "*"           :key "a")
                            (:name "迷惑メール" :query "tag:spam"    :key "s")))
  (notmuch-search-oldest-first nil)
  (notmuch-show-empty-saved-searches t)
  (notmuch-show-logo nil)
  :config
  (setenv "XAPIAN_CJK_NGRAM" "1"))

(e:use-package message
  (executable-find "msmtp")
  :defer t
  :custom
  (message-send-mail-function 'message-send-mail-with-sendmail)
  (sendmail-program (executable-find "msmtp"))
  (message-sendmail-extra-arguments '("--read-envelope-from"))
  (message-sendmail-f-is-evil t)
  (message-kill-buffer-on-exit t))

(provide '15_mail)
;;; 15_mail.el ends here
