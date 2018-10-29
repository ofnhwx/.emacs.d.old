;;; 20_key-chord.el --- configurations.
;;; Commentary:
;;; Code:

(use-package key-chord
  :if (progn (quelpa '(key-chord :fetcher github :repo "zk-phi/key-chord"))
             (locate-library "key-chord"))
  :demand t
  :custom
  (key-chord-two-keys-delay           0.15)
  (key-chord-safety-interval-backward 0.10)
  (key-chord-safety-interval-forward  0.25)
  :config
  (key-chord-define-global "fj" 'e:base-commands-map)
  (key-chord-mode 1))

(provide '20_key-chord)
;;; 20_key-chord.el ends here
