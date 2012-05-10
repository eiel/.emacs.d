;;; (auto-install-from-url "http://launchpadlibrarian.net/86159191/mediawiki.el")

(require 'mediawiki)
(defvar private:media-wiki-site-alist ())
(setq mediawiki-site-alist private:media-wiki-site-alist)

(defun mediawiki-mode-hooker ()
  (define-key mediawiki-mode-map (kbd "<C-return>") 'mediawiki-open-page-at-point ))

(add-hook 'mediawiki-mode-hook 'mediawiki-mode-hooker)
(setq mediawiki-default-page-name "メインページ")
