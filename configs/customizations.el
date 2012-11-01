;customizations file
;-------------------

;startup msg
(setq inhibit-startup-message t)  
(defun startup-echo-area-message ()
    (concat
     (propertize 
       "welcome back :)"
       'face (list :family "Consolas" :height 130))
   ))

;mac os x option key as meta
(set-keyboard-coding-system nil)

;background color
(setq default-frame-alist
      '((background-color . "#000000")
      (foreground-color . "#969596")))

;shift select up
(if (equal "xterm-256color" (tty-type))
      (define-key input-decode-map "\e[1;2A" [S-up]))

;delete selected text with any key
(delete-selection-mode t)

;freaking whitespaces trail
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;desktop-mode default folder
(setq desktop-path '("~/dev/emacs-sessions/"))
(setq desktop-dirname "~/dev/emacs-sessions/")

;disable menubar/scrollbar/tool-bar
(custom-set-variables
 '(blink-cursor-mode nil)
 '(menu-bar-mode nil)
 '(indent-tabs-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces)

;------------------
;GUI-only  Customizations
;------------------

;face customizations
(if (window-system)
(progn
(global-visual-line-mode)
(put 'upcase-region 'disabled nil)
(global-set-key "\C-cz" 'show-file-name)
(setq transparency-level 80)
;transparency
(set-frame-parameter nil 'alpha transparency-level)
(add-hook 'after-make-frame-functions (lambda (selected-frame) (set-frame-parameter selected-frame 'alpha transparency-level)))
(setq frame-title-format
;file location on statusbar
  '(:eval
    (if buffer-file-name
        (replace-regexp-in-string
         "\\\\" "/"
         (replace-regexp-in-string
          (regexp-quote (getenv "HOME")) "~"
          (convert-standard-filename buffer-file-name)))
      (buffer-name))))
(put 'upcase-region 'disabled nil)
(global-set-key "\C-cz" 'show-file-name)
;font and window customizations
(custom-set-faces
 `(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :foundry "apple" :family "Consolas")))))
(set-frame-width (selected-frame) 130)
(set-frame-height (selected-frame) 40)))

(provide 'customizations)
