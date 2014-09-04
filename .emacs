
(add-to-list 'load-path "~/.emacs.d/lisp/")
;(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; starter-kit
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings column-marker jabber js2-mode ac-js2 magit php-mode python-mode guide-key web-mode yaml-mode expand-region dired+ dired-k peep-dired)
  "A list of packages to ensure are installed at launch.")
;; (defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings column-marker))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


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
(setq-default tab-width 4)
(setq c-basic-offset 4)

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

; keybindings
(global-set-key (kbd "C-c C-c") 'hs-toggle-hiding)
(global-set-key (kbd "C-c C--") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-s") 'magit-status)
(global-set-key (kbd "C-c C-i") 'imenu)

;; (require 'magit-commit-training-wheels)
;; (ad-activate 'magit-log-edit-commit)


(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-temp-buffer
      (insert-file-contents file)
      (buffer-string)))

;; jabber
(add-to-list 'load-path "emacs-jabber")
;; For 0.7.90 and above:
;; (require 'jabber-autoloads)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jabber-auto-reconnect t)
 '(jabber-history-enabled t)
 '(magit-item-highlight-face (quote bold))
 '(magit-repo-dirs (quote ("/Volumes/bet3000" "~/work")))
 '(magit-repo-dirs-depth 2)
 '(php-mode-coding-style (quote symfony2))
 '(swbuff-clear-delay 2)
 '(swbuff-display-intermediate-buffers t t)
 '(swbuff-exclude-buffer-regexps (quote ("^ " "*Completions*" "*Messages*" "*scratch"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "PT_Mono"))))
 '(hl-line ((t (:background "black"))))
 '(jabber-chat-prompt-foreign ((t (:foreground "orange" :weight normal))))
 '(jabber-chat-prompt-local ((t (:foreground "sky blue" :weight normal))))
 '(jabber-chat-prompt-system ((t (:foreground "medium spring green" :weight normal))))
 '(jabber-roster-user-online ((t (:foreground "deep sky blue" :slant normal :weight normal))))
 '(magit-diff-add ((t (:inherit diff-added :foreground "green3"))))
 '(magit-diff-del ((t (:inherit diff-removed :background "IndianRed4" :foreground "tomato"))))
 '(magit-item-highlight ((t (:inherit secondary-selection :background "gray19" :foreground "#ffffff")))))

(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
(replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string))
)

(defun surhive-conectar ()
  (interactive)
  (setq jpassword (trim-string (file-string "/Volumes/bet3000/jabber-password")))
  (jabber-connect "mariano.benedettini" "surhive.com" "mariano" nil jpassword "chat.surhive.com" nil 'ssl)
)

(load "php-mode")
;; Better indentation for php-mode
;; (defun clean-php-mode ()
;;   (interactive)
;;   (php-mode)
;;   (setq c-basic-offset 4) ; 2 tabs indenting
;;   (setq indent-tabs-mode nil)
;;   (setq fill-column 80)
;;   (c-set-offset 'case-label '+)
;;   (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
;; (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
;; (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG
;;                                         ; fields and values
;; PHP
;; (defun my-php-mode-common-hook ()
;;   (set-variable 'indent-tabs-mode nil)
;;   (c-set-offset 'class-open 0)
;;   (c-set-offset 'inline-open 0)
;;   (c-set-offset 'substatement-open 0)
;;   (setq c-default-style "bsd"
;;         c-basic-offset 4))
;; (add-hook 'php-mode-hook 'my-php-mode-common-hook)

(add-hook 'php-mode-hook (lambda () (interactive) (column-marker-1 80)))


(load "js2-mode")
;; js2-mode customization
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (interactive) (column-marker-1 80)))
                                
(setq js2-pretty-multiline-declarations t) 

;; ac-js2
(setq ac-js2-evaluate-calls t)


;; perl-mode customization
(add-hook 'perl-mode-hook (lambda () (interactive) (column-marker-1 80)))

(require 'swbuff-x)
(global-set-key (kbd "<s-tab>") 'swbuff-switch-to-next-buffer)
(global-set-key (kbd "<S-s-iso-lefttab>") 'swbuff-switch-to-previous-buffer)


;; imenu-tree
(eval-after-load "tree-widget"
  '(if (boundp 'tree-widget-themes-load-path)
       (add-to-list 'tree-widget-themes-load-path "~/.emacs.d/")))
(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
(autoload 'tags-tree "tags-tree" "TAGS tree" t)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.ph\p\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(add-hook 'web-mode-hook (lambda () (interactive) (column-marker-1 80)))
(eval-after-load 'web-mode '(define-key web-mode-map (kbd "C-c C--") 'web-mode-comment-or-uncomment))

;; (require 'magit-commit-training-wheels)
;; (ad-activate 'magit-log-edit-commit)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; python
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(require 'python-mode)

;; css
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c" ))
(guide-key-mode 1) ; Enable guide-key-mode

;; dired reuse buffers
(toggle-diredp-find-file-reuse-dir 1)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; nvm
(require 'nvm)
(defun do-nvm-use (version)
  (interactive "sVersion: ")
  (nvm-use version)
  (exec-path-from-shell-copy-env "PATH"))
(do-nvm-use "0.10")

;; js-comint
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))))

(require 'js-comint)
(setq inferior-js-program-command "node")


;; tern
(add-to-list 'load-path "/Users/mariano/work/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(projectile-global-mode)

