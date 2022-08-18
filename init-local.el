(require 'undo-tree)
(global-undo-tree-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . js-jsx-mode))


(provide 'init-local)
