;;; 30_google-translate.el --- configurations.
;;; Commentary:
;;; Code:

(use-package google-this
  :ensure
  :defer t)

(use-package google-translate
  :ensure t
  :defer t
  :config
  (defvar google-translate-english-chars "[:ascii:]’“”–"
    "これらの文字が含まれているときは英語とみなす")
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
          (cond ((stringp string)   string)
                (current-prefix-arg (read-string "Google Translate: "))
                ((use-region-p)     (buffer-substring (region-beginning) (region-end)))
                (t (save-excursion
                     (let (s)
                       (forward-char 1)
                       (backward-sentence)
                       (setq s (point))
                       (forward-sentence)
                       (buffer-substring s (point)))))))
    (let* ((asciip (string-match (format "\\`[%s]+\\'" google-translate-english-chars) string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate (if asciip "en" "ja") (if asciip "ja" "en") string))))

(provide '30_google-translate)
;;; 30_google-translate.el ends here
