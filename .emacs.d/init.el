
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
(powerline-default-theme)
(load-theme 'wombat t)

;; nlinum
(nlinum-relative-setup-evil)
;; (global-nlinum-relative-mode)

;; Completion settings
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Use company-mode in all buffers (more completion)
(add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-magit magit evil-surround powerline-evil company airline-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
