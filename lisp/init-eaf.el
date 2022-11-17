;;(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)

;; FIX IT LATER: [local config]

;; Set env path
(setq exec-path (cons
		 "/usr/local/bin"
		 exec-path
		 ))
(setq exec-path (cons
		 "/Users/tili/Library/Python/3.9/bin"
		 exec-path
		 ))


(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  ;;  (defalias 'browse-web #'eaf-open-browser)
  ; eaf-pdf-viewer-keybinding)
  ; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ; (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  ) ;; unbind, see more in the Wiki

(require 'eaf-git)
(require 'eaf-pdf-viewer)
(require 'eaf-demo)

;(require 'eaf-file-sender)
(require 'eaf-rss-reader)
(require 'eaf-terminal)
(require 'eaf-image-viewer)
(require 'eaf-pdf-viewer)
(require 'eaf-browser)
;; (require 'eaf-markdown-previewer)
;; (require 'eaf-file-browser)
;; (require 'eaf-file-manager)
;; (require 'eaf-video-player)
;(require 'eaf-org-previewer)
;(require 'eaf-airshare)
;(require 'eaf-system-monitor)

(provide 'init-eaf)
