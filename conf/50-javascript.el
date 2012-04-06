(add-to-list 'load-path "~/.emacs.d/vendor/js2")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (auto-install-from-url  "http://download-mirror.savannah.gnu.org/releases/espresso/espresso.el")
(require 'espresso)
;; (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

(defun js2-mode-hook-init ()
  (setq espresso-indent-level 2
        espresso-expr-indent-offset 2
        indent-tabs-mode nil)
  (defun my-js-indent-line ()
    (interactive)
    (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status)))
      (back-to-indentation)
      (if (looking-at "case\\s-")
          (indent-line-to (+ indentation 2))
        (espresso-indent-line))
      (when (> offset 0) (forward-char offset))))
  (set (make-local-variable 'indent-line-function) 'my-js-indent-line))
(add-hook 'js2-mode-hook 'js2-mode-hook-init)

(require 'coffee-mode)
(require 'jade-mode)