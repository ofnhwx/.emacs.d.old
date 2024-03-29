;;; 60_eww.el --- configurations.
;;; Commentary:
;;; Code:

(use-package eww
  :bind
  (:map eww-mode-map
        ("[" . eww-enable-images)
        ("]" . eww-disable-images))
  :custom
  (eww-search-prefix "http://www.google.co.jp/search?q=")
  :config
  ;; 画像表示の切り替え
  (defun eww-disable-images ()
    "ewwで画像表示させない"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image-alt)
    (eww-reload))
  (defun eww-enable-images ()
    "ewwで画像表示させる"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image)
    (eww-reload))
  (defun shr-put-image-alt (spec alt &optional flags)
    (insert alt))
  ;; 色設定 [ http://rubikitch.com/2014/11/19/eww-nocolor/ ]
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "ewwで文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "ewwで文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload)))

(provide '60_eww)
;;; 60_eww.el ends here
