;; (auto-install-from-emacswiki "descbinds-anything.el")
(require 'descbinds-anything)
(descbinds-anything-install)

(require 'anything-project)
(global-set-key (kbd "s-g") 'anything-project)

(defun my-search-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-occur
     anything-c-source-imenu
     )
   "*my-search-anything*"))
(global-set-key (kbd "s-s") 'my-search-anything)

(defun my-web-search-anything ()
  (interactive))

(defun my-document-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-man-pages
     anything-c-source-info-pages
     anything-c-source-info-elisp)
   "*my-document-anything*"))
(global-set-key (kbd "s-d") 'my-document-anything)

(require 'anything-hatena-bookmark)
(setq anything-hatena-bookmark-samewindow t)
