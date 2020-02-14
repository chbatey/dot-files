;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!
(setq-default fill-column 120)
(setq doom-theme 'doom-one)
;; (setq doom-font (font-spec :family "Iosevka" :size 16 :adstyle "Regular"))
;; (setq doom-unicode-font (font-spec :family "Noto Sans Mono" :size 16))
(setq doom-themes-treemacs-enable-variable-pitch nil)

;; Enable auto save
(setq auto-save-default t)
(add-hook! '(doom-switch-window-hook
             doom-switch-buffer-hook
             doom-switch-frame-hook) ; frames
  (save-some-buffers t))
(auto-save-visited-mode)

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Christopher Batey"
      user-mail-address "christopher.batey@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-solarized-light)

(setq org-directory "~/Dropbox/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;

(setq projectile-project-search-path '("~/blog/" "~/dev/os/akka/akka-samples/"))
(projectile-add-known-project "~/Dropbox/org")
(projectile-add-known-project "~/dev/os/akka/akka/")
(projectile-add-known-project "~/dev/os/akka/akka-persistence-cassandra/")

(after! projectile
  (setq projectile-project-root-files-bottom-up '(".project")))


;; org mode
;; extra key binds for org mode
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
)

;; org and mu4e create links to emails
(require 'org-mu4e)
(setq org-mu4e-link-query-in-headers-mode nil)
(setq org-capture-templates
    '(("t" "todo" entry (file+headline "~/Dropbox/org/todo.org" "Tasks")
       "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n  link -> %a  \n")))

(def-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
 (setq org-fancy-priorities-list '((?A . "❗")
                                  (?B . "⬆")
                                  (?C . "⬇")
                                  (?D . "☕")
                                  (?1 . "⚡")
                                  (?2 . "⮬")
                                  (?3 . "⮮")
                                  (?4 . "☕")
                                  (?I . "Important"))))

;; sbt/scala/metals
(after! sbt-mode
   ;; use sbt-run-previous-command to re-compile your code after changes
  (map! :map scala-mode-map
        :n "C-x '" #'sbt-run-previous-command
        :n "C-x c" #'sbt-command
        :n "C-x t" #'sbt-test-fuzzy
        :n "C-SPC" #'completion-at-point
        ))

(defun sbt-test-fuzzy ()
  "Enter part of a test name"
  (interactive)
  (sbt-command (concat "testOnly *"  (read-string "Enter test name: ") "*"))
)

(defun scala-setup ()
  (setq tab-witdh 2))

(add-hook 'scala-mode-hook 'scala-setup)

(after! lsp-mode
  (defun lsp-signature-activate ()
    "Activate signature help.
It will show up only if current point has signature help."
    (interactive)
    (setq-local lsp--last-signature nil)
    (setq-local lsp--last-signature-index nil)
    (setq-local lsp--last-signature-buffer nil)
    (add-hook 'lsp-on-idle-hook #'lsp-signature nil t)
    (add-hook 'post-command-hook #'lsp-signature-maybe-stop)
    (lsp-signature-mode t))
        )

;; Fly check error bindings
(map! :leader
      :map (flycheck-mode-map)
      :desc "next error" "e n" #'flycheck-next-error
      :desc "previous error" "e p" #'flycheck-previous-error
      :desc "previous error" "e a" #'lsp-ui-flycheck-list
      :desc "type info with metals" "c h" #'lsp-ui-doc-show
      :desc "remove type info" "c n" #'lsp-ui-doc-hide
 )

;; clear cache after checking out a new branch
(defun +private/projectile-invalidate-cache (&rest _args)
  (projectile-invalidate-cache nil))
(advice-add 'magit-checkout
            :after #'+private/projectile-invalidate-cache)
(advice-add 'magit-branch-and-checkout
            :after #'+private/projectile-invalidate-cache)


;; Treemacs
(after! treemacs
  (setq treemacs-width 50))

(set-email-account! "lb"
                    '(
    (mu4e-sent-folder       . "/lb/sent")
    (mu4e-drafts-folder     . "/lb/drafts")
    (mu4e-trash-folder      . "/lb/trash")
    (mu4e-refile-folder     . "/lb/archive")
    (smtpmail-smtp-user     . "christopher.batey@lightbend.com")
    (smtpmail-smtp-service  . 587)
    (smtpmail-smtp-server   . "smtp.gmail.com")
    (user-mail-address      . "christopher.batey@lightbend.com")
    (mu4e-compose-signature . "---\nChristopher Batey"))
  t)

;; start in full frame mode
(toggle-frame-fullscreen)
