;;; 40_php-mode.el --- setup php-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/29 11:12:47>
;;

;;; Commentary:

;;; Code:

(use-package php-mode
  :if (e:require-package 'php-mode nil t)
  :commands (php-mode)
  :init
  ;; 各種設定
  (set-variable 'php-mode-force-pear t)
  (set-variable 'php-manual-path (e:expand "php-chunked-xhtml" :local))
  (set-variable 'php-search-url "http://www.php.net/")
  (set-variable 'php-manual-url "http://www.php.net/manual/ja")
  :config
  ;; eldoc
  (use-package php-eldoc
    :if (e:require-package 'php-eldoc))
  ;; symfonyのスタイルを有効に
  (add-hook 'php-mode-hook
            'php-enable-symfony2-coding-style))

(provide '40_php-mode)
;;; 40_php-mode.el ends here
