
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl)
(require 'package)

;; General settings
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'general-init)

;; Install/load packages
(require 'package-init)

;; Package settings
(require 'evil-init)
(setq sml/theme 'light-powerline)
(sml/setup)
(load-theme 'wombat t)

;; nlinum
(nlinum-relative-setup-evil)
;; (global-nlinum-relative-mode)

;; Completion settings
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(ido-vertical-mode t)
(global-flycheck-mode)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; auto-indent detection
;; (dtrt-indent-mode 1)

;; Use company-mode in all buffers (more completion)
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)

;; neotree
(global-set-key [f6] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line projectile powerline-evil nlinum-relative neotree ido-vertical-mode ido-ubiquitous fzf flycheck flx-ido evil-surround evil-magit evil-leader dtrt-indent company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
