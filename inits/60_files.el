;;; 60_files.el --- setup files.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:54:10>
;;

;;; Commentary:

;;; Code:

(use-package files
  :init
  (defconst backup-directory (e:expand "backup" :cache))
  ;; backup
  (let ((item (cons "\\.*$" backup-directory)))
    (unless (member item backup-directory-alist)
      (cl-pushnew item backup-directory-alist)))
  (set-variable 'make-backup-files   t) ;; バックアップを作成する
  (set-variable 'backup-by-copying   t) ;; コピーをバックアップする
  (set-variable 'version-control     t) ;; バックアップのバージョンを管理する
  (set-variable 'delete-old-versions t) ;; 古いバックアップを削除する
  (set-variable 'kept-new-versions   3) ;; 新しいバージョンの数
  (set-variable 'kept-old-versions   3) ;; 古いバージョンの数
  ;; auto-save
  (set-variable 'auto-save-default t)
  (set-variable 'auto-save-list-file-prefix (file-name-as-directory backup-directory))
  (set-variable 'auto-save-file-name-transforms `((".*" ,backup-directory t))))

(provide '60_files)
;;; 60_files.el ends here
