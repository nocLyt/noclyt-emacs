
;; Configure projectile and counsel-projectile


(use-package projectile
  :ensure t
  :init
  ;;(projectile-mode +1)
  :bind (:map projectile-mode-map
              ;; ("s-p" . projectile-command-map) ;; what's super key in modern mac device? 
              ("C-c p" . projectile-command-map))
  :config
  (progn
    ;; (setq projectile-completion-system 'ivy) ;; After install counsel-projectile, we don't need to set completion system
    ))

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode +1))


(provide 'init-projectile)
