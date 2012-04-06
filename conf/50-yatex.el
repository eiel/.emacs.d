(setq load-path (cons "/usr/local/lib/mule/site-lisp/yatex/" load-path))
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq tex-command "platex")
(setq YaTeX-kanji-code 4)

; dviからpdfを作成する%sはファイル名
(setq dviprint-command-format "dvipdfmx %s")

(defun tex-preview ()
  "texファイルをコンパイルしてプレビューする。"
  (interactive)
  (save-buffer)
  (let ((base-name (substring 
		     (buffer-file-name)
		     0
		     (string-match "\\.tex" (buffer-file-name)))))
    (shell-command
     (concat 
      "platex " 
      base-name
      ".tex > /dev/null"
      " && " 
      "dvipdfmx "
      base-name
      ".dvi > /dev/null 2> /dev/null"
      " && "
      "open "
      base-name
      ".pdf > /dev/null"))))
;(setq yatex-mode-hook nil)
(add-hook 'yatex-mode-hook
	  (lambda () (local-set-key "\C-cp" 'tex-preview)))


