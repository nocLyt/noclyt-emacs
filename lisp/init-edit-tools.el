
(electric-pair-mode +1)

;; which-key
(use-package which-key
  :config
  (progn
    (which-key-mode 1)))

(use-package expand-region)

(use-package auto-save
  ;; Repo: https://github.com/manateelazycat/auto-save
  ;; Reference: https://manateelazycat.github.io/emacs/2016/03/16/auto-save.html

  :load-path "~/.emacs.d/site-lisp/auto-save"
  :init
  (setq auto-save-slient t)
  :commands
  (auto-save-enable)
  )



(provide 'init-edit-tools)
