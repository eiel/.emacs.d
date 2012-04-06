(defface my-face-f-2 '((t (:foreground "yellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)

(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%Y-%m-%d" (current-time)) " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . my-face-f-2)
            ))))

;; dired + sorter 時に ls の -h オプションを付加する
(defadvice dired-sort-other
  (around dired-sort-other-h activate)
  (ad-set-arg 0 (concat (ad-get-arg 0) "h"))
  ad-do-it
  (setq dired-actual-switches (dired-replace-in-string "h" "" dired-actual-switches)))


(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
