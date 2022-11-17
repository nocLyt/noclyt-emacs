;; TODO:
;; [ ] set evil-undo-system ?
;; [ ] set evil-mode-line-format? 


;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Before load



;; Load Evil
;;(require 'evil)
;;(evil-mode 1)



;; try to use use-package evil
(use-package evil
  :ensure t
  :demand t   ;; ?
  :init 
  (setq evil-disable-insert-state-bindings t) ;; Respect emacs key-bindings in insert mode
  (setq evil-move-cursor-back t)   ;; Move back the cursor one position when exiting insert mode
  :config
  (evil-mode 1)
)

(evil-add-command-properties #'lsp-ui-peek-find-definitions :jump t)
(evil-add-command-properties #'lsp-ui-peek-find-references :jump t)
;; maybe add more goto char?
;; template
;; (evil-add-command-properties #' :jump t)


(defvar my-initial-evil-state-setup
  '((minibuffer-inactive-mode . emacs)
    (calendar-mode . emacs)
    (magit-log-edit-mode . emacs)
    (magit-status-mode . emacs)
    (diff-mode . emacs)
    (eshell-mode . emacs)
    (shell-mode . emacs)
    (xref--xref-buffer-mode . emacs)
    (profiler-report-mode . emacs)
    (ivy-occur-mode . emacs)
    (ivy-occur-grep-mode . normal)
    (messages-buffer-mode . normal)
    (lsp-ui-imenu-mode . emacs)
    (eaf-mode . emacs)
    ;; todo: add some ccls mode
    ;;
    (ccls-tree-mode . emacs) ;; It looks like doesn't work
    )
  "Default evil state per major mode.")

(with-eval-after-load 'evil
  ;; initial evil state per major mode
  (dolist (p my-initial-evil-state-setup)
    (evil-set-initial-state (car p) (cdr p)))
  )

(provide 'init-evil)
