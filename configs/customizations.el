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

;shift select up
(if (equal "xterm-256color" (tty-type))
      (define-key input-decode-map "\e[1;2A" [S-up]))

;disable menubar/scrollbar/tool-bar
(custom-set-variables
 '(blink-cursor-mode nil)
 '(menu-bar-mode nil)
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

;word wrapping
(global-visual-line-mode)
(custom-set-faces

;file location on statusbar
(setq frame-title-format
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

;transparency
(setq transparency-level 80)
(set-frame-parameter nil 'alpha transparency-level)
(add-hook 'after-make-frame-functions (lambda (selected-frame) (set-frame-parameter selected-frame 'alpha transparency-level)))

;file location on statusbar
(setq frame-title-format
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
 `(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :foundry "apple" :family "Consolas")))))
  (set-frame-width (selected-frame) 130)
  (set-frame-height (selected-frame) 40)))

(provide 'customizations)
