;;; 10_ddskk.el --- configurations.
;;; Commentary:
;;; Code:

(use-package skk
  :ensure ddskk
  :init
  (set-variable 'skk-user-directory (e:expand "ddskk" :conf))
  (set-variable 'default-input-method "japanese-skk")
  (set-variable 'skk-byte-compile-init-file t)
  (set-variable 'skk-egg-like-newline t)
  (set-variable 'skk-inline-show-face nil)
  (set-variable 'skk-isearch-start-mode 'latin)
  (set-variable 'skk-large-jisyo (e:expand "ddskk/SKK-JISYO.L" :conf))
  (set-variable 'skk-preload t)
  (set-variable 'skk-share-private-jisyo t)
  (set-variable 'skk-show-annotation t)
  (set-variable 'skk-show-inline 'vertical)
  (set-variable 'skk-sticky-key ";")
  (set-variable 'skk-tut-file (e:expand "ddskk/SKK.tut" :conf))
  (when (executable-find "google-ime-skk")
    (set-variable 'skk-server-prog (executable-find "google-ime-skk"))
    (set-variable 'skk-server-inhibit-startup-server t)
    (set-variable 'skk-server-host "localhost")
    (set-variable 'skk-server-portnum 55100)))

(use-package skk-study
  :after (skk))

(provide '10_ddskk)
;;; 10_ddskk.el ends here
