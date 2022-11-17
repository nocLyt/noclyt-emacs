
;; diable tool bar
(tool-bar-mode -1)
;; To disable the menu bar, place the following line in your .emacs file:
;; (menu-bar-mode -1)
;; To disable the scrollbar, use the following line:
;; (scroll-bar-mode -1)

;; load theme
;; (load-theme 'doom-solarized-dark t)

;; Run: M-x package-install zenburn-theme
;; https://github.com/bbatsov/zenburn-emacs
(load-theme 'zenburn t)

(use-package all-the-icons
  :ensure t
  :when (display-graphic-p)
  :demand t)


(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-irc nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-gnus nil)
  (doom-modeline-github nil)
  (doom-modeline-persp-name nil)
  (doom-modeline-unicode-fallback t)
  (doom-modeline-enable-word-count nil))


;; Enable sort
(use-package sort-tab
  :load-path "~/.emacs.d/site-lisp/sort-tab"
  :config
  (global-set-key (kbd "s-}") 'sort-tab-select-next-tab)
  (global-set-key (kbd "s-{") 'sort-tab-select-prev-tab)
  ) ;; unbind, see more in the Wiki


(provide 'init-ui)
