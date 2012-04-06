(setq php-manual-path "~/local/php_manual")
(setq php-manual-url "http://www.phppro.jp/phpmanual/")
;; (auto-install-from-emacswiki "php-mode-improved.el")
(autoload 'php-mode "php-mode-improved" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(defun php-mode-hook-init ()
  (define-key php-mode-map (kbd "C-.") nil) ;(php-show-arglist)
)
(add-hook 'php-mode-hook 'php-mode-hook-init)

;; (auto-install-from-emacswiki "php-completion.el")
(require 'php-completion)
;; (auto-install-from-emacswiki "php-doc.el")
;;wget http://jp.php.net/distributions/manual/php_manual_en.tar.gz
;; (setq php-mode-force-pear t)

(defun php-mode-my-init ()
  (when (require 'auto-complete nil t)
    (make-variable-buffer-local 'ac-sources)
    (add-to-list 'ac-sources 'ac-source-php-completion)
    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
    (php-completion-mode t)
    (setq tab-width 4)
    (setq c-basic-offset 4)
    (c-set-style "stroustrup")
    (setq indent-tabs-mode nil)
    ;; if you like patial match,
    ;; use `ac-source-php-completion-patial' instead of `ac-source-php-completion'.
    ;; (add-to-list 'ac-sources 'ac-source-php-completion-patial)
    (auto-complete-mode t)))
(add-hook 'php-mode-hook 'php-mode-my-init)

(defun insert-php-sexp ()
  (interactive)
  (insert "<?php ?>")
  (indent-for-tab-command)
  (backward-char 3))
