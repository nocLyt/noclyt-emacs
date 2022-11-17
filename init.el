;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;; Reference:
;; Bin Chen: https://github.com/redguardtoo/emacs.d/
;; ramsayleung / emacs.d : https://github.com/ramsayleung/emacs.d/blob/master/init.el

;; Rather than restarting Emacs, you can use ‘M-x eval-buffer’ to evaluate everything
;; or 'M-x load-file'

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Initial Vars
;;;;;;;;;;;;;;;;;;;;;;;;;

(setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))

(setq gc-cons-threshold (* 4 1024 1024 1024))
(setq read-process-output-max (* 2 1024 1024)) ;; 2mb

;; Stop auto save files
(setq make-backup-files nil)

;; Don't promp to ask to load variables
(setq enable-local-variables :safe)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Initial package.el and user-package.el
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up package.el to work with MELPA

;;; Commentary:
;; 

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
             ;; '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu"   . "https://elpa.gnu.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Setup use-package
;; offical doc: https://github.com/redguardtoo/emacs.d/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))  ;;;;;; reference: https://ianyepan.github.io/posts/setting-up-use-package/


;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Load path files
;;;;;;;;;;;;;;;;;;;;;;;;;

;; load my lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Customized Lisp Init Files
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-ui)    ;; UI settings
(require 'init-evil)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-lsp-plus-backends)
(require 'init-cpp)
(require 'init-edit-tools)
(require 'init-git)


;; (require 'init-eaf) ;; FIX IT. Python path issues


;; test new package
;; jump to every where
(use-package avy)


;; test end package
;;;;;;;;;;;;;;;;;;;;;;;

;; put KEY BINDING behind init-evil
(require 'init-kb)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Package
;;;;;;;;;;;;;;;;;;;;;;;;;

;; which-key
(use-package which-key
  :config
  (progn
    (which-key-mode 1)))
	     
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  After Load Packages
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set font size https://www.gnu.org/software/emacs/manual/html_node/emacs/Frame-Parameters.html
(add-to-list 'default-frame-alist '(width  . 140))
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(font . "Source Code Pro-18"))


(defun my-open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))


;;;;;;;;;;;;;;;;;;;;
;;;; test my lisp code

;; Basic Global Key Bind
;; (global-set-key (kbd "<f1>") 'shell)


;; FIX IT LATER
;; It didn't reset color back automatically. We have to list all status color
(setq evil-mode-line-format nil
      ;;evil-insert-state-cursor '(bar "Yellow")
      evil-visual-state-cursor '(box "#F86155"))


;;;;;;;;;;;;;;;;;;;;; END
;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(zenburn-theme which-key use-package smex magit lsp-ui lsp-ivy general flycheck expand-region evil doom-modeline counsel-projectile company ccls avy all-the-icons))
 '(safe-local-variable-values
   '((helm-make-arguments . "-j8")
     (projectile-project-configure-cmd . "cmake -DCMAKE_BUILD_TYPE=Debug -DAL_WITH_TESTS=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..")
     (projectile-project-run-cmd . "../build.sh -t")
     (projectile-project-name . "BidderServer")
     (eval setq projectile-project-test-cmd #'helm-ctest projectile-project-compilation-cmd #'helm-make-projectile projectile-project-compilation-dir "build" helm-make-build-dir
	   (projectile-compilation-dir)
	   helm-ctest-dir
	   (projectile-compilation-dir))))
 '(warning-suppress-log-types '((comp) (comp) (comp) (comp)))
 '(warning-suppress-types '((comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;;; init.el ends here
