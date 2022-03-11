;; init
(setq inhibit-startup-screen t)

;; toolbar
(tool-bar-mode 0)

;; menubar
(menu-bar-mode 0)

;; c
(setq-default c-basic-offset 8)
(setq-default c-default-style "linux")

;; edit
(setq-default tab-width 8)
(setq-default indent-tabs-mode t)

;; encoding
(set-language-environment "utf-8")

;; frames
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist '(height . 55))

;; resize
(global-set-key (kbd "<M-up>") 'shrink-window)
(global-set-key (kbd "<M-down>") 'enlarge-window)
(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)

;; show line number
(global-linum-mode)

;; package
(require 'package)

;; add repo
(add-to-list 'package-archives
			 '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; package refresh
(unless package-archive-contents
  (package-refresh-contents))

;; package install
(setq package-list '(use-package ggtags solarized-theme))
(dolist (package package-list)
  (unless (package-installed-p package)
	(package-install package)))

;; use ggtags
(use-package ggtags
  :config
  (add-hook 'c-mode-hook
			(lambda ()
			  (ggtags-mode t)))
  (add-hook 'c-mode-common-hook
			(lambda ()
			  (when (derived-mode-p 'c-mode)
				(ggtags-mode t)))))

;; apply dark theme
(load-theme 'solarized-dark t)

;; disable auto backup file
(setq make-backup-files nil)

