

(use-package magit
  :ensure t
  :hook (git-commit-setup . git-commit-turn-on-flyspell)
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch))
  :custom
  (magit-diff-refine-hunk t)
  (magit-diff-paint-whitespace nil)
  (magit-ediff-dwim-show-on-hunks t))

(provide 'init-git)
