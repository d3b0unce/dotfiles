(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)

(load-theme 'wombat)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(set-default 'indicate-empty-lines t)

(setq visible-bell 1)

(custom-set-variables
 '(org-export-backends (quote (ascii html icalendar latex md odt org)))
 '(package-selected-packages (quote (ox-gfm ace-window))))

(custom-set-faces)

(require 'org)
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

