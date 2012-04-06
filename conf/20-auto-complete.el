;; (require 'imenu)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; (require 'ac-company)
;; (ac-config-default)

;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; (setq ac-auto-start 2)
;; (setq ac-auto-show-menu 1)
;; (setq ac-dwin t)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-same-mode-buffers ac-source-words-in-buffer ac-source-filename))

;; ;;; http://d.hatena.ne.jp/kitokitoki/20101205/p2#
;; (defun my-ac-look ()
;;   "look コマンドの出力をリストで返す"
;;   (interactive)
;;   (unless (executable-find "look")
;;     (error "look コマンドがありません"))
;;   (let ((search-word (thing-at-point 'word)))
;;     (with-temp-buffer
;;       (call-process-shell-command "look" nil t 0 search-word)
;;       (split-string-and-unquote (buffer-string) "\n"))))

;; (defun ac-complete-look ()
;;   (interactive)
;;   (let ((ac-menu-height 50)
;;         (ac-candidate-limit t))
;;   (auto-complete '(ac-source-look))))

;; ;; 表示数制限を変更しない場合
;; ;;(defun ac-complete-look ()
;; ;;  (interactive)
;; ;;  (auto-complete '(ac-source-look)))

;; (defvar ac-source-look
;;   '((candidates . my-ac-look)
;;     (requires . 2)))  ;; 2文字以上ある場合にのみ対応させる

;; ;; キーは好きなのを割り当てて下さい
;; (global-set-key "\C-ch" 'ac-complete-look)
