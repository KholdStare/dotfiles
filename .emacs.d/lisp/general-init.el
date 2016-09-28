(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(menu-bar-mode -1)

(global-linum-mode 1) ; display line numbers
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)

(load-theme 'wombat t)

(setq gc-cons-threshold 20000000) ; reduce garbage collection
(setq redisplay-dont-pause t) ; fast redraw
(setq vc-follow-symlinks t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs-backups")))

(desktop-save-mode 1)

;; indentation defaults
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default py-indent-offset 4)

(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)

  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; truncate, don't wrap by default
(setq-default truncate-lines t)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; Consider .h files c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(provide 'general-init)
