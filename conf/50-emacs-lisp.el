(require 'auto-complete-config)
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))

(setq anything-sources-emacs-lisp-mode '(
                                         anything-c-source-emacs-functions
                                         anything-c-source-emacs-variables
                                         ))

(define-key emacs-lisp-mode-map (kbd "C-c k")
  (lambda ()
    (interactive)
    (insert (format "(kbd \"%s\")"
                    (key-description (read-key-sequence ""))))))

;; (install-elisp-from-emacswiki "eldoc-extension.el")
(require 'eldoc-extension)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
