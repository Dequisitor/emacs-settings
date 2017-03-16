(set-frame-font "Consolas-13")
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default tab-width 4)
(setq tab-width 4)
(setq-default tab-always-indent 'complete)
(setq scroll-step 1)
(global-hl-line-mode 1)
;(setq indent-tabs-mode 1)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(require 'use-package)

(require 'evil)
(evil-mode 1)

(require 'telephone-line)
(setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-erc-modified-channels-segment
                     telephone-line-process-segment))
          (nil    . (telephone-line-minor-mode-segment
                     telephone-line-buffer-segment))))
(setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))

(telephone-line-mode t)

(require 'key-chord)
(key-chord-mode 1)

(global-set-key (kbd "M-r") '(lambda() (interactive) (load-file "~/.emacs")))
(global-set-key (kbd "M-s") '(lambda() (interactive) (find-file "~/.emacs")))
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map ",." 'evil-normal-state)
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "<tab>") 'other-window)
(define-key evil-normal-state-map (kbd "C-l") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'evil-prev-buffer)
(define-key evil-normal-state-map (kbd "C-w") 'evil-delete-buffer)
(define-key evil-normal-state-map (kbd "<up>") 'flycheck-previous-error)
(define-key evil-normal-state-map (kbd "<down>") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

;(require 'all-the-icons)
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'ascii))
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)

(require 'org)
(setq org-log-done t)
(require 'evil-org)

(require 'web-mode)
(setq web-mode-markup-indent-offset 4
	  web-mode-css-indent 4
	  web-mode-code-indent-offset 4)
(setq js-indent-level 4)
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-disabled-checkers '(javascript-jshint))
(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq flycheck-temp-prefix ".flycheck")

;;;whitespace stuff
;(setq show-trailing-whitespace 1)    
(setq-default truncate-lines 1)
(setq whitespace-space-regexp "[^\s]\\( +\\)[^\s]")
(setq whitespace-trailing-regexp "\\(\\(^\\|\t\\) +\\| +$\\)")
(setq whitespace-style (quote (face tabs spaces tab-mark space-mark trailing)))
(setq whitespace-display-mappings '((space-mark 32 [183]) (tab-mark 9 [?\u2502 9])))
;(global-whitespace-mode 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:background "#20201d" :foreground "#20201d"))))
 '(whitespace-tab ((t (:background "#20201d" :foreground "#888888"))))
 '(whitespace-trailing ((t (:background "#20201d" :foreground "#888888")))))

;;; autocomplete
;(ac-config-default)

;;; tern and friends
(add-to-list 'load-path "d:/tern/emacs")
(autoload 'tern-node "tern.el" nil t)
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
;(eval-after-load 'tern
  ;'(progn
	 ;(require 'tern-auto-complete)
	 ;(tern-ac-setup)))

(require 'company)
(company-mode 1)
(add-to-list 'company-backends 'company-tern)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(package-selected-packages
   (quote
	(company-tern company auto-complete zenburn-theme all-the-icons telephone-line smart-mode-line-powerline-theme smart-mode-line neotree material-theme monokai-theme key-chord evil-surround evil-leader org-evil evil-numbers evil ack)))
 '(show-paren-mode t))

(setq custom-safe-themes t)
(load-theme 'base16-atelier-dune)
