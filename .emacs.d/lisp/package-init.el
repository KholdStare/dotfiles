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
    magit
    evil-magit
    projectile
    company
    powerline
    powerline-evil
    nlinum-relative
    ; airline-themes
    ido-ubiquitous
    ido-vertical-mode
    flx-ido
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

(provide 'package-init)
