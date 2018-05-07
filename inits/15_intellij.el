;;; 15_intellij.el --- configurations.
;;; Commentary:
;;; Code:

(defconst intellij:intellij-path
  (cond
   ((os-type-mac-p) '("/Applications/IntelliJ IDEA.app" "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea"))
   (t nil))
  "IntelliJ IDEAのパス.")

(defconst intellij:clion-path
  (cond
   ((os-type-mac-p) '("/Applications/CLion.app" "/Applications/CLion.app/Contents/MacOS/clion"))
   (t nil))
  "CLionのパス.")

(defun intellij:select-app (buffer)
  "指定された BUFFER に対応するIntelliJのアプリケーションを取得する."
  (with-current-buffer buffer
    (cond
     ((member major-mode '(c++-mode)) intellij:clion-path)
     (t nil))))

(defun intellij:make-commands (buffer)
  "指定された BUFFER に対応するIntelliJのアプリケーションを起動するコマンドを作成する."
  (let ((commands nil)
        (app (intellij:select-app buffer)))
    (when app
      (with-current-buffer buffer
        (cond
         ((os-type-mac-p)
          (add-to-list 'commands (format "%s --line %d %s >/dev/null 2>&1" (nth 1 app) (line-number-at-pos) (buffer-file-name)))
          (add-to-list 'commands (format "open -a %s" (nth 0 app)) t)))))
    commands))

(defun open-by-intellij ()
  "現在のバッファのファイルを対応するIntelliJアプリケーションで開く."
  (interactive)
  (let ((commands (intellij:make-commands (current-buffer))))
    (cl-dolist (command commands)
      (shell-command command))))

(provide '15_intellij)
;;; 15_intellij.el ends here
