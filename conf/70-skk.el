(setq skk-user-directory "~/.emacs.d/ddskk/") ; ディレクトリ指定
(when (require 'skk-autoloads nil t)
  ;; C-x C-j で skk モードを起動
  (define-key global-map (kbd "C-x C-j") 'skk-mode)
  ;; .skk を自動的にバイトコンパイル
  (setq skk-byte-compile-init-file t))

;; ;; skk
;; (add-to-list 'load-path "/usr/local/share/emacs/23.1.50/site-lisp/skk")
;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/apel")
;; (add-to-list 'load-path "/usr/local/share/emacs/23.1.50/site-lisp/emu")
;; ;; Configure for SKK
;; ;;(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-mode)
;; (global-set-key "\C-xj" 'skk-mode)
;; ;(global-set-key "\C-xt" 'skk-tutorial)
;; ;; Specify dictionary location
;; (setq skk-large-jisyo "~/Library/AquaSKK/SKK-JISYO.L")
;; ;; Specify tutorial location
;; (setq skk-tut-file "/usr/share/skk/SKK.tut")

;; (add-hook 'isearch-mode-hook
;; 	  (function (lambda ()
;; 		      (and (boundp 'skk-mode) skk-mode
;; 			   (skk-isearch-mode-setup)))))

;; (add-hook 'isearch-mode-end-hook
;; 	  (function
;; 	   (lambda ()
;; 	     (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
;; 	     (and (boundp 'skk-mode-invoked) skk-mode-invoked
;; 		  (skk-set-cursor-properly)))))
;; (setq mac-pass-control-to-system nil)

;; ;Dvorak 用設定
;; (setq skk-use-act t)
;; ;;変換の確定用のキー
;; (setq skk-henkan-show-candidates-keys
;;  '(?a ?o ?e ?u ?i ?d ?h))

;; ;; 確定時改行しない
;; (setq skk-egg-like-newline t)
;; (setq skk-auto-insert-paren t);;対になる括弧を自動入力
;; (setq skk-henkan-strict-okuri-precedence t);;送り仮名が厳密に正しい候補を優先して表示
;; (setq skk-use-look t);;英単語補完
;; (setq skk-check-okurigana-on-touroku 'auto);;余分な送り仮名も辞書に自動登録、嫌なら 'nil 質問方式なら 'ask
;; (setq skk-auto-start-henkan t);;特定文字入力時、自動的に変換を開始

;; (setq skk-dcomp-activate t);;日本語をダイナミックに補完する
;; (setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
;; (setq skk-dcomp-multiple-rows 10)	 ; 動的補完の候補表示件数

;; (setq skk-cursor-hiragana-color "#633")
;; (setq skk-cursor-latin-color "#663")

;; (defun skk-force-on ()
;;   (interactive)
;;   (skk-mode)
;;   (skk-mode-off)
;;   (skk-mode))
;; (global-set-key (kbd "C-;") 'skk-force-on)

;; (defun my-hook-skk-init ()
;;   (define-key skk-j-mode-map (kbd "C-j") nil)
;;   (define-key skk-jisx0208-latin-mode-map  (kbd "C-j") nil)
;;   (define-key skk-latin-mode-map (kbd "C-j") nil))
;; (add-hook 'skk-mode-hook 'my-hook-skk-init)

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8-unix)
