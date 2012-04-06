;;(auto-install-from-url "http://github.com/nex3/haml/blob?path[]=extra&path[]=haml-mode.el&raw=true")
;;(auto-install-from-url "http://github.com/nex3/haml/blob?path[]=extra&path[]=sass-mode.el&raw=true")

;;haml-mode
(require 'haml-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
;;sass-mode
(require 'sass-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
