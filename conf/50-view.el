(global-set-key (kbd "C-;") 'view-mode)
(setq view-read-only t)
(defvar pager-keybind
      `( ;; vi-like
	("b" . backward-word)
	("n" . forward-word)
	("h" . next-line)
	("t" . previous-line)
	(";" . gene-word)
	("d" . scroll-down)
	(" " . scroll-up)
	;; w3m-like
	("m" . gene-word)
	("i" . win-delete-current-window-and-squeeze)
	("w" . forward-word)
	("e" . backward-word)
	("(" . point-undo)
	(")" . point-redo)
	("J" . ,(lambda () (interactive) (scroll-up 1)))
	("K" . ,(lambda () (interactive) (scroll-down 1)))
	;; bm-easy
	("." . bm-toggle)
	("[" . bm-previous)
	("]" . bm-next)
	;; langhelp-like
	("c" . scroll-or-window-down)
	("v" . scroll-or-window)
	))

(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
	    cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
	  (define-key keymap key cmd))))
  keymap)

(defun view-mode-hook0 ()
  (define-many-keys view-mode-map pager-keybind)
  (define-key view-mode-map " " 'scroll-up))
(add-hook 'view-mode-hook 'view-mode-hook0)

(defadvice view-mode
  (around view-mode-with-hl-line-mode () activate)
  (if view-mode
      (progn
       (hl-line-mode 0)
       ad-do-it)
    (progn
     (hl-line-mode 1)
     ad-do-it)))

(defvar view-mode-force-exit nil)
(defmacro do-not-exit-view-mode-unless-writable-advice (f)
  `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
     (if (and (buffer-file-name)
	      (not view-mode-force-exit)
	      (not (file-writable-p (buffer-file-name))))
	 (message "File is unwritable, so stay in view-mode.")
       ad-do-it)))

(do-not-exit-view-mode-unless-writable-advice view-mode-exit)
(do-not-exit-view-mode-unless-writable-advice view-mode-disable)
