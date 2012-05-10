;; emacs21 移行のemacsであれば動作する設定を記述
(font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(when (< emacs-major-version 23)
  (scroll-bar-mode nil))
(iswitchb-mode t)
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.bak"))
            backup-directory-alist))
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;;; 言語環境
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8-unix)
