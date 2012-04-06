(setenv "PATH" (concat "~/local/flex_sdk_3/bin:" (getenv "PATH")))
;;; (auto-install-from-url "http://blog.pettomato.com/content/site/actionscript-mode.el")
(autoload 'actionscript-mode "actionscript-mode" "actionscript" t)
(setq auto-mode-alist

      (append '(("\\.as$" . actionscript-mode))

              auto-mode-alist))

(add-hook 'actionscript-mode-hook
	  (lambda () (setq tab-width 4)))