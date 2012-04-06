;; (auto-install-from-emacswiki "multi-term.el")
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(defun multi-term-mode-hookee ()
 (define-key term-raw-map "¥C-y" 'term-paste)
 (define-key term-raw-map "¥C-q" 'move-beginning-of-line)
 (define-key term-raw-map "¥C-f" 'forward-char)
 (define-key term-raw-map "¥C-b" 'backward-char)			     
 (define-key term-raw-map "¥C-t" 'set-mark-command)			     
 (define-key term-raw-map (kbd "ESC") 'term-send-raw)
 (define-key term-raw-map [delete] 'term-send-raw)
 (define-key term-raw-map "¥C-z"
   (lookup-key (current-global-map) "¥C-z")))


;; (global-set-key "\C-cc" 'multi-term)
;; (global-set-key "\C-cn" 'multi-term-next)
;; (global-set-key "\C-cp" 'multi-term-prev)
