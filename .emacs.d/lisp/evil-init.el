;;; evil-init --- My Evil settings
;;; Commentary:
;;; Code:
(evil-mode 1)
(global-evil-surround-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(define-key evil-normal-state-map (kbd "C-]")
  (lambda () (interactive)
    (if (bound-and-true-p c++-mode)
        'rtags-find-symbol-at-point
      'evil-jump-to-tag)))

(define-key evil-normal-state-map (kbd "gs") 'ff-find-other-file)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "f" 'fzf
  "b" 'switch-to-buffer
  "rs" 'rtags-find-symbol-at-point
  "rr" 'rtags-find-references-at-point
  "rfs" 'rtags-find-symbol
  "rfr" 'rtags-find-references
  "ri" 'rtags-symbol-info
  "wt" 'whitespace-mode
  "wo" 'whitespace-toggle-options)

(evil-ex-define-cmd "BD" 'kill-this-buffer)

(provide 'evil-init)
;;; evil-init.el ends here
