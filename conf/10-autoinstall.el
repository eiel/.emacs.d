;; autoinstallとauto-installを使用してインストールしているものを集める

;;; auto-install
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/auto-install.el")
;; (2) And put the following in your ~/.emacs startup file:
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
;; (3) Add this to your ~/.emacs to optionally specify a download directory:
(setq auto-install-directory "~/.emacs.d/auto-install/")
;; (4) Optionally, if your computer is always connected Internet when Emacs start up,
;;     I recommend you add below to your ~/.emacs, to update package name when start up:
;;(auto-install-update-emacswiki-package-name t)
;;     And above setup is not necessary, because AutoInstall will automatically update
;;     package name when you just first call `auto-install-from-emacswiki',
;;     above setup just avoid *delay* when you first call `auto-install-from-emacswiki'.
;;
;; (5) I recommend you add below to your ~/.emacs for install-elisp users:
(auto-install-compatibility-setup)

;; (auto-install-from-url "http://0xcc.net/misc/auto-save/auto-save-buffers.el")
;; (auto-install-from-url "http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el")
(require 'auto-save-buffers)
(run-with-idle-timer 20 t 'auto-save-buffers "" "\\.gpg$")

(defadvice tcode-mazegaki-convert (around tcode-mazegaki-convert-around)
  "auto-save-buffers を変換中は停止するように"
  (setq auto-save-buffers-active-p nil)
  ad-do-it
  (setq auto-save-buffers-active-p t))
(ad-activate 'tcode-mazegaki-convert)

;; html-helper-mode
;; (auto-install-from-url "http://www.santafe.edu/~nelson/tools/html-helper-mode.el")
(require 'html-helper-mode)


;; key-code.el
;;(auto-install-from-emacswiki "key-chord.el")

;; (require 'key-chord)
;; (setq key-chord-two-keys-delay 0.04)
;; (key-chord-mode 1)

;; (key-chord-define-global "uh" 'undo)
;; (key-chord-define-global "hn" 'view-mode)
;; (key-chord-define-global "eu" 'anything)

;; jump
;;(auto-install-from-emacswiki)

;; color-moccur
;; (auto-install-from-url "http://www.bookshelf.jp/elc/color-moccur.el")
(require 'color-moccur)
;; (auto-install-from-emacswiki "moccur-edit.el")
(require 'moccur-edit)
(setq dmoccur-exclusion-mask
      (append '("\\~$" "\\.svn\\/\*" "\\.git\\/\*") dmoccur-exclusion-mask))

;;; dmacro
;; (auto-install-from-url "http://www.pitecan.com/papers/JSSSTDmacro/dmacro.el")
(defconst *dmacro-key* "\C-t" [?\s-c])
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; (auto-install-from-url "http://github.com/tomoya/hiwin-mode/raw/master/hiwin.el")
;;(require 'hiwin)
;;(hiwin-mode)

;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-layout/raw/master/window-layout.el")
;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-manager/raw/master/e2wm.el")

;; (auto-install-from-url "http://taiyaki.org/elisp/sense-region/src/sense-region_2002-05-23.el")
;; (require 'sense-region)
;; (sense-region-on)

;; (install-elisp-from-emacswiki "sudo-ext.el")
(require 'sudo-ext)

;;; deferred.el
;;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
(require 'deferred)
;;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el")

;; http://www.emacswiki.org/emacs/download/thing-opt.el
;;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/thing-opt.el")
(require 'thing-opt)
(define-thing-commands)

;; http://www.emacswiki.org/emacs/download/browse-kill-ring.el
;;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/browse-kill-ring.el")
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;; https://github.com/kiwanami/emacs-id-manager
;;; (auto-install-from-url "https://github.com/kiwanami/emacs-id-manager/raw/master/id-manager.el")
(require 'id-manager)
(autoload 'id-manager "id-manager" nil t)
(global-set-key (kbd "M-7") 'id-manager)                     ; anything UI
(setq epa-file-cache-passphrase-for-symmetric-encryption t)  ; saving password
(setenv "GPG_AGENT_INFO" nil)

;; recentf
(require 'recentf-ext)
(setq recentf-max-saved-items 5000)

(require 'yaml-mode)

(add-hook 'compilation-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-filter-hook
          '(lambda ()
             (let ((start-marker (make-marker))
                   (end-marker (process-mark (get-buffer-process (current-buffer)))))
               (set-marker start-marker (point-min))
               (ansi-color-apply-on-region start-marker end-marker))))

(defadvice bookmark-set (around bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t) ;; 登録前に最新のブックマークを読み直す
  ad-do-it
  (bookmark-save))

(defadvice bookmark-jump (before bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t))

(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "purple4")


;最小の ewm 設定例
;; (require 'e2wm)
;; (global-set-key (kbd "M-+") 'e2wm:start-management)

(require 'lingr)


(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

(require 'jaunte)
(global-set-key "\C-cj" 'jaunte)


;;; TODO minor-mode化する
(defun my-end-of-buufer-delete-blank-lines ()
  "ファイル末尾の不要な空行を削除する"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (when (< (+ 1 (point)) (point-max))
        (goto-char (point-max))
        (delete-blank-lines)))))
(add-hook 'before-save-hook 'my-end-of-buufer-delete-blank-lines)


(blink-cursor-mode nil)

;; (setq tcode-use-as-default-input-method t)
;; (require 'tc-setup)

;; (require 'crosshairs)
;; (setq crosshairs-vline-same-face-flag t)
;; (toggle-crosshairs-when-idle)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi
(require 'htmlize)
(defun htmlize-and-browse ()
  (interactive)
  (defcustom
    htmlize-and-browse-directory-path temporary-file-directory
    "htmlize-and-browse-temporary-file-directory"
    :type 'string
    :group 'htmlize-and-browse)
  (setq htmlize-and-browse-buffer-file-name (concat "htmlize-and-browse-" (format-time-string "%Y%m%d%H%M%S" (current-time)) ".html"))
  (setq htmlize-and-browse-buffer-file-path (concat htmlize-and-browse-directory-path htmlize-and-browse-buffer-file-name))
  (with-current-buffer (htmlize-buffer)
    (write-file htmlize-and-browse-buffer-file-path)
    (set-buffer-modified-p nil)
    (kill-buffer htmlize-and-browse-buffer-file-name)
    (shell-command (concat "open " htmlize-and-browse-buffer-file-path))
  )
)

(defun htmlize-and-browse-by-safari ()
  (interactive)
  (defcustom
    htmlize-and-browse-directory-path temporary-file-directory
    "htmlize-and-browse-temporary-file-directory"
    :type 'string
    :group 'htmlize-and-browse)
  (setq htmlize-and-browse-buffer-file-name (concat "htmlize-and-browse-" (format-time-string "%Y%m%d%H%M%S" (current-time)) ".html"))
  (setq htmlize-and-browse-buffer-file-path (concat htmlize-and-browse-directory-path htmlize-and-browse-buffer-file-name))
  (with-current-buffer (htmlize-buffer)
    (write-file htmlize-and-browse-buffer-file-path)
    (set-buffer-modified-p nil)
    (kill-buffer htmlize-and-browse-buffer-file-name)
    (shell-command (concat "open -a safari " htmlize-and-browse-buffer-file-path))
  )
)

(require 'git-commit)

(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "M-@") 'er/contract-region)

; (setq cursor-type 'hbar)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; (auto-install-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file)
