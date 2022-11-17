;; Init completion related

;; reference:
;; https://github.com/abo-abo/swiper

(use-package counsel
  :ensure t)


;; Replace isearch
(use-package swiper
  :ensure t)

(use-package smex
  :ensure t)


(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :config(progn
	   (setq ivy-use-virtual-buffers t)
	   (setq ivy-height 8)
	   (setq ivy-use-selectable-prompt t)      ;;  把输入框的内容可以当做一个选项
	   ;; Number of result lines to display, set height as width-body-height/2
	   (setq ivy-count-format "(%d/%d) ")

	   ;; add actions to open file with root
	   )
  )

;; customize acitions to rename/delete and root-open files.
(ivy-set-actions
 'counsel-find-file
 '(("d" delete-file "delete")
   ("r" rename-file "rename")
   ("x" counsel-find-file-as-root "open as root")))


(provide 'init-ivy)
