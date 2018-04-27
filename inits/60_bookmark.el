;;; 60_bookmark.el --- configurations.
;;; Commentary:
;;; Code:

(use-package bookmark
  :init
  (set-variable 'bookmark-default-file (e:expand "bookmark" :cache)))

(provide '60_bookmark)
;;; 60_bookmark.el ends here
