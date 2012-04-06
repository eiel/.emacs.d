(setq inferior-lisp-program "/opt/sbcl-1.0.35/bin/sbcl")
(setq slime-net-coding-system 'utf-8-unix)

;(add-to-list 'load-path "/Users/eiel/site-lisp/slime")
(defun lisp-mode-hooker ()
  (slime-mode t))
(add-hook 'lisp-mode-hook 'lisp-mode-hooker)


(require 'slime)
(slime-setup)
