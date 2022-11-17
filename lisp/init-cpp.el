;;; CODE:

;; (add-to-list 'c-default-style '(c++-mode . "k&r"))


(c-add-style "ty-c++-style"
	     '(
	       ;; "Allman"
	       "k&r"
	       ;; (indent-tabs-mode . nil)
	       (c-basic-offset . 4)
	       ))

(add-to-list 'c-default-style '(c++-mode . "ty-c++-style"))

(provide 'init-cpp)
