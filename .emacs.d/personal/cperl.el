;; cperl-mode
(setq-default tab-width 4)
(setq c-basic-offset 4)
;;(setq-default indent-tabs-mode t)
(defalias 'perl-mode 'cperl-mode)
(setq cperl-electric-keywords t)
(setq cperl-invalid-face nil)
(add-hook 'cperl-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'cperl-mode-hook (lambda () (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 ;;(cperl-brace-offset                         . 0)
                 ;;(cperl-close-paren-offset                   . -4)
                 ;;(cperl-continued-brace-offset               . 0)
                 ;;(cperl-continued-statement-offset           . 4)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
				 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 ;;(cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)
                 (cperl-indent-subs-specially nil)))
  (cperl-set-style "PDE"))) ;; cperl-mode
