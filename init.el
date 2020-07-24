(require 'package)

(if (string< emacs-version
         "26.3")
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(defvar my-packages '(ac-cider
                      ac-js2
                      ag
                      atomic-chrome
                      auto-complete
                      beacon
                      browse-kill-ring
                      cider
                      clj-refactor
                      clojure-mode
                      coffee-mode
                      counsel-jq
                      comment-tags
                      darktooth-theme
                      dired-narrow
                      diminish
                      dumb-jump
                      edit-indirect
                      editorconfig
                      elfeed
                      elfeed-goodies
                      enh-ruby-mode
                      erc-image
                      evil
                      evil-escape
                      evil-leader
                      evil-mc
                      evil-numbers
                      evil-surround
                      exec-path-from-shell
                      forge
                      flycheck
                      flycheck-flow
                      hide-mode-line
                      ido-vertical-mode
                      impatient-mode
                      ini-mode
                      ivy counsel swiper
                      json-mode
                      js2-mode
                      js2-refactor
                      js-comint
                      ledger-mode
                      magit
                      markdown-mode
                      package-lint
                      parinfer
                      projectile
                      rainbow-mode
                      rjsx-mode
                      ob-restclient
                      restclient
                      robe
                      sass-mode
                      spacemacs-theme
                      spaceline
                      smex
                      synosaurus
                      tide
                      visual-fill-column
                      web-mode
                      which-key
                      writegood-mode
                      writeroom-mode
                      yaml-mode
                      zenburn-theme))
(package-initialize)
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p))
  (add-to-list 'package-selected-packages p))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends (quote (ascii html icalendar latex md odt org)))
 '(package-selected-packages
   (quote
    (evil erc-image enh-ruby-mode elfeed-goodies elfeed editorconfig edit-indirect dumb-jump diminish dired-narrow darktooth-theme comment-tags counsel-jq coffee-mode clojure-mode clj-refactor cider browse-kill-ring beacon auto-complete atomic-chrome ag ac-js2 ac-cider expand-region ox-gfm ace-window)))
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq gc-cons-threshold 200000000)
(setq make-backup-files nil)


(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq vc-follow-symlinks t)

(setq sentence-end-double-space nil)

(setq confirm-kill-emacs 'y-or-n-p)

(put 'dired-find-alternate-file 'disabled nil)
(setq-default dired-listing-switches "-alh")
(setq dired-recursive-copies 'always)

(global-auto-revert-mode t)

;; disable splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; display current time
(display-time-mode t)

;; enable narrow to region
(put 'narrow-to-region 'disabled nil)

;; remember cursor positions
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; windmove to jump windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; disable bell
(setq visible-bell t)

;; use cursors in eww
(add-hook 'eww-mode-hook 'scroll-lock-mode)


;; ===================================================
;; beacon mode
(beacon-mode 1)

;; which key
(add-hook 'org-mode-hook 'which-key-mode)
(add-hook 'cider-mode-hook 'which-key-mode)


;; PROGRAMMING STUFF
;; autocomplete
(ac-config-default)

;; tab to 2 spaces
(setq-default tab-width 2 indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)

(setq coffee-tab-width 2)

(setq python-indent 2)

(setq css-indent-offset 2)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(setq web-mode-markup-indent-offset 2)


;; syntax check
(add-hook 'after-init-hook #'global-flycheck-mode)

;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; highlight matching parens
(show-paren-mode t)

;; code folding
(add-hook 'prog-mode-hook #'hs-minor-mode)


;; show line nums
(add-hook 'prog-mode-hook '(lambda ()
                           (if (version<= emacs-version "26.0.50")
                                 (linum-mode)
                               (display-line-numbers-mode))))

(display-line-numbers-mode)

;; indent a buffer
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))


;; THEMES
(defun dark-mode ()
  "Default theme and font size.  Pendant: (presentation-mode)."
  (interactive)

  (mapcar 'disable-theme custom-enabled-themes)
  (set-face-attribute 'default nil :height 150)
  ;; Themes
  ;; (set-frame-parameter nil 'background-mode 'dark)

  ;; Dark, High Contrast <- favorite
  (load-theme 'wombat)
  (setq frame-background-mode (quote dark))

  ;; Dark, Low contrast
  ;; (load-theme 'darktooth)
  ;; Dark, Lowest contrast
  ;; (load-theme 'zenburn)
  )


(defun light-mode ()
  "Enables a light theme."
  (interactive)
  (set-face-attribute 'default nil :height 100)
  (mapcar 'disable-theme custom-enabled-themes)
  (load-theme 'spacemacs-light t))

(dark-mode)


;; orgmode templates
(add-to-list 'org-structure-template-alist '("b" "---\ntoc: false\nlayout: post\ndescription: nil\ncategories: []\ntitle: nil\n---\n"))
