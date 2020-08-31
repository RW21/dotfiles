
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)


;;;; General

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(show-paren-mode 1)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(windmove-default-keybindings)
(display-time-mode 1)


(load-theme 'zenburn t)


;;;; Keybindings

(global-set-key (kbd "<M-right>") (kbd "C-x 5 o"))

;;;; EVIL

;; Download Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm company cider markdown-toc zenburn-theme evil-surround evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; evil plugins
(unless (package-installed-p 'evil-surround)
    (package-install 'evil-surround))


(require 'evil-surround)
(global-evil-surround-mode 1)



;;;; Markdown

(use-package markdown-mode
	     :demand t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	       :init (setq markdown-command "multimarkdown"))
(setq markdown-fontify-code-blocks-natively t)

;;;; Racket

(require 'racket-mode)
;(setq racket-racket-program "/usr/bin/racket")

;;;; Straight

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

;;;; helm
(straight-use-package 'helm)

(global-set-key (kbd "M-l") 'helm-buffers-list)
