;;; 整理できてないものが多数あり
(setq my-private-file "~/.emacs.d/conf/private/private-init.el")
(when (file-readable-p my-private-file)
  (load-file my-private-file))

(when nil
  (when darwin-p
    (require 'ucs-normalize)
    (set-file-name-coding-system 'utf-8-hfs)
    (setq local-coding-system 'utf-8-hfs)))

(column-number-mode t)
(setq frame-title-format "%f %I")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")
(put 'narrow-to-region 'disabled nil)
(setq-default tab-width 8)
(setq history-length 10000)

;;; 新規フレームのデフォルト設定
(setq default-frame-alist
      (append
       '((width  . 80)	; フレーム幅(文字数)
 	 (height . 52))	; フレーム高(文字数)
       default-frame-alist))
;; (add-to-list 'default-frame-alist '(alpha . 90))

(defun double-size-width-frame()
  (interactive)
  (set-frame-width nil 160))
(defun single-size-width-frame ()
  (interactive)
  (set-frame-width nil 80))
(global-set-key "\C-c1" 'single-size-width-frame)
(global-set-key "\C-c2" 'double-size-width-frame)

(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus)
	session-globals-include '((kill-ring 50)
				  (session-file-alist 100 t)
				  (file-name-history 100)))
  (add-hook 'after-init-hook 'session-initialize))
(global-hi-lock-mode t)


;(desktop-save-mode 1)

(defun mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;;yasnippet
;; (setq yas/root-directory "~/.emacs.d/snippets")
;; (yas/load-directory yas/root-directory)
;; (auto-install-from-url "http://svn.coderepos.org/share/lang/elisp/anything-c-yasnippet/anything-c-yasnippet.el")
(require 'yasnippet)
;; (setq yas/snippet-dirs '("~/.emacs.d/snippets"
;;                          "~/.emacs.d/from_git/yasnippet/extras/imported"))
(yas/global-mode 1)
(setq yas/use-menu nil)
;; (require 'anything-c-yasnippet)
;; (setq anything-c-yas-space-match-any-greedy t) ;[default: nil]
;; (global-set-key (kbd "C-c y") 'anything-c-yas-complete)
;; (add-to-list 'yas/extra-mode-hooks 'ruby-mode-hook)
;; (add-to-list 'yas/extra-mode-hooks 'cperl-mode-hook)


;; ediff
(setq ediff-window-setup-function (quote ediff-setup-windows-plain))

;; cmigemo
(when t
  (add-to-list 'load-path "~/.emacs.d/vendor")
  (load "migemo.el")
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "¥a"))
  (setq migemo-dictionary "/usr/local/share/migemo/euc-jp/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil))

;; (when (locate-library "nxhtml/autostart")
;;   (load "~/.emacs.d/vendor/nxhtml/autostart")
;;   (add-to-list 'auto-mode-alist '("\\.ctp$" . nxhtml-mumamo-mode)))

(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'right)

(require 'server)
(unless (server-running-p)
  (server-start))

;; http://d.hatena.ne.jp/itouhiro/20091122
(defadvice dabbrev-expand (around jword (arg) activate)
  (interactive "*P")
  (let* ((regexp dabbrev-abbrev-char-regexp)
	 (dabbrev-abbrev-char-regexp regexp)
	 char ch)
    (if (bobp)
	()
      (setq char (char-before)
	    ch (char-to-string char))
      (cond
        ;; ァ～ヶの文字にマッチしてる時はァ～ヶが単語構成文字とする
        ((string-match "[ァ-ヶー]" ch)
         (setq dabbrev-abbrev-char-regexp "[ァ-ヶー]"))
        ((string-match "[ぁ-んー]" ch)
         (setq dabbrev-abbrev-char-regexp "[ぁ-んー]"))
        ((string-match "[亜-瑤]" ch)
         (setq dabbrev-abbrev-char-regexp "[亜-瑤]"))
        ;; 英数字にマッチしたら英数字とハイフン(-)を単語構成文字とする
        ((string-match "[A-Za-z0-9]" ch)
;;         (setq dabbrev-abbrev-char-regexp "[A-Za-z0-9]"))
         (setq dabbrev-abbrev-char-regexp "[A-Za-z0-9-]")) ; modified by peccu
        ((eq (char-charset char) 'japanese-jisx0208)
         (setq dabbrev-abbrev-char-regexp
               (concat "["
                       (char-to-string (make-char 'japanese-jisx0208 48 33))
                       "-"
                       (char-to-string (make-char 'japanese-jisx0208 126 126))
                       "]")))))
     ad-do-it))

(setq show-paren-style 'mixed)


(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(global-set-key (kbd "<ns-drag-file>") 'ns-find-file)

(require 'ido)


;;; direx
(require 'direx)
(require 'direx-project)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

(defun my-direx:jump-to-directory-other-window ()
  (interactive)
  (condition-case error
      (direx-project:jump-to-project-root-other-window)
    ('error
     (let ((message (error-message-string error)))
       (if (equal "Project root not found" message)
           (direx:jump-to-directory-other-window)
         (error message))))))

(global-set-key (kbd "C-x d") 'my-direx:jump-to-directory-other-window)

(require 'popwin)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(let ((map direx:direx-mode-map))
  (define-key map (kbd "N") 'direx:next-sibling-item)
  (define-key map (kbd "P") 'direx:previous-sibling-item))
