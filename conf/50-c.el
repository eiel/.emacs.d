(defun c-mode-hooked-indent ()
  "indent config. hooked c-mode"
  (c-toggle-hungry-state 1)
  (setq c-basic-offset 4 indent-tabs-mode nil))
(add-hook 'c-mode-hook 'c-mode-hooked-indent)

(require 'flymake)
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)
