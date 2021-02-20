; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

; This is only needed once, near the top of the file
(eval-when-compile
  ; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))


; General

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(windmove-default-keybindings)
(display-time-mode 1)

; Theme
(use-package zenburn
  :requires zenburn)
(load-theme 'zenburn t)


; Keybindings

(global-set-key (kbd "<M-right>") (kbd "C-x 5 o"))


; Download Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))

; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ; custom-set-variables was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
 '(evil-want-fine-undo t)
 '(package-selected-packages
   (quote
    (helm company cider markdown-toc zenburn-theme evil-surround evil))))
(custom-set-faces
 ; custom-set-faces was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
 )

; evil plugins
(unless (package-installed-p 'evil-surround)
    (package-install 'evil-surround))


(require 'evil-surround)
(global-evil-surround-mode 1)

; Markdown

(use-package markdown-mode
	     :requires markdown-mode
	     :demand t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	       :init (setq markdown-command "multimarkdown"))
(setq markdown-fontify-code-blocks-natively t)

; Racket
(use-package racket-mode
	:requires racket-mode)
;(require 'racket-mode)
;(setq racket-racket-program "/usr/bin/racket")

; Straight

(defvar bootstrap-version)
(let ((bootstrap-file
	       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
            (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
          (with-current-buffer
	            (url-retrieve-synchronously
		               "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
			                'silent 'inhibit-cookies)
		          (goto-char (point-max))
			        (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))

; helm
(straight-use-package 'helm)

(global-set-key (kbd "M-l") 'helm-buffers-list)

; autocomplete
;(use-package auto-complete
;  :ensure auto-complete)
(ac-config-default)

; Haskell mode
(setq haskell-program-name "/usr/bin/ghci")

; i3-mode

;(require 'i3)
;(require 'i3-integration)
;i3-one-window-per-frame-mode-on)

; python autocomplete

(use-package epc
  :requires epc)
(use-package auto-complete
  :requires auto-complete)
(use-package jedi
  :requires jedi)

(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)

; neotree 
(dolist (neotree '(use-package))
   (unless (package-installed-p neotree)
       (package-install neotree)))

(global-set-key [f8] 'neotree-toggle)
