(require 'helm-config)
(helm-mode 1)
(setq helm-test-mode nil)

(defun my-helm ()
  (interactive)
  (helm :sources '(helm-c-source-buffers-list
                   helm-c-source-files-in-current-dir
                   helm-c-source-recentf
                   helm-c-source-buffer-not-found)
        :buffer "*my helm*"))

(define-key global-map (kbd "C-.") 'my-helm)

;; (auto-install-from-emacswiki "anything-gtags.el")
;; (require 'anything-gtags)
(defun my-search-helm ()
  (interactive)
  (helm :sources'(helm-c-source-occur
                  helm-c-source-semantic
                  helm-c-source-imenu
                  helm-c-source-emacs)
        :buffer "*my-search-helm*"
        :preselect (thing-at-point 'symbol)))

(global-set-key (kbd "s-s") 'my-search-helm)
(global-set-key (kbd "M-x") 'helm-M-x)
