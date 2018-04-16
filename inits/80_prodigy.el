;;; 80_prodigy.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/16 12:16:05>
;;

;;; Commentary:

;;; Code:

(use-package prodigy
  :config
  (prodigy-define-service
    :name "google-ime-skk"
    :command "google-ime-skk"
    :tags '(general)
    :kill-signal 'sigkill)
  ;; 自動起動
  (prodigy-start-service (prodigy-find-service "google-ime-skk")))

(provide '80_prodigy)
;;; 80_prodigy.el ends here
