(defun my-append-kill-ring-dir-name ()
  (interactive)
  (kill-new (file-name-directory (buffer-file-name (current-buffer)))))
