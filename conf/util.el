(defun my-list-elisp-file (dir)
  (directory-files dir nil "^[[:digit:]]\\{2\\}.*el$"))

(defun my-remove-ext (str)
  (substring str 0 -3))

(defun my-load-conf-file (dir)
  (dolist (file (mapcar #'my-remove-ext (my-list-elisp-file dir)))
    (load (concat dir "/" file))))

;;; require 補助
(defmacro my-require-and-when (feature &rest body)
  (declare (indent 1))
  `(if (require ,feature nil t)
       (progn
         (message "Require success: %s" ,feature)
         ,@body)
     (message "Require error: %s" ,feature)))


(require 'cl)
(defun my-add-to-load-path-directory (dir)
  "dirとdirに含まれるディレクトリをload-pathに加える"
  (setq load-path
	(append
	 (cons dir
	       (remove-if-not (lambda (x) (file-directory-p x))
			      (mapcar (lambda (x) (concat dir "/" x))
				      (directory-files dir nil "^[^.][^.]" t))))
	 load-path)))

;; emacs-verios predicates
(setq emacs21-p (= 21 emacs-major-version)
      emacs22-p (= 22 emacs-major-version)
      emacs23-p (= 23 emacs-major-version)
      emacs24-p (= 24 emacs-major-version)
      emacs23.0-p (and emacs23-p (= 0 emacs-minor-version))
      emacs23.1-p (and emacs23-p (= 1 emacs-minor-version))
      emacs23.2-p (and emacs23-p (= 2 emacs-minor-version))
      emacs23.3-p (and emacs23-p (= 3 emacs-minor-version))
      emacs24.0-p (and emacs24-p (= 0 emacs-minor-version)))

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))
