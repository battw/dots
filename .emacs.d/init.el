(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "cd7ffd461946d2a644af8013d529870ea0761dccec33ac5c51a7aaeadec861c2" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "eb7be1648009af366d83f855191057bdc09348a2d9353db31da03b1cdec50cc5" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "d3e333eaa461c82a124f7e7a7a9637d56fc3019478becb1847952804ca67743e" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" default)))
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow color-theme-sanity-tomorrow dracula-theme hydra zenburn-theme which-key use-package try racket-mode pdf-tools org-bullets key-chord gruvbox-theme flycheck evil dumb-jump counsel-projectile company-go color-theme auto-package-update ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
