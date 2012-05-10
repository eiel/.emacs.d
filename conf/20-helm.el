(require 'helm-config)
(helm-mode 1)
(setq helm-test-mode nil)
(define-key global-map (kbd "C-.") 'helm-mini)
