;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ben Attwood"
      user-mail-address "bendattwood@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;          C          ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Requires clangd installed on system. It's in the clang package on Arch.
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(remove-hook 'c-mode-common-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;       Themes        ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq doom-theme 'doom-gruvbox-light)
;; (setq doom-theme 'doom-horizon)
;; (setq doom-theme 'doom-manegarm
;;       doom-manegarm-darker-background t)
;; (setq doom-theme 'doom-oceanic-next)
;; (setq doom-theme 'doom-one)

;; (setq doom-theme 'doom-gruvbox)
(setq doom-theme 'doom-henna)
;; (setq doom-theme 'doom-dark+
;;      doom-dark+-blue-modeline t)



;; (setq doom-theme 'doom-laserwave)
;; Stop the lazerwave mode-line from being bright pink.
;; (after! solaire-mode (set-face-background 'solaire-mode-line-face "teal"))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;     Misc Config     ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; (toggle-frame-maximized)
(setq display-line-numbers-type 'relative)

;; Suppress the security warning when loading previously unused themes.
;; If this doesn't work make sure the variable is NOT set in ~/.doom.d/custom.el
(setq custom-safe-themes t)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;; Key Bindings/Chords ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;


(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.07)
(key-chord-define-global "jk" 'evil-normal-state)
(key-chord-define-global "fd" 'next-multiframe-window)
(key-chord-define-global "kl" 'swiper)

(map! :leader
      :desc "Undo Tree" "u" #'undo-tree-visualize)


;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;     Fly-Check       ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Prevent the flycheck hints for including documentation in elisp files.
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))


;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;      Org-Mode       ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is the directory used for dooms keybindings.
(setq org-directory "~/sync/org/")
(setq org-roam-directory "~/sync/org/roam/")
(setq org-startup-with-inline-images t)
