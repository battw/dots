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

;; Auto Gen Stuff


