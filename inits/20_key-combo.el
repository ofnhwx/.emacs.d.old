;;; 20_key-combo.el --- configurations.
;;; Commentary:
;;; Code:

(use-package key-combo
  :ensure t
  :demand t
  :diminish key-combo-mode)

(use-package key-combo
  :no-require t
  :after (evil)
  :hook
  (evil-insert-state-entry . key-combo-mode-on)
  (evil-insert-state-exit  . key-combo-mode-off)
  (evil-emacs-state-entry  . key-combo-mode-on)
  (evil-emacs-state-exit   . key-combo-mode-off)
  :config
  (defun key-combo-mode-on ()
    (key-combo-mode 1))
  (defun key-combo-mode-off ()
    (key-combo-mode 0))
  (global-key-combo-mode 0))

(use-package key-combo
  :no-require t
  :after (cc-mode)
  :config
  (key-combo-define c++-mode-map "." '("." "->"))
  (key-combo-define c++-mode-map "," '("," ", "))
  (key-combo-define c++-mode-map "+" '(" + " "++"))
  (key-combo-define c++-mode-map "-" '(" - " "--"))
  (key-combo-define c++-mode-map "=" '(" = " " == " ))
  (key-combo-define c++-mode-map "#" '("#" "#include"))
  (key-combo-define c++-mode-map "->" "->")
  (key-combo-define c++-mode-map "!=" " != ")
  (key-combo-define c++-mode-map "+=" " += ")
  (key-combo-define c++-mode-map "-=" " -= ")
  (key-combo-define c++-mode-map "*=" " *= ")
  (key-combo-define c++-mode-map "/=" " /= ")
  (key-combo-define c++-mode-map "<=" " <= ")
  (key-combo-define c++-mode-map ">=" " >= ")
  (key-combo-define c++-mode-map "<<" " << ")
  (key-combo-define c++-mode-map ">>" " >> "))

(provide '20_key-combo)
;;; 20_key-combo.el ends here
