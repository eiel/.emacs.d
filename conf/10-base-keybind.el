(setq my:sub-map (make-sparse-keymap))
(global-set-key (kbd "C-c c") my:sub-map)
(global-set-key (kbd "s-t") 'other-window)
;;(define-key ctl-x-map "\C-?" 'help-command)
(global-set-key "\C-\M-y" 'scroll-other-window-down)
;;(keyboard-translate ?\C-h ?\C-?)

(defun my-keybind ()
  (interactive)
  (dolist
  (global-set-key "\C-h" 'next-line)
  (global-set-key "\C-t" 'previous-line)
  ;; help
  (global-set-key "\C-p" 'previous-line))
)

'(("\C-h" next-line)
 ("\C-t" previous-line))

;; https://github.com/imakado/emacs-smartchr
(when nil
  (require 'smartchr)
  (global-set-key (kbd "=") (smartchr '("=" " = " " == " " === " " =~ ")))
  (global-set-key (kbd "\"") (smartchr '("\"" "\"`!!'\"")))
  (global-set-key (kbd "'") (smartchr '("\'" "\'`!!'\'" )))
  (global-set-key (kbd "`") (smartchr '("\`" "\``!!'\`")))
  (global-set-key (kbd "(") (smartchr '( "(" "(`!!')")))
  (global-set-key (kbd ">") (smartchr '(">" " => " " => '`!!''" " => \"`!!'\""))))
