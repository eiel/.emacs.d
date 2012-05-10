;; org-mode
;; The following lines are always needed.  Choose your own keys.
(require 'org-install)
(add-to-list 'load-path "~/.emacs.d/vendor/org-mode/lisp")
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")


(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)
(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
(setq org-agenda-files nil)
(dolist (my-org-file (list "main.org"))
  (add-to-list 'org-agenda-files (concat org-directory "/" my-org-file) t))
(setq org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/org-mode/contrib/lisp/"))

(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
(setq org-startup-indented t)
