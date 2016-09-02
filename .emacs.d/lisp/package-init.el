;; Settings required before loading packages
(setq evil-want-C-u-scroll t)

;; Package management
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(evil
    evil-surround
    evil-leader
    magit
    evil-magit
    neotree
    projectile
    company
    flycheck
    smart-mode-line
    smart-mode-line-powerline-theme
    nlinum-relative
    ido-ubiquitous
    ido-vertical-mode
    flx-ido
    fzf
    ; dtrt-indent
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

(when (require 'rtags nil 'noerror)
  (require 'company-rtags)
  (require 'flycheck-rtags))

(provide 'package-init)
