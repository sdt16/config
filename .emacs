

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'browse-kill-ring)
(require 'browse-kill-ring+)
(global-set-key (kbd "C-c k") 'browse-kill-ring)


(require 'color-theme)
(color-theme-initialize)
(load "color-theme-sunburst.el")
(if (eq window-system nil) (color-theme-tm) (color-theme-dark-blue2))
;;(color-theme-dark-font-lock)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(desktop-save-mode 1)

(global-set-key "\r" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

(if (not (boundp 'server-process))
     (server-start))

(global-set-key '[f9] 'compile)
(global-set-key '[f8] '(lambda ()
			 (interactive)
			 (when (file-exists-p "Makefile") (compile "make clean"))))

;; Display the line and column number in the modeline
(setq line-number-mode t)
(setq column-number-mode t)
(line-number-mode t)
(column-number-mode t)

;; syntax highlight everywhere
(global-font-lock-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
