;;; ELPAで設定済のものの設定
;;; ruby-mode inf-ruby rspec-mode ruby-compilation ruby-test-mode rvm rinari
;;; ruby-mode
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Ocmgen" . ruby-mode))

(defun ruby-mode-hook-init ()
  "encodingを自動挿入しないようにする"
  (remove-hook 'before-save-hook 'ruby-mode-set-encoding)
  (define-key ruby-mode-map " " nil)
  (define-key ruby-mode-map "\C-j" nil))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-init)

(defun my-ruby-mode-set-encoding ()
  "set-encoding ruby-mode"
  (interactive)
  (ruby-mode-set-encoding))
(define-key ruby-mode-map "\C-ce" 'my-ruby-mode-set-encoding)

(defun my-ruby-insert-encoding ()
  "set-encoding utf-8"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (insert "# -*- coding: utf-8 -*-\n")))

;;; ruby-electric
(defun ruby-mode-hook-ruby-elecrtric ()
  (ruby-electric-mode t)
  (define-key ruby-mode-map "\C-c\C-e" 'ruby-insert-end))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-elecrtric)

;;; rvm
;; (defadvice ido-completing-read (around invaild-ido-completing-read activate)
;;   "ido-completing-read -> completing-read"
;;   (complete-read))
;; (require 'rvm)
;; (rvm-use-default)

;;; rubydb
;; (install-elisp "http://svn.ruby-lang.org/repos/ruby/trunk/misc/rubydb3x.el")
(autoload 'rubydb "rubydb3x" "ruby debug t")

;;; auto-installによってインストールした elisp の設定
;; (install-elisp-from-emacswiki "ruby-block.el")
(require 'ruby-block)
(setq ruby-block-highlight-toggle t)
(defun ruby-mode-hook-ruby-block()
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)

;;; githubなどからリポジトリから取得しているelispの設定
;; RSense
;; http://cx4a.org/software/rsense/index.ja.html
;; (setq rsense-home (expand-file-name "~/opt/rsense/"))
;; (setq rsense-rurema-home "~/opt/rurema")
;; (add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)
;; (define-key ruby-mode-map "\C-c\C-i" 'ac-complete-rsense)
;; (define-key ruby-mode-map "\C-ct" 'rsense-type-help)
;; (define-key ruby-mode-map "\C-cj" 'rsense-jump-to-definition)


;;; その他
;;; ri-emacs
(setq ri-ruby-script
      (expand-file-name "~/.emacs.d/from_git/ri-emacs/ri-emacs.rb"))
(autoload 'ri "ri-ruby.el" "Execute `ri'." t)

(add-to-list 'load-path "~/.emacs.d/vendor/rcodetools")
(require 'rcodetools)
(require 'anything-rcodetools)
;; Command to get all RI entries.
(setq rct-get-all-methods-command"PAGER=cat qri -l")
(define-key ruby-mode-map "\C-cl" 'rct-complete-symbol)
(define-key ruby-mode-map "\C-cx" 'xmpfilter)

;;; flymake
(require 'flymake)

(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(defun ruby-mode-hook-flymake-init ()
 "Don't want flymake mode for ruby regions in rhtml files and also on read only files"
  (if (and (not (null buffer-file-name))
           (file-writable-p buffer-file-name))
      (flymake-mode-on)))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-flymake-init)

;;; rhtml-mode
(require 'rinari)
(setq rinari-tags-file-name "TAGS")
(require 'ruby-compilation-rspec)
(require 'rhtml-mode)
;; (add-hook 'rhtml-mode-hook
;;           (lambda () (rinari-launch)))

(require 'rspec-mode)
(setq rspec-use-rake-flag nil)
(setq rspec-use-bundler-when-possible nil)


;; autotest
;; (auto-install-from-emacswiki "autotest.el")
(require 'autotest)


;;; rails_best_practice
(defvar rails-best-practices:buffer-name "*Rails Best Practices*")
(defun rails-best-practices:exec ()
  (interactive)
  (let ((process
         (start-process-shell-command
          "rails_best_practices"
          rails-best-practices:buffer-name
          (concat "rails_best_practices " (rinari-root) " --without-color --silent"))))
    (with-current-buffer (get-buffer rails-best-practices:buffer-name)
      (compilation-mode))
    (set-process-sentinel process 'rails-best-practices:callback)))

(defun rails-best-practices:callback (process event)
  (with-current-buffer (get-buffer rails-best-practices:buffer-name)
    (beginning-of-buffer)))


;;; rbenv
(setq rbenv-path "~/.rbenv")
(setq rbenv-command (concat (expand-file-name rbenv-path) "/bin/rbenv"))
(setq rbenv-shims-path (concat (expand-file-name rbenv-path) "/shims"))
(setq rbenv-bin-path (concat (expand-file-name rbenv-path) "/bin"))

;; util
(defun rbenv-add-to-list (list-var element)
  "必ず先頭に要素を追加する `add-to-list` 要素がある場合は先頭に移動する"
  (set list-var (cons element (remove element (symbol-value list-var)))))

;; command
(defun rbenv-reset-exec-path ()
  (interactive)
  (rbenv-add-to-list 'exec-path rbenv-bin-path)
  (rbenv-add-to-list 'exec-path rbenv-shims-path)
  (setenv "PATH" (mapconcat 'identity exec-path ":")))
(rbenv-reset-exec-path)

(setq feature-default-language "ja")
;; point to cucumber languages.yml or gherkin i18n.yml to use
;; exactly the same localization your cucumber uses
;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
