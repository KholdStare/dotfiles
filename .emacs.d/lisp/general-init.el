(tool-bar-mode -1)
(when window-system
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

(provide 'general-init)
