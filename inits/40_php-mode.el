;;; 40_php-mode.el --- setup php-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:13:07>
;;

;;; Commentary:

;;; Code:

(use-package php-mode
  :if (e:require-package 'php-mode)
  :commands (php-mode)
  :init
  ;; 各種設定
  (custom-set-variables
   '(php-mode-force-pear t)
   '(php-manual-path (e:expand "php-chunked-xhtml" :local))
   '(php-search-url "http://www.php.net/")
   '(php-manual-url "http://www.php.net/manual/ja"))
  :config
  ;; eldoc
  (use-package php-eldoc
    :if (e:require-package 'php-eldoc))
  ;; symfonyのスタイルを有効に
  (add-hook 'php-mode-hook
            'php-enable-symfony2-coding-style))

(provide '40_php-mode)
;;; 40_php-mode.el ends here
