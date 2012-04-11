;; 追加のelispなしで設定可能な設定を記述
(load "~/.emacs.d/conf/basic" t)

;; 設定ファイル内で使用するユーティリティを定義
(load "~/.emacs.d/conf/util" t)

;; 手動で管理している elisp をおくディレクトリ
(my-add-to-load-path-directory "~/.emacs.d/vendor")
;; git submodlue で管理している elisp をおくディレクトリ
(my-add-to-load-path-directory "~/.emacs.d/bundle")

;; 数値-*.el を数値順に読みこむ
(my-load-conf-file "~/.emacs.d/conf")
(setenv "PATH" (mapconcat 'identity exec-path ":"))
