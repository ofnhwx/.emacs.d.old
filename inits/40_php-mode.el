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
  :init
  (set-variable 'php-mode-force-pear t)
  (set-variable 'php-manual-path (e:expand "php-chunked-xhtml" :cache))
  (set-variable 'php-search-url "http://www.php.net/")
  (set-variable 'php-manual-url "http://www.php.net/manual/ja")
  (add-hook 'php-mode-hook 'php-enable-symfony2-coding-style))

(provide '40_php-mode)
;;; 40_php-mode.el ends here
