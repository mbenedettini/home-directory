;;(disable-theme 'zenburn)
;;(setq prelude-theme 'solarized-dark)

(global-linum-mode 1)
(setq linum-format "%d ")

(require 'font-lock+)

(global-set-key (kbd "C-c C-s") 'magit-status)

;; undo stuff
(global-undo-tree-mode 0)
(global-set-key (kbd "C-x u") 'undo)
(global-set-key (kbd "C-x t") 'undo-tree-visualize)
;;(set-face-attribute 'region nil :background "#666")

;;(set-face-background 'hl-line "#3e4446")
;;(set-face-foreground 'highlight nil)

;; dired reuse buffers
(toggle-diredp-find-file-reuse-dir 1)

;; projectile
(projectile-global-mode)
(setq projectile-switch-project-action 'projectile-dired)

;; disable that motherfucker auto save hook when leaving a buffer
(remove-hook 'focus-out-hook 'prelude-auto-save-command)

;; smart tabs for cperl
(smart-tabs-advice cperl-indent-line cperl-indent-level)

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
