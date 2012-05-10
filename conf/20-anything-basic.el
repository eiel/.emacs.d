;;; anything.el の基本プラグインの設定
;; (auto-install-batch "auto-install")

;; (load "anything-startup.el")
(require 'anything-config)
(setq anything-c-filelist-file-name "/tmp/all.filelist")
(setq anything-grep-candidates-fast-directory-regexp "^/tmp")
;; (define-key global-map (kbd "C-.") 'anything)
(define-key my:sub-map (kbd "a") 'anything)
(define-key global-map (kbd "s-o") 'anything-filelist+)

(define-key global-map [(control ?:)] 'anything-migemo)
;; (require 'anything-complete)
;; (anything-read-string-mode 1)

;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/shell-history.el")
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/shell-command.el")

;; (install-elisp-from-emacswiki "anything-dabbrev-expand.el")
(require 'anything-dabbrev-expand)
(global-set-key "\M-/" 'anything-dabbrev-expand)
(define-key anything-dabbrev-map "\M-/" 'anything-dabbrev-find-all-buffers)


;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr.el")
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr-config.el")
(require 'anything-kyr-config)

;; anything-sources
(setq anything-my-sources
      '(anything-c-source-kyr
        anything-c-source-buffers+
        anything-c-source-filelist
        anything-c-source-recentf
        anything-c-source-emacs-commands
        anything-c-source-call-source
        anything-c-source-emacs-variables
        ;; anything-c-source-emacs-functions
        ;; anything-c-source-ffap-guesser
        ))

(setq anything-sources anything-my-sources)

(setq anything-enable-shortcuts 'alphabet)
(setq anything-shortcut-keys-alist '((alphabet . "aoeuidhtnsqjkxbmwvz")
				     (t . "123456789")))


(require 'ac-anything)
(define-key ac-complete-mode-map (kbd "C-.") 'ac-complete-with-anything)

;; (defvar anything-c-source-semantic
;;   '((name . "Semantic Tags")
;;     (init . (lambda ()
;;               (setq anything-c-source-semantic-candidates
;;                     (anything-c-source-semantic-construct-candidates (semantic-fetch-tags) 0))))
;;     (candidates . (lambda ()
;;                     (mapcar 'car anything-c-source-semantic-candidates)))
;;     (action . (("Goto tag" . (lambda (candidate)
;;                                (let ((tag (cdr (assoc candidate anything-c-source-semantic-candidates))))
;;                                  (semantic-go-to-tag tag))))))))


;; (defun my-mplay (file)
;; 	"play file in mplayer"
;; 	(start-process "play mplayer" nil "/home/eiel/bin/mplayer4" file))

;; (defun my-anything-recent-video ()
;;   "一週間以内に作成した動画ファイルをanything"
;; 	(interactive)
;; 	(anything
;; 	 '(((name . "Recent Video")
;; 	    (init . (lambda ()
;; 		      (with-current-buffer (anything-candidate-buffer 'local)
;; 			(call-process-shell-command 
;; 			 "cat /media/main/share/video/update_within_7_days.txt"
;; ;			 "find /mnt/share/video -type f -mtime -7"
;; 			 nil (current-buffer)))))
;; 	    (candidates-in-buffer)
;; 	    (migemo)
;; 	    (action . (("play mplayer" . my-mplay)))))))
;; (define-key global-map "\C-ccv" 'my-anything-recent-video)

;; (defun my-anything-jabber ()
;;   (interactive)
;;   (let ((anything-use-migemo t))
;;     (anything '(anything-c-source-jabber-contacts))))
;; (define-key global-map "\C-ccj" 'my-anything-jabber)
;; ;(anything '(anything-c-source-google-suggest))

;; ;;; (install-elisp "http://www.emacswiki.org/emacs/download/descbinds-anything.el")
;; (require 'descbinds-anything)
;; (descbinds-anything-install)
