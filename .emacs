(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


;js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;(add-to-list 'load-path "~/path-to/auto-complete")
; Load the default configuration
;(require 'auto-complete-config)
; Make sure we can find the dictionaries
;(add-to-list 'ac-dictionary-directories "~/emacs/auto-complete/dict")
; Use dictionaries by default
;(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
;(ac-set-trigger-key "TAB")
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

; yasnippet
;(add-to-list 'load-path
;              "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)

;(autoload 'smart-tabs-mode "smart-tabs-mode"
;    "Intelligently indent with tabs, align with spaces!")
;(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;(autoload 'smart-tabs-advice "smart-tabs-mode")
;(smart-tabs-advice js2-indent-line js2-basic-offset)

;; to setup tabs
;(setq tab-always-indent 'complete)
;(add-to-list 'completion-styles 'initials t)
(setq-default indent-tabs-mode nil)

;(setq-default tab-width 4)

;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))


;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;show line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

(load-theme 'tango-dark t)
(set-face-attribute 'default nil :height 100)

(require 'twittering-mode)
(setq twittering-use-master-password t)

(global-set-key (kbd "C-c C-c") 'hs-toggle-hiding)

(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-temp-buffer
      (insert-file-contents file)
      (buffer-string)))

;; jabber
;(add-to-list 'load-path "emacs-jabber")
;; For 0.7.90 and above:
(require 'jabber-autoloads)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jabber-account-list (quote (("mariano.benedettini@surhive.com" (:network-server . "chat.surhive.com") (:connection-type . ssl)))))
 '(jabber-auto-reconnect t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jabber-chat-prompt-foreign ((t (:foreground "orange" :weight normal))))
 '(jabber-chat-prompt-local ((t (:foreground "sky blue" :weight normal))))
 '(jabber-chat-prompt-system ((t (:foreground "medium spring green" :weight normal))))
 '(jabber-roster-user-online ((t (:foreground "deep sky blue" :slant normal :weight normal)))))

(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
(replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string))
)

(defun surhive-conectar ()
  (interactive)
  (setq jpassword (trim-string (file-string "~/surhive-jabber-password")))
  (jabber-connect "mariano.benedettini" "surhive.com" "mariano" nil jpassword "chat.surhive.com" nil 'ssl)
)
