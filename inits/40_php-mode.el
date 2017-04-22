;;; 40_php-mode.el --- setup php-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:35:54>
;;

;;; Commentary:

;;; Code:

(use-package php-mode
  :ensure t
  :commands (php-mode)
  :config
  ;; 各種設定
  (custom-set-variables
   '(php-mode-force-pear t)
   '(php-manual-path (e:expand "php-chunked-xhtml" :local))
   '(php-search-url "http://www.php.net/")
   '(php-manual-url "http://www.php.net/manual/ja"))
  ;; symfonyのスタイルを有効に
  (add-hook 'php-mode-hook
            'php-enable-symfony2-coding-style))

(use-package php-eldoc
  :ensure t)

(provide '40_php-mode)
;;; 40_php-mode.el ends here
