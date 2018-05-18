;;; 40_php-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package php-mode
  :ensure t
  :defer t
  :bind
  (:map php-mode-map
        ("C-]" . ac-php-find-symbol-at-point)
        ("C-}" . ac-php-location-stack-back))
  :hook (php-mode . php-enable-symfony2-coding-style)
  :custom
  (php-mode-force-pear t)
  (php-manual-path (e:expand "php-chunked-xhtml" :cache))
  (php-search-url "http://www.php.net/")
  (php-manual-url "http://www.php.net/manual/ja"))

(provide '40_php-mode)
;;; 40_php-mode.el ends here
