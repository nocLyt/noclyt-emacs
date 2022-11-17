
;; NOTE:
;; -----The reason I don't use flymake.
;; lsp doens't support flymake very well. Although I set `flymake-no-changes-timeout' to 1.0s but it doesn't work
;; I set flymake before.
;; (setq flymake-no-changes-timeout nil) ;; delay to check syntax
;; (setq lsp-idle-delay 1.0)
;; ------


;;;;; Install packages
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 ;; (c-mode-hook . lsp)  ;; set on ccls-mode
	 ;; (c++-mode-hook . lsp-deferred) ;; set on ccls
         (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp
  :config
  (setq lsp-prefer-capf t)
  (setq lsp-prefer-flymake nil)  ;; disable flymake
  (setq lsp-diagnostics--flycheck-enabled t)  ;; enable flycheck
  (setq lsp-diagnostic-clean-after-change t)
  (setq flycheck-check-syntax-automatically '(save idle-buffer-switch mode-enabled)) ;; Don't do check when buffer change
  ;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))  ;; you might want to disable checker
  )
;; check more variable to adjust idle
;; var: lsp-idle-delay

;; set flycheck
(use-package flycheck
  :ensure t
;;  :init (global-flycheck-mode)
  :config
  (global-flycheck-mode t)
  (setq flycheck-emacs-lisp-load-path 'inherit)  ;; Fix check error for elisp https://github.com/flycheck/flycheck/issues/1559
  ;; TODO: maybe only check for programming mode
)



(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.4)
  :commands company)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list) ;; test it late

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp)))
  :config
  ;; NOTE: update it for new device
  (setq ccls-executable "/usr/local/bin/ccls")
  (setq ccls-sem-highlight-method 'overlay)  ;;
  (ccls-use-default-rainbow-sem-highlight)
  )


;;;;; ------------ Settings
(setq lsp-file-watch-threshold 10000)
(setq lsp-enable-file-watchers t)  ;; move it to .dir-locals file later
(setq lsp-lens-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)  ;; disable cursor hover (keep mouse hover)
(setq lsp-ui-doc-show-with-mouse nil)  ;; disable mouse hover (keep cursor hover)
(setq lsp-ui-doc-enable nil) ;; disable all
;; (setq lsp-ui-sideline-show-hover t)  ;; ui sideline
(setq lsp-ui-sideline-show-code-actions t)  ;; ui sideline
;; (setq lsp-completion-provider :none) ?


;;;; New Functions 

;;; ccls Recommended helper functions
(defun ccls/callee () (interactive) (lsp-ui-peek-find-custom "$ccls/call" '(:callee t)))
(defun ccls/caller () (interactive) (lsp-ui-peek-find-custom "$ccls/call"))
(defun ccls/vars (kind) (lsp-ui-peek-find-custom "$ccls/vars" `(:kind ,kind)))
(defun ccls/base (levels) (lsp-ui-peek-find-custom "$ccls/inheritance" `(:levels ,levels)))
(defun ccls/derived (levels) (lsp-ui-peek-find-custom "$ccls/inheritance" `(:levels ,levels :derived t)))
(defun ccls/member (kind) (interactive) (lsp-ui-peek-find-custom "$ccls/member" `(:kind ,kind)))

;; References w/ Role::Role
(defun ccls/references-read () (interactive)
  (lsp-ui-peek-find-custom "textDocument/references"
    (plist-put (lsp--text-document-position-params) :role 8)))

;; References w/ Role::Write
(defun ccls/references-write ()
  (interactive)
  (lsp-ui-peek-find-custom "textDocument/references"
   (plist-put (lsp--text-document-position-params) :role 16)))

;; References w/ Role::Dynamic bit (macro expansions)
(defun ccls/references-macro () (interactive)
  (lsp-ui-peek-find-custom "textDocument/references"
   (plist-put (lsp--text-document-position-params) :role 64)))

;; References w/o Role::Call bit (e.g. where functions are taken addresses)
(defun ccls/references-not-call () (interactive)
  (lsp-ui-peek-find-custom "textDocument/references"
   (plist-put (lsp--text-document-position-params) :excludeRole 32)))

;; ccls/vars ccls/base ccls/derived ccls/members have a parameter while others are interactive.
;; (ccls/base 1) direct bases
;; (ccls/derived 1) direct derived
;; (ccls/member 2) => 2 (Type) => nested classes / types in a namespace
;; (ccls/member 3) => 3 (Func) => member functions / functions in a namespace
;; (ccls/member 0) => member variables / variables in a namespace
;; (ccls/vars 1) => field
;; (ccls/vars 2) => local variable
;; (ccls/vars 3) => field or local variable. 3 = 1 | 2
;; (ccls/vars 4) => parameter

;; References whose filenames are under this project
;; (lsp-ui-peek-find-references nil (list :folders (vector (projectile-project-root))))

;;; ccls related
(defun ty/ccls-hierarchy-derived ()
  "Find all derived hierarchy sub classes/functions"
  (interactive)
  (ccls-inheritance-hierarchy t))

(defun ty/ccls-hierarchy-based ()
  "Find all based hierarchy parents classes/functions"
  (interactive)
  (ccls-inheritance-hierarchy nil))

(defun ty/ccls-navigate-down ()
  "nativegate to DOWN"
  (interactive)
  (ccls-navigate "D"))

(defun ty/ccls-navigate-up ()
  "nativegate to UP"
  (interactive)
  (ccls-navigate "U"))

(defun ty/ccls-navigate-right ()
  "nativegate to RIGHT"
  (interactive)
  (ccls-navigate "R"))

(defun ty/ccls-navigate-left ()
  "nativegate to LEFT"
  (interactive)
  (ccls-navigate "L"))

(defun ty/ccls-caller-hierarchy ()
  "caller hierarchy"
  (interactive)
  (ccls-call-hierarchy nil))

(defun ty/ccls-callee-hierarchy ()
  "callee hierarchy"
  (interactive)
  (ccls-call-hierarchy t))




(provide 'init-lsp-plus-backends)
