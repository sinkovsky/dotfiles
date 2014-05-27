;; window size

(setq initial-frame-alist 
      '((top . 10) (left . 50)
        (width . 130) (height . 50)))

;; disabling toolbar
(tool-bar-mode -1)

;; smarter autocomplete mode in mini-buffer
(icomplete-mode +1)

;; no tabs for sure
(set-default 'indent-tabs-mode nil)

;; loading MELPA package repo
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; theme
(load-theme 'brin t)

;; adding erlang-mode to path
(add-to-list
 'load-path
 (car (file-expand-wildcards "~/erlang/lib/tools-*/emacs")))

;; adding distel to path
(add-to-list 'load-path "~/devel/dotfiles/elisp/distel/elisp")

;; enabling desktop mode
(desktop-save-mode 1)

;; erlang
(require 'distel)
(distel-setup)

;; git
(require 'magit)
