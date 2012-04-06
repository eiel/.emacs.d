;;; simple-hatena
;;; (auto-install-from-url "http://svn.coderepos.org/share/lang/elisp/simple-hatena-mode/tags/release-0.15/simple-hatena-mode.el")
(require 'simple-hatena-mode)
(setq simple-hatena-bin "~/bin/hw.pl")
(setq simple-hatena-default-id "eiel")
;; はてなダイアリーライターのクッキーオプション(デフォルト値: t)
(setq simple-hatena-option-cookie-flag nil)
;; 日付を計算する際に用いるオフセット。たとえば以下のように6に設定する
;; と、午前6時まで前日の日付として扱われる(デフォルト値: nil)
(setq simple-hatena-time-offset 6)
