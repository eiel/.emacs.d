;; (when (and (eq window-system 'ns) (= emacs-major-version 23)) 
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    'japanese-jisx0208
;;    '("Hiragino Maru Gothic Pro" . "iso10646-1"))

;; (when (and ns-p (= emacs-major-version 23))
;;   (create-fontset-from-ascii-font
;;    "-apple-menlo-medium-normal-normal-*-12-*" nil "hirakaku12")

;;   (set-default-font "fontset-hirakaku12")
;;   (add-to-list 'default-frame-alist '(font . "fontset-hirakaku12"))

;;   (set-fontset-font
;;    "fontset-hirakaku12"
;;    'japanese-jisx0208
;;    "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

;;   (set-fontset-font
;;    "fontset-hirakaku12"
;;    'jisx0201
;;    "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

;;   (set-fontset-font
;;    "fontset-hirakaku12"
;;    'japanese-jisx0212
;;    "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

;;   (set-fontset-font
;;    "fontset-hirakaku12"
;;    'katakana-jisx0201
;;    "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")
;; )

(defun my-set-default-font (family)
  (set-face-attribute 'default nil
                      :family family
                      :weight 'normal
                      :slant 'normal))

(defun my-set-default-font-size (size)
  (set-face-attribute 'default nil :height size))

(defun my-set-jp-default-font (family)
   (let ((fn (frame-parameter nil 'font))
		(rg "iso10646-1"))
     (set-fontset-font fn 'katakana-jisx0201 `(,family . ,rg))
     (set-fontset-font fn 'japanese-jisx0208 `(,family . ,rg))
     (set-fontset-font fn 'japanese-jisx0212 `(,family . ,rg))))

(cond
 ((eq window-system 'ns)
  (my-set-default-font "Menlo")
  (my-set-default-font-size 110)
  ;; (my-set-default-font-size 240)
  (my-set-jp-default-font "Hiragino Kaku Gothic Pro")
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.3)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3)))))