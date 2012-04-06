(add-to-list 'load-path "/opt/local/share/doc/git-core/contrib/emacs/")
;;; version-control
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(require 'git-emacs)
(setq git-state-modeline-decoration 'git-state-decoration-colored-letter)
(when darwin-p
  (defun gitk ()
    "launch gitx in emacs"
    (interactive)
    (shell-command "gitx" nil nil))
  (defun gitk-all ()
    (interactive)
    (shell-command "gitx --all")))
(setq git--use-ido nil)
;(add-to-list 'vc-handled-backends 'GIT)
;;; git egg
;; (add-to-list 'load-path "~/.emacs.d/vendor/egg")
;; (require 'egg)

;; (add-to-list 'load-path "~/.emacs.d/vendor/magit/")
(require 'magit)
(require 'magit-svn)
(global-set-key "\C-cg" 'magit-status)

;; (add-to-list 'load-path "~/.emacs.d/vendor/egit/")
;; (require 'egit)

;; (add-to-list 'load-path "~/.emacs.d/vendor/gitsum/")
;; (require 'gitsum)