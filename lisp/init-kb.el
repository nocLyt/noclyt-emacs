;; Key Bindings
;; It should be after load evil mode. 
;; reference:
;; - https://github.com/ramsayleung/emacs.d/blob/f17d9144b23872f5ceca3c8eb2b181bdd09abb43/lisp/init-keybindings.el


(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (general-auto-unbind-keys)
  (defvar ty/prime-leader-key "SPC")
  ;;	    (defver ty/prime-local-leader-key ".")  ;; set it later
  (general-define-key :states 'motion
		      :prefix ty/prime-leader-key
		      "SPC" 'counsel-M-x
				;;;;;;;;;;;;;;;;;;;; FILES
		      "f" '(:ignore t :which-key "files")
		      "f f" 'counsel-find-file
		      "f e" '(:ignore t :which-key "dot files")
		      "f e d" 'my-open-init-file
				;;;;;;;;;;;;;;;;;;;; BUFFERS
		      "b" '(:ignore t :which-key "buffers")
		      "b b" 'ivy-switch-buffer
				;;;;;;;;;;;;;;;;;;;; PROJECT
		      "p" '(:keymap projectile-command-map :wk "projectile prefix") ;; reference: general.el doc
				;;;;;;;;;;;;;;;;;;;; GOTO
		      ;; NOTE: goto should be only for program-mode, so it is better to move into local-leader-key later
		      "g" '(:ignore t :wk "goto prefix")
		      "g g" 'lsp-ui-peek-find-definitions
		      "g G" 'xref-find-definitions
		      "g r" 'lsp-ui-peek-find-references
		      "g R" 'xref-find-references  ;; it is bound to M-?
		      "g i" 'lsp-ui-imenu
		      "g I" 'imenu
		      "g h" 'ty/ccls-hierarchy-based
		      "g H" 'ty/ccls-hierarchy-derived
				;;;;;;;;;;;;;;;;;;; JUMP
		      "j" '(:ignore t :wk "jump prefix")
		      "j j" 'avy-goto-char  ;; input one char and jump
		      "j k" 'avy-goto-char-2 ;; input two chars and jump
		      "j l" 'avy-goto-line  
		      "j w" 'avy-goto-word-1  ;; input one char at word start and jump
		      "j e" 'avy-goto-word-0  ;; no input and jump
			        ;;;;;;;;;;;;;;;;;;; SEARCH
		      "s" '(:ignore t :wk "search prefix")
		      "s s" 'counsel-git-grep
			        ;;;;;;;;;;;;;;;;;;; MAGIT
		      "h" '(:ignore t :wk "magit prefix")
		      "h h" 'magit-status
		      
				;;; temporary bind
		      "v" 'er/expand-region
		      "c" 'er/contract-region
		      "o" 'other-window
		      )
  ;; KEYBIND to motion mode without leader keys
  (general-define-key :states 'motion
		      "." 'repeat
		      ";" 'comment-line)
  )


(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)

(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)

(provide 'init-kb)



;;;;
;; candidate to bind
;; counsel-git : open file in git repo
;; counsel-git-grep : Grep for a string in the current Git repository.
;; counsel-rg :  Grep for a string in the current directory using ‘rg’.
;; counsel-file-jump : Jump to a file below the current directory. List all files within the current directory or any of its sub-directories.
;; counsel-descbinds : Show all key-binds (key, commend)

