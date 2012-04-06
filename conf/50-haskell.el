;; (add-to-list 'load-path "~/.emacs.d/vendor/haskell-mode-2.8.0")
(require 'haskell-mode)

(load "haskell-site-file")
;; (add-to-list 'ac-modes 'haskell-mode)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'load-path "~/.emacs.d/from_git/ghc-mod/elisp")
(add-to-list 'exec-path "~/.cabal/bin")
(autoload 'ghc-init "ghc" nil t)

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; (require 'smartchr)
;; (defun haskell-mode-hook-keybind ()
;;   (define-key haskell-mode-map (kbd ">") (smartchr '(">" " >> " " >>= "))))
;; (add-hook 'haskell-mode-hook 'haskell-mode-hook-keybind)

(defun haskell-init-hooker ()
;;   (push 'my/ac-source-haskell ac-sources)
  ;; (auto-complete-mode t))
  (ghc-init))

(add-hook 'haskell-mode-hook 'haskell-init-hooker)


;; anything-ghc-completion
(setq anything-c-source-ghc-mod
  '((name . "ghc-completion")
    (init . ghc-mod-anything-init)
    (candidates . ghc-mod-symbols-for-anything)
    (action ("Completion" . anything-ghc-complete))))

(defun anything-ghc-complete (meth)
  (save-excursion
    (set-buffer anything-current-buffer)
    (search-backward anything-ghc-mod-target)
    (delete-char (length anything-ghc-mod-target)))
  (insert meth))

(defvar ghc-mod-symbols-for-anything nil)
(defvar ghc-mod-anything-target nil)
(defun ghc-mod-anything-init ()
  (setq ghc-mod-symbols-for-anything (ghc-select-completion-symbol))
  (setq anything-ghc-mod-target (anything-ghc-mod-target)))


(defun anything-ghc-mod-target ()
  (let* ((end (point))
	 (beg (ghc-completion-start-point))
	 (pattern (buffer-substring-no-properties beg end)))
	 pattern))

(when (require 'anything-show-completion nil t)
  (use-anything-show-completion 'anything-ghc-mod-completion '(length anything-ghc-mod-target)))

(defun anything-ghc-mod-completion ()
  (interactive)
  (anything anything-c-source-ghc-mod (anything-ghc-mod-target)))

(global-set-key "\C-c\C-a" 'anything-ghc-mod-completion)
