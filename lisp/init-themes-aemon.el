;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'modus-vivendi :min-verion " 2" )
(require-package 'modus-themes)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; theme setting for modus
(set-face-attribute 'default nil :height 150)

(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(modus-operandi))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
      ;; TODO find out why it is dark instead of light theme
      ;;(modus-themes-toggle)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;; Toggle between light and dark

;;;(defun light ()
;;;  "Activate a light color theme."
;;;  (interactive)
;;;  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
;;;  (reapply-themes))
;;;
;;;(defun dark ()
;;;  "Activate a dark color theme."
;;;  (interactive)
;;;  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
;;;  (reapply-themes))
;;;
;;;
;;;(when (maybe-require-package 'dimmer)
;;;  (setq-default dimmer-fraction 0.15)
;;;  (add-hook 'after-init-hook 'dimmer-mode)
;;;  (with-eval-after-load 'dimmer
;;;    ;; TODO: file upstream as a PR
;;;    (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all))))
;;;  (with-eval-after-load 'dimmer
;;;    ;; Don't dim in terminal windows. Even with 256 colours it can
;;;    ;; lead to poor contrast.  Better would be to vary dimmer-fraction
;;;    ;; according to frame type.
;;;    (defun sanityinc/display-non-graphic-p ()
;;;      (not (display-graphic-p)))
;;;    (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)))
;;;

(provide 'init-themes-aemon)
;;; init-themes.el ends here
