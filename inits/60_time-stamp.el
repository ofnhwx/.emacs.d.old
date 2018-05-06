;;; 60_time-stamp.el --- configurations.
;;; Commentary:
;;; Code:

(use-package time-stamp
  :hook (before-save-hook . time-stamp)
  :custom
  (time-stamp-active t)
  (time-stamp-start  (concat "Last " "updated: <"))
  (time-stamp-format "%04y/%02m/%02d %02H:%02M:%02S")
  (time-stamp-end    ">"))

(provide '60_time-stamp)
;;; 60_time-stamp.el ends here
