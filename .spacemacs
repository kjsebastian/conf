;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(defun dotspacemacs/layers ()
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers '(osx
                                       dash
                                       html
                                       (git :variables
                                            git-gutter-use-fringe t
                                            git-magit-status-fullscreen nil)
                                       javascript
                                       colors
                                       auto-completion
                                       better-defaults
                                       (haskell :variables
                                                haskell-enable-shm-support t
                                                haskell-enable-hindent-style "gibiansky")
                                       clojure
                                       scala
                                       org
                                       syntax-checking
                                       markdown
                                       emacs-lisp
                                       version-control
                                       )

   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(yaml-mode
                                      darktooth-theme
                                      gotham-theme
                                      )

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(ghc)


   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))


;; Settings
;; --------
(defun dotspacemacs/init ()
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim

   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner nil
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         darktooth
                         solarized-light
                         )


   ;; Default font. The powerline-offset allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("IosevkaCC"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.7
   ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's active or selected. Transparency can
   ;; be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's inactive or deselected. Transparency
   ;; can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 70
   ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
   ;; overrides the default behavior of Emacs which recenters the point when
   ;; it reaches the top or bottom of the screen
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; Cabal init
  (add-to-list 'exec-path "/Users/kiran/.cabal/bin/"))

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; (setq powerline-default-separator nil)
  (global-company-mode)

  (define-key evil-normal-state-map "H" "^")
  (define-key evil-normal-state-map "L" "$")

  ;; Change window title
  (setq frame-title-format '((:eval default-directory)))

  ;; Company Cycle with TAB
  (define-key company-active-map (kbd "TAB") (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (define-key company-active-map (kbd "<backtab>") (lambda () (interactive) (company-complete-common-or-cycle -1)))

  ;; Select pasted text EVIL
  (define-key evil-normal-state-map (kbd "g p") (kbd "` [ v ` ]"))

  ;; Rainbow css hook
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 )
 ;; '(font-lock-string-face ((t (:foreground "#b8bb26")))))
