;;; darkness-theme.el --- A blueish dark theme

;; URL: http://github.com/opensoko/darkness
;; Package-Version: 20171101
;; Version: 0.0.1

;; The MIT License (MIT)

;; Copyright (c) 2017 Simon Manning

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:
;;
;;
;; Darkness is my effort to make a blueish dark theme
;;
;; Pull requests, and suggestions are most welcome!
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The Darkness theme requires Emacs 24 or later!"))

(deftheme darkness "The Darkness colour theme")

(defgroup darkness nil
  "Darkness theme options. The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom darkness-mode-line-padding 3
  "Amount of padding around the mode-line text. Set to 1 for normal look."
  :type 'number :group 'darkness)

(defcustom darkness-distinct-fringe-background t
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean :group 'darkness)

(defcustom darkness-use-variable-pitch nil
  "Use variable pitch face for some headings and titles."
  :type 'boolean :group 'darkness)

(defcustom darkness-high-contrast-mode-line nil
  "Make the active/inactive mode line stand out more."
  :type 'boolean :group 'darkness)

(defcustom darkness-height-minus-1 0.8
  "Font size -1."
  :type 'number :group 'darkness)

(defcustom darkness-height-plus-1 1.1
  "Font size +1."
  :type 'number :group 'darkness)

(defcustom darkness-height-plus-2 1.15
  "Font size +2."
  :type 'number :group 'darkness)

(defcustom darkness-height-plus-3 1.2
  "Font size +3."
  :type 'number :group 'darkness)

(defcustom darkness-height-plus-4 1.3
  "Font size +4."
  :type 'number :group 'darkness)

(defmacro darkness-with-color-vars (&rest body)
  (declare (indent 0))
  `(let* ((class '((class color) (min-colors 257)))
          ;; Primary colors
          (darkness-yellow           "#E6DB74")
          (darkness-orange           "#ffac4a")
          (darkness-red              "#ff0066")
          (darkness-magenta          "#ff8eff")
          (darkness-violet           "#ab7eff")
          (darkness-blue             "#06d8ff")
          (darkness-cyan             "#53f2dc")
          (darkness-green            "#63de5d")
          (darkness-gray             "#35393b")
          
          ;; Darker and lighter accented colors
          (darkness-yellow-d         "#BEB244")
          (darkness-yellow-l         "#FFF7A8")
          (darkness-orange-d         "#de8f2d")
          (darkness-orange-l         "#ffc260")
          (darkness-red-d            "#F70057")
          (darkness-red-l            "#FE61A0")
          (darkness-magenta-d        "#FF61FF")
          (darkness-magenta-l        "#FFC4FF")
          (darkness-violet-d         "#9257FF")
          (darkness-violet-l         "#C9ACFF")
          (darkness-blue-d           "#40CAE4")
          (darkness-blue-dd          "#0C1528")
          (darkness-blue-l           "#92E7F7")
          (darkness-blue-ll          "#2123CE")
          (darkness-cyan-d           "#00b2ac")
          (darkness-cyan-l           "#BBF7EF")
          (darkness-green-d          "#86C30D")
          (darkness-green-l          "#BBEF53")
          (darkness-gray-ld          "#383c3d")
          (darkness-gray-d           "#35393b")
          (darkness-gray-dd          "#2B2F31")
          (darkness-gray-l           "#515759")
          (darkness-green-plain      "#2AD043")
          (darkness-red-plain        "#FF6159")
          
          ;; Adaptive colors
          (darkness-fg               "#B2B2B2")
          (darkness-bg               "#030F22")
          (darkness-highlight-line   "#424748")
          (darkness-highlight        "#5D6365")
          (darkness-emph             "#ffffff")
          (darkness-comments         "#6A6D70")
          
          ;; Adaptive higher/lower contrast accented colors
          (darkness-fg-hc            "#141414")
          (darkness-fg-lc            "#171A0B")
          
          ;; High contrast colors
          (darkness-yellow-hc        "#FFFACE")
          (darkness-yellow-lc        "#9A8F21")
          (darkness-orange-hc        "#FFBE74")
          (darkness-orange-lc        "#A75B00")
          (darkness-red-hc           "#FEB0CC")
          (darkness-red-lc           "#F20055")
          (darkness-magenta-hc       "#FEC6F9")
          (darkness-magenta-lc       "#F309DF")
          (darkness-violet-hc        "#F0E7FF")
          (darkness-violet-lc        "#7830FC")
          (darkness-blue-hc          "#CAF5FD")
          (darkness-blue-lc          "#1DB4D0")
          (darkness-cyan-hc          "#D3FBF6")
          (darkness-cyan-lc          "#4BBEAE")
          (darkness-green-hc         "#CCF47C")
          (darkness-green-lc         "#63de5d")
          
          ;; customize based face properties
          (s-variable-pitch         (if darkness-use-variable-pitch
                                        'variable-pitch 'default))
          (s-fringe-fg              (if darkness-distinct-fringe-background
                                        darkness-blue-ll darkness-fg))
          (s-fringe-bg              (if darkness-distinct-fringe-background
                                        darkness-blue-dd darkness-bg))
          (s-mode-line-fg           (if darkness-high-contrast-mode-line
                                        darkness-bg darkness-fg))
          (s-mode-line-bg           (if darkness-high-contrast-mode-line
                                        darkness-fg darkness-gray))
          (s-mode-line-buffer-id-fg (if darkness-high-contrast-mode-line
                                        'unspecified darkness-green-lc))
          (s-mode-line-inactive-fg  (if darkness-high-contrast-mode-line
                                        darkness-fg darkness-comments))
          (s-mode-line-inactive-bg  (if darkness-high-contrast-mode-line
                                        darkness-blue-dd darkness-blue-dd))
          (s-mode-line-inactive-bc  (if darkness-high-contrast-mode-line
                                        darkness-fg darkness-gray))

          ;; Definitions for terminals that do not support 256 colors
          (terminal-class                    '((class color) (min-colors 89)))
          ;; Primary colors
          (terminal-darkness-yellow           "#CDC673")
          (terminal-darkness-orange           "#FF8C00")
          (terminal-darkness-red              "#FF1493")
          (terminal-darkness-magenta          "#D700D7")
          (terminal-darkness-violet           "#AF87FF")
          (terminal-darkness-blue             "#5FD7FF")
          (terminal-darkness-cyan             "#5FFFFF")
          (terminal-darkness-green            "#87D700")
          (terminal-darkness-gray             "#3D3D3D")
          
          ;; Darker and lighter accented colors
          (terminal-darkness-yellow-d         "#878700")
          (terminal-darkness-yellow-l         "#FFFF87")
          (terminal-darkness-orange-d         "#AF5F00")
          (terminal-darkness-orange-l         "#FFAF5F")
          (terminal-darkness-red-d            "#870000")
          (terminal-darkness-red-l            "#FF5F87")
          (terminal-darkness-magenta-d        "#AF0087")
          (terminal-darkness-magenta-l        "#FF87DF")
          (terminal-darkness-violet-d         "#5F00AF")
          (terminal-darkness-violet-l         "#AF87D7")
          (terminal-darkness-blue-d           "#008787")
          (terminal-darkness-blue-l           "#87D7FF")
          (terminal-darkness-cyan-d           "#5FAFAF")
          (terminal-darkness-cyan-l           "#AFFFFF")
          (terminal-darkness-green-d          "#5F8700")
          (terminal-darkness-green-l          "#AFD700")
          (terminal-darkness-gray-d           "#333333")
          (terminal-darkness-gray-l           "#707070")
          
          ;; Adaptive colors
          (terminal-darkness-fg               "#B2B2B2")
          (terminal-darkness-bg               "#030F22")
          (terminal-darkness-highlight-line   "#474747")
          (terminal-darkness-highlight        "#F4A460")
          (terminal-darkness-emph             "#FFFAFA")
          (terminal-darkness-comments         "#8B8878")
          
          ;; Adaptive higher/lower contrast accented colors
          (terminal-darkness-fg-hc            "#171A0B")
          (terminal-darkness-fg-lc            "#141414")
          
          ;; High contrast colors
          (terminal-darkness-yellow-hc        terminal-darkness-yellow-d)
          (terminal-darkness-yellow-lc        terminal-darkness-yellow-l)
          (terminal-darkness-orange-hc        terminal-darkness-orange-d)
          (terminal-darkness-orange-lc        terminal-darkness-orange-l)
          (terminal-darkness-red-hc           terminal-darkness-red-d)
          (terminal-darkness-red-lc           terminal-darkness-red-l)
          (terminal-darkness-magenta-hc       terminal-darkness-magenta-d)
          (terminal-darkness-magenta-lc       terminal-darkness-magenta-l)
          (terminal-darkness-violet-hc        terminal-darkness-violet-d)
          (terminal-darkness-violet-lc        terminal-darkness-violet-l)
          (terminal-darkness-blue-hc          terminal-darkness-blue-d)
          (terminal-darkness-blue-lc          terminal-darkness-blue-l)
          (terminal-darkness-cyan-hc          terminal-darkness-cyan-d)
          (terminal-darkness-cyan-lc          terminal-darkness-cyan-l)
          (terminal-darkness-green-hc         terminal-darkness-green-d)
          (terminal-darkness-green-lc         terminal-darkness-green-l)
          
          ;; customize based face properties
          (terminal-s-variable-pitch         (if darkness-use-variable-pitch
                                                 'variable-pitch 'default))
          (terminal-s-fringe-bg              (if darkness-distinct-fringe-background
                                                 terminal-darkness-gray terminal-darkness-bg))
          (terminal-s-mode-line-fg           (if darkness-high-contrast-mode-line
                                                 terminal-darkness-bg terminal-darkness-fg))
          (terminal-s-mode-line-bg           (if darkness-high-contrast-mode-line
                                                 terminal-darkness-fg terminal-darkness-gray))
          (terminal-s-mode-line-buffer-id-fg (if darkness-high-contrast-mode-line
                                                 'unspecified terminal-darkness-green))
          (terminal-s-mode-line-inactive-fg  (if darkness-high-contrast-mode-line
                                                 terminal-darkness-fg terminal-darkness-comments))
          (terminal-s-mode-line-inactive-bg  (if darkness-high-contrast-mode-line
                                                 terminal-darkness-highlight-line terminal-darkness-bg))
          (terminal-s-mode-line-inactive-bc  (if darkness-high-contrast-mode-line
                                                 terminal-darkness-fg terminal-darkness-gray))
          )
     ,@body))


(darkness-with-color-vars
  ;; Define faces
  (custom-theme-set-faces
   'darkness

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,class (:foreground ,darkness-red :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-red :weight normal))))

   `(font-lock-comment-delimiter-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(font-lock-comment-face
     ((,class (:foreground ,darkness-comments :background nil))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(font-lock-constant-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(font-lock-doc-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(font-lock-function-name-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(font-lock-keyword-face
     ((,class (:foreground ,darkness-red :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-red :weight normal))))

   `(font-lock-negation-char-face
     ((,class (:foreground ,darkness-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold))))

   `(font-lock-preprocessor-face
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(font-lock-regexp-grouping-construct
     ((,class (:foreground ,darkness-yellow :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal))))

   `(font-lock-regexp-grouping-backslash
     ((,class (:foreground ,darkness-violet :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-violet :weight normal))))

   `(font-lock-string-face
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(font-lock-type-face
     ((,class (:foreground ,darkness-blue :italic nil))
      (,terminal-class (:foreground ,terminal-darkness-blue :italic nil))))

   `(font-lock-variable-name-face
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(font-lock-warning-face
     ((,class (:foreground ,darkness-orange :weight bold :italic t :underline t))
      (,terminal-class (:foreground ,terminal-darkness-orange :weight bold :italic t :underline t))))

   `(c-annotation-face
     ((,class (:inherit font-lock-constant-face))
      (,terminal-class (:inherit font-lock-constant-face))))


   ;; general colouring
   '(button ((t (:underline t))))

   `(default
      ((,class (:foreground ,darkness-fg :background ,darkness-bg))
       (,terminal-class (:foreground ,terminal-darkness-fg :background ,terminal-darkness-bg))))

   `(highlight
     ((,class (:foreground ,darkness-bg :background ,darkness-highlight))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-highlight))))

   `(lazy-highlight
     ((,class (:inherit highlight :background ,darkness-comments))
      (,terminal-class (:inherit highlight :background ,terminal-darkness-comments))))

   `(region
     ((,class (:inherit highlight :background ,darkness-highlight))
      (,terminal-class (:inherit highlight :background ,terminal-darkness-highlight))))

   `(secondary-selection
     ((,class (:inherit region :background ,darkness-blue))
      (,terminal-class (:inherit region :background ,terminal-darkness-blue))))

   `(shadow
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(match
     ((,class (:foreground ,darkness-cyan-l :background ,darkness-cyan-d :weight bold))
      (,terminal-class (:background ,terminal-darkness-cyan-l :foreground ,terminal-darkness-cyan-d :weight bold))))

   `(cursor
     ((,class (:foreground ,darkness-bg :background ,darkness-fg :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-fg :inverse-video t))))

   `(mouse
     ((,class (:foreground ,darkness-bg :background ,darkness-fg :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-fg :inverse-video t))))

   `(escape-glyph
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(escape-glyph-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(fringe
     ((,class (:foreground ,s-fringe-fg :background ,s-fringe-bg))
      (,terminal-class (:foreground ,terminal-darkness-fg :background ,terminal-s-fringe-bg))))

   `(link
     ((,class (:foreground ,darkness-blue :underline t :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue :underline t :weight bold))))

   `(link-visited
     ((,class (:foreground ,darkness-violet :underline t :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-violet :underline t :weight normal))))

   `(success
     ((,class (:foreground ,darkness-green ))
      (,terminal-class (:foreground ,terminal-darkness-green ))))

   `(warning
     ((,class (:foreground ,darkness-yellow ))
      (,terminal-class (:foreground ,terminal-darkness-yellow ))))

   `(error
     ((,class (:foreground ,darkness-red-plain))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(eval-sexp-fu-flash
     ((,class (:foreground ,darkness-cyan-l :background ,darkness-cyan-d))
      (,terminal-class (:foreground ,terminal-darkness-cyan-l :background ,terminal-darkness-cyan-d))))

   `(eval-sexp-fu-flash-error
     ((,class (:foreground ,darkness-bg :background ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-red))))

   `(trailing-whitespace
     ((,class (:background ,darkness-red))
      (,terminal-class (:background ,terminal-darkness-red))))

   `(vertical-border
     ((,class (:foreground ,darkness-gray))
      (,terminal-class (:foreground ,terminal-darkness-gray))))

   `(menu
     ((,class (:foreground ,darkness-fg :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-fg :background ,terminal-darkness-bg))))

   `(minibuffer-prompt
     ((,class (:foreground ,darkness-violet-l))
      (,terminal-class (:foreground ,terminal-darkness-violet))))


   ;; menus and mode line
   `(mode-line
     ((,class
       (:inverse-video unspecified :underline unspecified
                       :foreground ,s-mode-line-fg :background,s-mode-line-bg
                       :box (:line-width ,darkness-mode-line-padding :color ,s-mode-line-bg
                                         :style unspecified)))
      (,terminal-class (:inverse-video unspecified :underline unspecified
                                       :foreground ,terminal-s-mode-line-fg
                                       :background ,terminal-s-mode-line-bg))))

   `(mode-line-buffer-id
     ((,class (:foreground ,s-mode-line-buffer-id-fg :weight bold))
      (,terminal-class (:foreground ,terminal-s-mode-line-buffer-id-fg :weight bold))))

   `(mode-line-inactive
     ((,class
       (:inverse-video unspecified :underline unspecified
                       :foreground ,s-mode-line-inactive-fg :background ,s-mode-line-inactive-bg
                       :box (:line-width ,darkness-mode-line-padding :color ,s-mode-line-inactive-bg
                                         :style unspecified)))
      (,terminal-class
       (:inverse-video unspecified :underline unspecified :foreground ,terminal-s-mode-line-inactive-fg
                       :background ,terminal-s-mode-line-inactive-bg))))

   `(header-line
     ((,class (:inverse-video unspecified :underline unspecified :foreground ,darkness-emph
                              :background ,darkness-highlight-line
                              :box (:line-width 1 :color ,darkness-gray :style unspecified)))
      (,terminal-class (:inverse-video unspecified :underline unspecified
                                       :foreground ,terminal-darkness-emph
                                       :background ,terminal-darkness-highlight-line
                                       :box (:line-width 1 :color ,terminal-darkness-gray
                                                         :style unspecified)))))

   ;; cua
   `(cua-global-mark
     ((,class (:background ,darkness-yellow :foreground ,darkness-bg))
      (,terminal-class (:background ,terminal-darkness-yellow :foreground ,terminal-darkness-bg))))

   `(cua-rectangle
     ((,class (:inherit region))
      (,terminal-class (:inherit region))))

   `(cua-rectangle-noselect
     ((,class (:inherit secondary-selection))
      (,terminal-class (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   ;; dired
   `(dired-directory
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(dired-flagged
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(dired-header
     ((,class (:foreground ,darkness-blue :background ,darkness-bg :inherit bold))
      (,terminal-class
       (:foreground ,terminal-darkness-blue :background ,terminal-darkness-bg :inherit bold))))

   `(dired-ignored
     ((,class (:inherit shadow))
      (,terminal-class (:inherit shadow))))

   `(dired-mark
     ((,class (:foreground ,darkness-green :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-green :weight bold))))

   `(dired-marked
     ((,class (:foreground ,darkness-violet :inherit bold))
      (,terminal-class (:foreground ,terminal-darkness-violet :inherit bold))))

   `(dired-perm-write
     ((,class (:foreground ,darkness-fg :underline t))
      (,terminal-class (:foreground ,terminal-darkness-fg :underline t))))

   `(dired-symlink
     ((,class (:foreground ,darkness-cyan :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-cyan :slant italic))))

   `(dired-warning
     ((,class (:foreground ,darkness-orange :underline t))
      (,terminal-class (:foreground ,terminal-darkness-orange :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-blue))
      (,terminal-class
       (:background ,terminal-darkness-highlight-line :foreground ,terminal-darkness-blue))))

   `(dropdown-list-selection-face
     ((,class (:background ,darkness-green :foreground ,darkness-bg))
      (,terminal-class (:background ,terminal-darkness-green :foreground ,terminal-darkness-bg))))

   ;; android mode
   `(android-mode-debug-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(android-mode-error-face
     ((,class (:foreground ,darkness-orange :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-orange :weight bold))))

   `(android-mode-info-face
     ((,class (:foreground ,darkness-fg))
      (,terminal-class (:foreground ,terminal-darkness-fg))))

   `(android-mode-verbose-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(android-mode-warning-face
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,class (:foreground ,darkness-violet :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-violet :weight bold))))

   `(anzu-replace-to
     ((,class (:foreground ,darkness-magenta-l :background ,darkness-violet-d))
      (,terminal-class
       (:foreground ,terminal-darkness-magenta-l :background ,terminal-darkness-violet-d))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,class (:foreground ,darkness-red :weight bold :underline t))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold :underline t))))

   `(clojure-test-error-face
     ((,class (:foreground ,darkness-orange :weight bold :underline t))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold :underline t))))

   `(clojure-test-success-face
     ((,class (:foreground ,darkness-green :weight bold :underline t))
      (,terminal-class (:foreground ,terminal-darkness-green :weight bold :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-emph))
      (,terminal-class
       (:background ,terminal-darkness-highlight-line :foreground ,terminal-darkness-emph))))

   `(company-tooltip-selection
     ((,class (:background ,darkness-cyan-d :foreground ,darkness-cyan-l))
      (,terminal-class
       (:background ,terminal-darkness-cyan-d :foreground ,terminal-darkness-cyan-l))))

   `(company-tooltip-mouse
     ((,class (:background ,darkness-blue :foreground ,darkness-bg))
      (,terminal-class (:background ,terminal-darkness-blue :foreground ,terminal-darkness-bg))))

   `(company-tooltip-common
     ((,class (:foreground ,darkness-violet :underline t))
      (,terminal-class (:foreground ,terminal-darkness-violet :underline t))))

   `(company-tooltip-common-selection
     ((,class (:foreground ,darkness-fg :background ,darkness-cyan-d :underline t))
      (,terminal-class
       (:foreground ,terminal-darkness-fg :background ,terminal-darkness-cyan-d :underline t))))

   `(company-preview
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-emph))
      (,terminal-class
       (:background ,terminal-darkness-highlight-line :foreground ,terminal-darkness-emph))))

   `(company-preview-common
     ((,class (:foreground ,darkness-blue :underline t))
      (,terminal-class (:foreground ,terminal-darkness-blue :underline t))))

   `(company-scrollbar-bg
     ((,class (:background ,darkness-gray))
      (,terminal-class (:background ,terminal-darkness-gray))))

   `(company-scrollbar-fg
     ((,class (:background ,darkness-comments))
      (,terminal-class (:background ,terminal-darkness-comments))))

   `(company-tooltip-annotation
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(company-template-field
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-blue))
      (,terminal-class
       (:background ,terminal-darkness-highlight-line :foreground ,terminal-darkness-blue))))

   ;; compilation
   `(compilation-column-face
     ((,class (:foreground ,darkness-cyan :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-cyan :underline nil))))

   `(compilation-column-number
     ((,class (:inherit font-lock-doc-face :foreground ,darkness-cyan :underline nil))
      (,terminal-class
       (:inherit font-lock-doc-face :foreground ,terminal-darkness-cyan :underline nil))))

   `(compilation-enter-directory-face
     ((,class (:foreground ,darkness-green :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-green :underline nil))))

   `(compilation-error
     ((,class (:inherit error :underline nil))
      (,terminal-class (:inherit error :underline nil))))

   `(compilation-error-face
     ((,class (:foreground ,darkness-red :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-red :underline nil))))

   `(compilation-face
     ((,class (:foreground ,darkness-fg :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-fg :underline nil))))

   `(compilation-info
     ((,class (:foreground ,darkness-comments :underline nil :bold nil))
      (,terminal-class (:foreground ,terminal-darkness-comments :underline nil :bold nil))))

   `(compilation-info-face
     ((,class (:foreground ,darkness-blue :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-blue :underline nil))))

   `(compilation-leave-directory-face
     ((,class (:foreground ,darkness-green :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-green :underline nil))))

   `(compilation-line-face
     ((,class (:foreground ,darkness-green :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-green :underline nil))))

   `(compilation-line-number
     ((,class (:foreground ,darkness-green :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-green :underline nil))))

   `(compilation-warning
     ((,class (:inherit warning :underline nil))
      (,terminal-class (:inherit warning :underline nil))))

   `(compilation-warning-face
     ((,class (:foreground ,darkness-yellow :weight normal :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal :underline nil))))

   `(compilation-mode-line-exit
     ((,class (:inherit compilation-info :foreground ,darkness-green :weight bold))
      (,terminal-class (:inherit compilation-info :foreground ,terminal-darkness-green :weight bold))))

   `(compilation-mode-line-fail
     ((,class (:inherit compilation-error :foreground ,darkness-red :weight bold))
      (,terminal-class (:inherit compilation-error :foreground ,terminal-darkness-red :weight bold))))

   `(compilation-mode-line-run
     ((,class (:foreground ,darkness-orange :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-orange :weight bold))))
   
   ;; custom
   `(custom-face-tag
     ((,class (:inherit ,s-variable-pitch :height ,darkness-height-plus-3
                        :foreground ,darkness-violet :weight bold))
      (,terminal-class
       (:inherit ,terminal-s-variable-pitch :height ,darkness-height-plus-3
                 :foreground ,terminal-darkness-violet :weight bold))))

   `(custom-variable-tag
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-cyan :height ,darkness-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-cyan
                                 :height ,darkness-height-plus-3))))

   `(custom-comment-tag
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(custom-group-tag
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-blue :height ,darkness-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-blue
                                 :height ,darkness-height-plus-3))))

   `(custom-group-tag-1
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-red :height ,darkness-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-red
                                 :height ,darkness-height-plus-3))))

   `(custom-state
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   ;; diff
   `(diff-added
     ((,class (:foreground ,darkness-green-plain :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-green :background ,terminal-darkness-bg))))

   `(diff-changed
     ((,class (:foreground ,darkness-blue :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-blue :background ,terminal-darkness-bg))))

   `(diff-removed
     ((,class (:foreground ,darkness-red-plain :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg))))

   `(diff-header
     ((,class (:background ,darkness-bg))
      (,terminal-class (:background ,terminal-darkness-bg))))

   `(diff-file-header
     ((,class (:background ,darkness-bg :foreground ,darkness-fg :weight bold))
      (,terminal-class
       (:background ,terminal-darkness-bg :foreground ,terminal-darkness-fg :weight bold))))

   `(diff-refine-added
     ((,class (:foreground ,darkness-bg :background ,darkness-green-plain))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-green))))

   `(diff-refine-change
     ((,class (:foreground ,darkness-bg :background ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-blue))))

   `(diff-refine-removed
     ((,class (:foreground ,darkness-bg :background ,darkness-red-plain))
      (,terminal-class (:foreground ,terminal-darkness-bg :background ,terminal-darkness-red))))

   ;; diff-hl
   `(diff-hl-change
     ((,class (:background ,darkness-blue-lc :foreground ,darkness-blue-hc))
      (,terminal-class
       (:background ,terminal-darkness-blue-lc :foreground ,terminal-darkness-blue-hc))))

   `(diff-hl-delete
     ((,class (:background ,darkness-red-lc :foreground ,darkness-red-hc))
      (,terminal-class (:background ,terminal-darkness-red-lc :foreground ,terminal-darkness-red-hc))))

   `(diff-hl-insert
     ((,class (:background ,darkness-green-lc :foreground ,darkness-green-hc))
      (,terminal-class
       (:background ,terminal-darkness-green-lc :foreground ,terminal-darkness-green-hc))))

   `(diff-hl-unknown
     ((,class (:background ,darkness-violet-lc :foreground ,darkness-violet-hc))
      (,terminal-class
       (:background ,terminal-darkness-violet-lc :foreground ,terminal-darkness-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,class (:background ,darkness-orange-lc))
      (,terminal-class (:background ,terminal-darkness-orange-lc))))

   `(ediff-fine-diff-B
     ((,class (:background ,darkness-green-lc))
      (,terminal-class (:background ,terminal-darkness-green-lc))))

   `(ediff-fine-diff-C
     ((,class (:background ,darkness-yellow-lc))
      (,terminal-class (:background ,terminal-darkness-yellow-lc))))

   `(ediff-current-diff-C
     ((,class (:background ,darkness-blue-lc))
      (,terminal-class (:background ,terminal-darkness-blue-lc))))

   `(ediff-even-diff-A
     ((,class (:background ,darkness-comments :foreground ,darkness-fg-lc ))
      (,terminal-class
       (:background ,terminal-darkness-comments :foreground ,terminal-darkness-fg-lc ))))

   `(ediff-odd-diff-A
     ((,class (:background ,darkness-comments :foreground ,darkness-fg-hc ))
      (,terminal-class
       (:background ,terminal-darkness-comments :foreground ,terminal-darkness-fg-hc ))))

   `(ediff-even-diff-B
     ((,class (:background ,darkness-comments :foreground ,darkness-fg-hc ))
      (,terminal-class
       (:background ,terminal-darkness-comments :foreground ,terminal-darkness-fg-hc ))))

   `(ediff-odd-diff-B
     ((,class (:background ,darkness-comments :foreground ,darkness-fg-lc ))
      (,terminal-class
       (:background ,terminal-darkness-comments :foreground ,terminal-darkness-fg-lc ))))

   `(ediff-even-diff-C
     ((,class (:background ,darkness-comments :foreground ,darkness-fg ))
      (,terminal-class (:background ,terminal-darkness-comments :foreground ,terminal-darkness-fg ))))

   `(ediff-odd-diff-C
     ((,class (:background ,darkness-comments :foreground ,darkness-bg ))
      (,terminal-class (:background ,terminal-darkness-comments :foreground ,terminal-darkness-bg ))))


   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-red) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,class (:foreground ,darkness-red-hc :background ,darkness-red-lc
                           :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-red) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,terminal-class (:foreground ,terminal-darkness-red-hc :background ,terminal-darkness-red-lc
                                    :weight bold :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-green) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,class (:foreground ,darkness-green-hc :background ,darkness-green-lc))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-green) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,terminal-class (:foreground ,terminal-darkness-green-hc :background ,terminal-darkness-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-yellow)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (,class (:foreground ,darkness-yellow-hc
                           :background ,darkness-yellow-lc :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-yellow)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (,terminal-class (:foreground ,terminal-darkness-yellow-hc
                                    :background ,terminal-darkness-yellow-lc :weight bold
                                    :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-red) :inherit unspecified))
      (,class (:foreground ,darkness-red-hc
                           :background ,darkness-red-lc :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-red) :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkness-red-hc
                                    :background ,terminal-darkness-red-lc :weight bold :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-yellow) :inherit unspecified))
      (,class (:foreground ,darkness-yellow-hc
                           :background ,darkness-yellow-lc :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-yellow) :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkness-yellow-hc
                                    :background ,terminal-darkness-yellow-lc :weight bold
                                    :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-blue) :inherit unspecified))
      (,class (:foreground ,darkness-blue-hc
                           :background ,darkness-blue-lc :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-blue) :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkness-blue-hc
                                    :background ,terminal-darkness-blue-lc
                                    :weight bold :underline t))))

   `(flycheck-fringe-error
     ((,class (:foreground ,darkness-red-hc :background ,darkness-red-lc :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-red-hc
                                    :background ,terminal-darkness-red-lc :weight bold))))

   `(flycheck-fringe-warning
     ((,class (:foreground ,darkness-yellow-hc
                           :background ,darkness-yellow-lc :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow-hc
                                    :background ,terminal-darkness-yellow-lc :weight bold))))

   `(flycheck-fringe-info
     ((,class (:foreground ,darkness-blue-hc
                           :background ,darkness-blue-lc :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue-hc
                                    :background ,terminal-darkness-blue-lc :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-yellow) :inherit unspecified))
      (,class (:foreground ,darkness-yellow :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-yellow) :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkness-red) :inherit unspecified))
      (,class (:foreground ,darkness-red :weight bold :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkness-red) :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,class (:background ,darkness-green :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-green
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter:deleted
     ((,class (:background ,darkness-red :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-red
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter:modified
     ((,class (:background ,darkness-blue :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-blue
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter:unchanged
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,class (:foreground ,darkness-green :inherit bold))
      (,terminal-class (:foreground ,terminal-darkness-green :inherit bold))))

   `(git-gutter-fr:deleted
     ((,class (:foreground ,darkness-red :inherit bold))
      (,terminal-class (:foreground ,terminal-darkness-red :inherit bold))))

   `(git-gutter-fr:modified
     ((,class (:foreground ,darkness-blue :inherit bold))
      (,terminal-class (:foreground ,terminal-darkness-blue :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,class (:background ,darkness-green :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-green
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter+-deleted
     ((,class (:background ,darkness-red
                           :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-red
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter+-modified
     ((,class (:background ,darkness-blue
                           :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-blue
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter+-unchanged
     ((,class (:background ,darkness-highlight-line
                           :foreground ,darkness-bg :inherit bold))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-bg :inherit bold))))

   `(git-gutter-fr+-added
     ((,class (:foreground ,darkness-green :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-green :weight bold))))

   `(git-gutter-fr+-deleted
     ((,class (:foreground ,darkness-red :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold))))

   `(git-gutter-fr+-modified
     ((,class (:foreground ,darkness-blue :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue :weight bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,class (:foreground ,darkness-blue
                           :background ,darkness-highlight-line :inherit bold))
      (,terminal-class (:foreground ,darkness-blue
                                    :background ,terminal-darkness-highlight-line :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(guide-key/key-face
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(guide-key/prefix-command-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))


   ;; hi-lock-mode
   `(hi-yellow
     ((,class (:foreground ,darkness-yellow-lc :background ,darkness-yellow-hc))
      (,terminal-class (:foreground ,terminal-darkness-yellow-lc
                                    :background ,terminal-darkness-yellow-hc))))

   `(hi-pink
     ((,class (:foreground ,darkness-magenta-lc :background ,darkness-magenta-hc))
      (,terminal-class (:foreground ,terminal-darkness-magenta-lc
                                    :background ,terminal-darkness-magenta-hc))))

   `(hi-green
     ((,class (:foreground ,darkness-green-lc :background ,darkness-green-hc))
      (,terminal-class (:foreground ,terminal-darkness-green-lc
                                    :background ,terminal-darkness-green-hc))))

   `(hi-blue
     ((,class (:foreground ,darkness-blue-lc :background ,darkness-blue-hc))
      (,terminal-class (:foreground ,terminal-darkness-blue-lc
                                    :background ,terminal-darkness-blue-hc))))

   `(hi-black-b
     ((,class (:foreground ,darkness-emph :background ,darkness-bg :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-emph
                                    :background ,terminal-darkness-bg :weight bold))))

   `(hi-blue-b
     ((,class (:foreground ,darkness-blue-lc :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue-lc :weight bold))))

   `(hi-green-b
     ((,class (:foreground ,darkness-green-lc :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-green-lc :weight bold))))

   `(hi-red-b
     ((,class (:foreground ,darkness-red :weight bold))))

   `(hi-black-hb
     ((,class (:foreground ,darkness-emph :background ,darkness-bg :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-emph
                                    :background ,terminal-darkness-bg :weight bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(highlight-changes-delete
     ((,class (:foreground ,darkness-red :underline t))
      (,terminal-class (:foreground ,terminal-darkness-red :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,class (:background ,darkness-gray))
      (,terminal-class (:background ,terminal-darkness-gray))))

   `(highlight-indentation-current-column-face
     ((,class (:background ,darkness-gray))
      (,terminal-class (:background ,terminal-darkness-gray))))

   ;; hl-line-mode
   `(hl-line
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   `(hl-line-face
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,class (:foreground ,darkness-yellow :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal))))

   `(ido-only-match
     ((,class (:foreground ,darkness-bg :background ,darkness-yellow :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-bg
                                    :background ,terminal-darkness-yellow :weight normal))))

   `(ido-subdir
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(ido-incomplete-regexp
     ((,class (:foreground ,darkness-red :weight bold ))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold ))))

   `(ido-indicator
     ((,class (:background ,darkness-red :foreground ,darkness-bg :width condensed))
      (,terminal-class (:background ,terminal-darkness-red
                                    :foreground ,terminal-darkness-bg :width condensed))))

   `(ido-virtual
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))


   ;; js2-mode colors
   `(js2-error
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(js2-external-variable
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(js2-function-param
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(js2-instance-member
     ((,class (:foreground ,darkness-magenta))
      (,terminal-class (:foreground ,terminal-darkness-magenta))))

   `(js2-jsdoc-html-tag-delimiter
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(js2-jsdoc-html-tag-name
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(js2-object-property
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(js2-function-call
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(js2-jsdoc-tag
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(js2-jsdoc-type
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(js2-jsdoc-value
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(js2-magic-paren
     ((,class (:underline t)) (,terminal-class (:underline t))))
   
   `(js2-private-function-call
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(js2-private-member
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(js2-warning
     ((,class (:underline ,darkness-orange))
      (,terminal-class (:underline ,terminal-darkness-orange))))


   ;; Emacs native line numbers
   `(line-number
     ((,class (:foreground ,darkness-highlight :background ,s-fringe-bg))
      (,terminal-class (:foreground ,terminal-darkness-comments
                                    :background ,terminal-s-fringe-bg))))
   ;; linum-mode
   `(linum
     ((,class (:foreground ,darkness-highlight :background ,s-fringe-bg))
      (,terminal-class (:foreground ,terminal-darkness-comments :background ,terminal-s-fringe-bg))))


   ;; magit
   ;;
   ;; TODO: Add supports for all magit faces
   ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
   ;;
   `(magit-diff-added
     ((,class (:foreground ,darkness-green-plain :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-green :background ,terminal-darkness-bg))))

   `(magit-diff-added-highlight
     ((,class (:foreground ,darkness-green-plain :background ,darkness-highlight-line))
      (,terminal-class (:foreground =,terminal-darkness-green
                                    :background ,terminal-darkness-highlight-line))))

   `(magit-diff-removed
     ((,class (:foreground ,darkness-red-plain :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg))))

   `(magit-diff-removed-highlight
     ((,class (:foreground ,darkness-red-plain :background ,darkness-highlight-line))
      (,terminal-class (:foreground ,terminal-darkness-red
                                    :background ,terminal-darkness-highlight-line))))

   `(magit-section-title
     ((,class (:foreground ,darkness-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold))))

   `(magit-branch
     ((,class (:foreground ,darkness-orange :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-orange :weight bold))))

   `(magit-cherry-equivalent
     ((,class (:foreground ,darkness-magenta))
      (,terminal-class (:foreground ,terminal-darkness-magenta))))

   `(magit-cherry-unmatched
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(magit-head
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(magit-branch-local
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(magit-branch-remote
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(magit-section-heading
     ((,class (:foreground ,darkness-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold))))

   `(magit-process-ok
     ((,class (:foreground ,darkness-green-plain :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-green :weight bold))))

   `(magit-process-ng
     ((,class (:foreground ,darkness-red-plain :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-red :weight bold))))

   `(magit-item-highlight
     ((,class (:background ,darkness-highlight-line :weight unspecified))
      (,terminal-class (:background ,terminal-darkness-highlight-line :weight unspecified))))

   `(magit-log-author
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(magit-log-graph
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(magit-log-head-label-bisect-bad
     ((,class (:background ,darkness-red-hc :foreground ,darkness-red-lc :box 1))
      (,terminal-class (:background ,terminal-darkness-red-hc
                                    :foreground ,terminal-darkness-red-lc :box 1))))

   `(magit-log-head-label-bisect-good
     ((,class (:background ,darkness-green-hc :foreground ,darkness-green-lc :box 1))
      (,terminal-class (:background ,terminal-darkness-green-hc
                                    :foreground ,terminal-darkness-green-lc :box 1))))

   `(magit-log-head-label-default
     ((,class (:background ,darkness-highlight-line :box 1))
      (,terminal-class (:background ,terminal-darkness-highlight-line :box 1))))

   `(magit-log-head-label-local
     ((,class (:background ,darkness-blue-lc :foreground ,darkness-blue-hc :box 1))
      (,terminal-class (:background ,terminal-darkness-blue-lc
                                    :foreground ,terminal-darkness-blue-hc :box 1))))

   `(magit-log-head-label-patches
     ((,class (:background ,darkness-red-lc :foreground ,darkness-red-hc :box 1))
      (,terminal-class (:background ,terminal-darkness-red-lc
                                    :foreground ,terminal-darkness-red-hc :box 1))))

   `(magit-log-head-label-remote
     ((,class (:background ,darkness-green-lc :foreground ,darkness-green-hc :box 1))
      (,terminal-class (:background ,terminal-darkness-green-lc
                                    :foreground ,terminal-darkness-green-hc :box 1))))

   `(magit-log-head-label-tags
     ((,class (:background ,darkness-yellow-lc
                           :foreground ,darkness-yellow-hc :box 1))
      (,terminal-class (:background ,terminal-darkness-yellow-lc
                                    :foreground ,terminal-darkness-yellow-hc :box 1))))

   `(magit-log-sha1
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(magit-reflog-amend
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))
   `(magit-reflog-rebase
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))
   `(magit-reflog-checkout
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))
   `(magit-reflog-reset
     ((,class (:foreground ,darkness-red-plain))
      (,terminal-class (:foreground ,terminal-darkness-red))))
   `(magit-reflog-commit
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))
   `(magit-reflog-merge
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))
   `(magit-reflog-cherry-pick
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))
   `(magit-reflog-other
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))
   `(magit-reflog-remote
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   ;; man
   `(Man-overstrike
     ((,class (:foreground ,darkness-blue :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue :weight bold))))

   `(Man-reverse
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(Man-underline
     ((,class (:foreground ,darkness-green :underline t))
      (,terminal-class (:foreground ,terminal-darkness-green :underline t))))

   ;; markdown-mode
   `(markdown-header-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(markdown-header-face-1
     ((,class (:inherit markdown-header-face :height ,darkness-height-plus-4))
      (,terminal-class (:inherit markdown-header-face :height ,darkness-height-plus-4))))

   `(markdown-header-face-2
     ((,class (:inherit markdown-header-face :height ,darkness-height-plus-3))
      (,terminal-class (:inherit markdown-header-face :height ,darkness-height-plus-3))))

   `(markdown-header-face-3
     ((,class (:inherit markdown-header-face :height ,darkness-height-plus-2))
      (,terminal-class (:inherit markdown-header-face :height ,darkness-height-plus-2))))

   `(markdown-header-face-4
     ((,class (:inherit markdown-header-face :height ,darkness-height-plus-1))
      (,terminal-class (:inherit markdown-header-face :height ,darkness-height-plus-1))))

   `(markdown-header-face-5
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   `(search-buffers-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-emph :weight bold))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-emph :weight bold))))

   `(search-buffers-header-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-yellow :weight bold))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-yellow :weight bold))))
   
   ;; nav
   `(nav-face-heading
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(nav-face-button-num
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(nav-face-dir
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(nav-face-hdir
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(nav-face-file
     ((,class (:foreground ,darkness-fg))
      (,terminal-class (:foreground ,terminal-darkness-fg))))

   `(nav-face-hfile
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   ;; org-mode
   `(org-agenda-structure
     ((,class (:foreground ,darkness-emph :background ,darkness-highlight-line
                           :weight bold :slant normal :inverse-video nil
                           :height ,darkness-height-plus-1
                           :underline nil :box (:line-width 2 :color ,darkness-bg)))
      (,terminal-class (:foreground ,terminal-darkness-emph
                                    :background ,terminal-darkness-highlight-line
                                    :weight bold :slant normal :inverse-video nil
                                    :height ,darkness-height-plus-1 :underline nil
                                    :box (:line-width 2 :color ,terminal-darkness-bg)))))
   
   `(org-agenda-calendar-event
     ((,class (:foreground ,darkness-emph))
      (,terminal-class (:foreground ,terminal-darkness-emph))))

   `(org-agenda-calendar-sexp
     ((,class (:foreground ,darkness-fg :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-fg :slant italic))))

   `(org-agenda-date
     ((,class (:foreground ,darkness-comments
                           :background ,darkness-bg :weight normal :inverse-video nil
                           :overline nil :slant normal :height 1.0
                           :box (:line-width 2 :color ,darkness-bg)))
      (,terminal-class (:foreground ,terminal-darkness-comments
                                    :background ,terminal-darkness-bg :weight normal
                                    :inverse-video nil :overline nil :slant normal :height 1.0
                                    :box (:line-width 2 :color ,terminal-darkness-bg)))) t)

   `(org-agenda-date-weekend
     ((,class (:inherit org-agenda-date
                        :inverse-video nil :background unspecified :foreground ,darkness-comments
                        :weight unspecified :underline t :overline nil :box unspecified))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video nil :background unspecified
                                 :foreground ,terminal-darkness-comments :weight unspecified
                                 :underline t :overline nil :box unspecified))) t)
   
   `(org-agenda-date-today
     ((,class (:inherit org-agenda-date
                        :inverse-video t :weight bold :underline unspecified
                        :overline nil :box unspecified :foreground ,darkness-blue
                        :background ,darkness-bg))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video t :weight bold :underline unspecified
                                 :overline nil :box unspecified :foreground ,terminal-darkness-blue
                                 :background ,terminal-darkness-bg))) t)

   `(org-agenda-done
     ((,class (:foreground ,darkness-comments :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-comments :slant italic))) t)

   `(org-archived
     ((,class (:foreground ,darkness-comments :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-comments :weight normal))))

   `(org-block
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(org-block-begin-line
     ((,class (:foreground ,darkness-comments :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-comments :slant italic))))

   `(org-checkbox
     ((,class (:background ,darkness-gray :foreground ,darkness-violet :box nil))
      (,terminal-class (:background ,terminal-darkness-gray
                                    :foreground ,terminal-darkness-violet :box nil))))

   `(org-code
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(org-date
     ((,class (:foreground ,darkness-blue :underline t))
      (,terminal-class (:foreground ,terminal-darkness-blue :underline t))))

   `(org-done
     ((,class (:weight bold :foreground ,darkness-green))
      (,terminal-class (:weight bold :foreground ,terminal-darkness-green))))

   `(org-ellipsis
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(org-formula
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(org-headline-done
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(org-hide
     ((,class (:foreground ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-bg))))

   `(org-level-1
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkness-height-plus-4 :foreground ,darkness-orange))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :height ,darkness-height-plus-4
                                 :foreground ,terminal-darkness-orange))))

   `(org-level-2
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkness-height-plus-3 :foreground ,darkness-green))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :height ,darkness-height-plus-3
                                 :foreground ,terminal-darkness-green))))

   `(org-level-3
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkness-height-plus-2 :foreground ,darkness-blue))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :height ,darkness-height-plus-2
                                 :foreground ,terminal-darkness-blue))))

   `(org-level-4
     ((,class (:inherit ,s-variable-pitch :height ,darkness-height-plus-1
                        :foreground ,darkness-yellow))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :height ,darkness-height-plus-1
                                 :foreground ,terminal-darkness-yellow))))

   `(org-level-5
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-cyan))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-cyan))))

   `(org-level-6
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-green))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-green))))

   `(org-level-7
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-red))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-red))))

   `(org-level-8
     ((,class (:inherit ,s-variable-pitch :foreground ,darkness-blue))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :foreground ,terminal-darkness-blue))))

   `(org-link
     ((,class (:foreground ,darkness-yellow :underline t))
      (,terminal-class (:foreground ,terminal-darkness-yellow :underline t))))

   `(org-sexp-date
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(org-scheduled
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(org-scheduled-previously
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(org-scheduled-today
     ((,class (:foreground ,darkness-blue :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-blue :weight normal))))

   `(org-special-keyword
     ((,class (:foreground ,darkness-comments :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-comments :weight bold))))

   `(org-table
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(org-tag
     ((,class (:weight bold))
      (,terminal-class (:weight bold))))

   `(org-time-grid
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(org-todo
     ((,class (:foreground ,darkness-red :weight bold)))
     ((,terminal-class (:foreground ,terminal-darkness-red :weight bold))))

   `(org-upcoming-deadline
     ((,class (:foreground ,darkness-yellow :weight normal :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal :underline nil))))

   `(org-warning
     ((,class (:foreground ,darkness-orange :weight normal :underline nil))
      (,terminal-class (:foreground ,terminal-darkness-orange :weight normal :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,class (:background ,darkness-blue-lc :foreground ,darkness-blue-hc))
      (,terminal-class (:background ,terminal-darkness-blue-lc
                                    :foreground ,terminal-darkness-blue-hc))))

   `(org-habit-clear-future-face
     ((,class (:background ,darkness-blue-lc))
      (,terminal-class (:background ,terminal-darkness-blue-lc))))

   `(org-habit-ready-face
     ((,class (:background ,darkness-green-lc :foreground ,darkness-green))
      (,terminal-class (:background ,terminal-darkness-green-lc
                                    :foreground ,terminal-darkness-green))))

   `(org-habit-ready-future-face
     ((,class (:background ,darkness-green-lc))
      (,terminal-class (:background ,terminal-darkness-green-lc))))

   `(org-habit-alert-face
     ((,class (:background ,darkness-yellow :foreground ,darkness-yellow-lc))
      (,terminal-class (:background ,terminal-darkness-yellow
                                    :foreground ,terminal-darkness-yellow-lc))))

   `(org-habit-alert-future-face
     ((,class (:background ,darkness-yellow-lc))
      (,terminal-class (:background ,terminal-darkness-yellow-lc))))

   `(org-habit-overdue-face
     ((,class (:background ,darkness-red :foreground ,darkness-red-lc))
      (,terminal-class (:background ,terminal-darkness-red
                                    :foreground ,terminal-darkness-red-lc))))

   `(org-habit-overdue-future-face
     ((,class (:background ,darkness-red-lc))
      (,terminal-class (:background ,terminal-darkness-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(org-agenda-restriction-lock
     ((,class (:background ,darkness-yellow))
      (,terminal-class (:background ,terminal-darkness-yellow))))

   `(org-clock-overlay
     ((,class (:background ,darkness-yellow))
      (,terminal-class (:background ,terminal-darkness-yellow))))

   `(org-column
     ((,class (:background ,darkness-highlight-line :strike-through nil :underline nil
                           :slant normal :weight normal :inherit default))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :strike-through nil :underline nil :slant normal
                                    :weight normal :inherit default))))

   `(org-column-title
     ((,class (:background ,darkness-highlight-line :underline t :weight bold))
      (,terminal-class (:background ,terminal-darkness-highlight-line :underline t :weight bold))))
   
   `(org-date-selected
     ((,class (:foreground ,darkness-red :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-red :inverse-video t))))

   `(org-document-info
     ((,class (:foreground ,darkness-fg))
      (,terminal-class (:foreground ,terminal-darkness-fg))))

   `(org-document-title
     ((,class (:foreground ,darkness-emph :weight bold :height ,darkness-height-plus-4))
      (,terminal-class (:foreground ,terminal-darkness-emph :weight bold
                                    :height ,darkness-height-plus-4))))

   `(org-drawer
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(org-footnote
     ((,class (:foreground ,darkness-magenta :underline t))
      (,terminal-class (:foreground ,terminal-darkness-magenta :underline t))))

   `(org-latex-and-export-specials
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(org-mode-line-clock-overrun
     ((,class (:inherit mode-line))
      (,terminal-class (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,class (:inherit org-level-1))
      (,terminal-class (:inherit org-level-1))))

   `(outline-2
     ((,class (:inherit org-level-2))
      (,terminal-class (:inherit org-level-2))))

   `(outline-3
     ((,class (:inherit org-level-3))
      (,terminal-class (:inherit org-level-3))))

   `(outline-4
     ((,class (:inherit org-level-4))
      (,terminal-class (:inherit org-level-4))))

   `(outline-5
     ((,class (:inherit org-level-5))
      (,terminal-class (:inherit org-level-5))))

   `(outline-6
     ((,class (:inherit org-level-6))
      (,terminal-class (:inherit org-level-6))))

   `(outline-7
     ((,class (:inherit org-level-7))
      (,terminal-class (:inherit org-level-7))))

   `(outline-8
     ((,class (:inherit org-level-8))
      (,terminal-class (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,terminal-class (:foreground ,darkness-comments))))

   ;; perspective
   `(persp-selected-face
     ((,class (:foreground ,darkness-violet :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-violet :weight bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,class (:foreground ,darkness-yellow :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal))))

   ;; popup
   `(popup-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-fg))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-fg))))

   `(popup-isearch-match
     ((,class (:background ,darkness-green))
      (,terminal-class (:background ,terminal-darkness-green))))

   `(popup-menu-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-fg))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-fg))))

   `(popup-menu-mouse-face
     ((,class (:background ,darkness-blue :foreground ,darkness-fg))
      (,terminal-class (:background ,terminal-darkness-blue :foreground ,terminal-darkness-fg))))

   `(popup-menu-selection-face
     ((,class (:background ,darkness-magenta :foreground ,darkness-bg))
      (,terminal-class (:background ,terminal-darkness-magenta :foreground ,terminal-darkness-bg))))

   `(popup-scroll-bar-background-face
     ((,class (:background ,darkness-comments))
      (,terminal-class (:background ,terminal-darkness-comments))))

   `(popup-scroll-bar-foreground-face
     ((,class (:background ,darkness-emph))
      (,terminal-class (:background ,terminal-darkness-emph))))

   `(popup-tip-face
     ((,class (:background ,darkness-highlight-line :foreground ,darkness-fg))
      (,terminal-class (:background ,terminal-darkness-highlight-line
                                    :foreground ,terminal-darkness-fg))))


   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(rainbow-delimiters-depth-4-face
     ((,class (:foreground ,darkness-orange))
      (,terminal-class (:foreground ,terminal-darkness-orange))))

   `(rainbow-delimiters-depth-5-face
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(rainbow-delimiters-depth-6-face
     ((,class (:foreground ,darkness-magenta-d))
      (,terminal-class (:foreground ,terminal-darkness-magenta))))

   `(rainbow-delimiters-depth-7-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(rainbow-delimiters-unmatched-face
     ((,class (:foreground ,darkness-fg :background ,darkness-bg :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-fg :background ,terminal-darkness-bg
                                    :inverse-video t))))

   ;; sh-mode
   `(sh-quoted-exec
     ((,class (:foreground ,darkness-violet :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-violet :weight bold))))

   `(sh-escaped-newline
     ((,class (:foreground ,darkness-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold))))

   `(sh-heredoc
     ((,class (:foreground ,darkness-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   `(sp-wrap-overlay-face
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,class (:background ,darkness-highlight-line))
      (,terminal-class (:background ,terminal-darkness-highlight-line))))

   `(sp-show-pair-enclosing
     ((,class (:inherit highlight))
      (,terminal-class (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,class (:background ,darkness-cyan-l :foreground ,darkness-cyan-d
                           :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-green :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,class (:foreground ,darkness-red :background ,darkness-bg
                           :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,class (:foreground ,darkness-cyan-d :background ,darkness-cyan-l
                           :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-cyan-d :background ,terminal-darkness-cyan-l
                                    :weight normal :inverse-video t))))

   `(show-paren-mismatch
     ((,class (:foreground ,darkness-red
                           :background ,darkness-bg :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,class (:foreground ,darkness-green :background ,darkness-bg :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-green :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))

   `(paren-face-mismatch
     ((,class (:foreground ,darkness-red :background ,darkness-bg :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))
   
   `(paren-face-no-match
     ((,class (:foreground ,darkness-red :background ,darkness-bg :weight normal :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-bg
                                    :weight normal :inverse-video t))))

   ;; table
   `(table-cell
     ((,class (:foreground ,darkness-fg :background ,darkness-highlight-line))
      (,terminal-class (:foreground ,terminal-darkness-fg
                                    :background ,terminal-darkness-highlight-line))))

   ;; term
   `(term-color-black
     ((,class (:foreground ,darkness-bg :background ,darkness-highlight-line))
      (,terminal-class (:foreground ,terminal-darkness-bg
                                    :background ,terminal-darkness-highlight-line))))

   `(term-color-red
     ((,class (:foreground ,darkness-red :background ,darkness-red-d))
      (,terminal-class (:foreground ,terminal-darkness-red :background ,terminal-darkness-red-d))))

   `(term-color-green
     ((,class (:foreground ,darkness-green :background ,darkness-green-d))
      (,terminal-class (:foreground ,terminal-darkness-green :background ,terminal-darkness-green-d))))

   `(term-color-yellow
     ((,class (:foreground ,darkness-yellow :background ,darkness-yellow-d))
      (,terminal-class (:foreground ,terminal-darkness-yellow
                                    :background ,terminal-darkness-yellow-d))))

   `(term-color-blue
     ((,class (:foreground ,darkness-blue :background ,darkness-blue-d))
      (,terminal-class (:foreground ,terminal-darkness-blue :background ,terminal-darkness-blue-d))))

   `(term-color-magenta
     ((,class (:foreground ,darkness-magenta :background ,darkness-magenta-d))
      (,terminal-class (:foreground ,terminal-darkness-magenta
                                    :background ,terminal-darkness-magenta-d))))

   `(term-color-cyan
     ((,class (:foreground ,darkness-cyan :background ,darkness-cyan-d))
      (,terminal-class (:foreground ,terminal-darkness-cyan
                                    :background ,terminal-darkness-cyan-d))))

   `(term-color-white
     ((,class (:foreground ,darkness-emph :background ,darkness-fg))
      (,terminal-class (:foreground ,terminal-darkness-emph :background ,terminal-darkness-fg))))

   `(term-default-fg-color
     ((,class (:inherit term-color-white))
      (,terminal-class (:inherit term-color-white))))

   `(term-default-bg-color
     ((,class (:inherit term-color-black))
      (,terminal-class (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,class (:background ,darkness-bg :foreground ,darkness-yellow :inherit ,s-variable-pitch))))

   
   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,class (:foreground ,darkness-comments :background ,darkness-bg))
      (,terminal-class (:foreground ,terminal-darkness-comments :background ,terminal-darkness-bg))))

   `(undo-tree-visualizer-unmodified-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(undo-tree-visualizer-current-face
     ((,class (:foreground ,darkness-blue :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkness-blue :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,class (:foreground ,darkness-emph :background ,darkness-bg :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-emph
                                    :background ,terminal-darkness-bg :weight bold))))

   `(undo-tree-visualizer-register-face
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   ;; volatile highlights
   `(vhl/default-face
     ((,class (:background ,darkness-green-lc :foreground ,darkness-green-hc))
      (,terminal-class (:background ,terminal-darkness-green-lc
                                    :foreground ,terminal-darkness-green-hc))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,class (:foreground ,darkness-red))
      (,terminal-class (:foreground ,terminal-darkness-red))))

   `(web-mode-comment-face
     ((,class (:foreground ,darkness-comments))
      (,terminal-class (:foreground ,terminal-darkness-comments))))

   `(web-mode-constant-face
     ((,class (:foreground ,darkness-blue :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-blue :weight bold))))

   `(web-mode-current-element-highlight-face
     ((,class (:underline unspecified :weight unspecified :background ,darkness-highlight-line))
      (,terminal-class (:underline unspecified :weight unspecified
                                   :background ,terminal-darkness-highlight-line))))

   `(web-mode-css-at-rule-face
     ((,class (:foreground ,darkness-violet :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-violet :slant italic))))

   `(web-mode-css-pseudo-class-face
     ((,class (:foreground ,darkness-green :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-green :slant italic))))

   `(web-mode-doctype-face
     ((,class (:foreground ,darkness-comments :slant italic :weight bold))
      (,terminal-class (:foreground ,terminal-darkness-comments :slant italic :weight bold))))

   `(web-mode-folded-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(web-mode-function-name-face
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(web-mode-html-attr-name-face
     ((,class (:foreground ,darkness-blue :slant normal))
      (,terminal-class (:foreground ,terminal-darkness-blue :slant normal))))

   `(web-mode-html-attr-value-face
     ((,class (:foreground ,darkness-cyan :slant italic))
      (,terminal-class (:foreground ,terminal-darkness-cyan :slant italic))))

   `(web-mode-html-tag-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   `(web-mode-keyword-face
     ((,class (:foreground ,darkness-yellow :weight normal))
      (,terminal-class (:foreground ,terminal-darkness-yellow :weight normal))))

   `(web-mode-preprocessor-face
     ((,class (:foreground ,darkness-yellow :slant normal :weight unspecified))
      (,terminal-class (:foreground ,terminal-darkness-yellow :slant normal :weight unspecified))))

   `(web-mode-string-face
     ((,class (:foreground ,darkness-cyan))
      (,terminal-class (:foreground ,terminal-darkness-cyan))))

   `(web-mode-type-face
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(web-mode-variable-name-face
     ((,class (:foreground ,darkness-blue))
      (,terminal-class (:foreground ,terminal-darkness-blue))))

   `(web-mode-warning-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(web-mode-block-attr-name-face
     ((,class (:inherit web-mode-html-attr-name-face))
      (,terminal-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-block-attr-value-face
     ((,class (:inherit web-mode-html-attr-value-face))
      (,terminal-class (:inherit web-mode-html-attr-value-face))))

   `(web-mode-block-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,class (:inherit font-lock-preprocessor-face))
      (,terminal-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-face
     ((,class (:background unspecified))
      (,terminal-class (:background unspecified))))

   `(web-mode-block-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,class (:box 1 :weight bold))
      (,terminal-class (:box 1 :weight bold))))

   `(web-mode-css-color-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-priority-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,class (:inherit font-lock-variable-name-face))
      (,terminal-class (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,class (:inherit font-lock-keyword-face))
      (,terminal-class (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-json-context-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(web-mode-json-key-face
     ((,class (:foreground ,darkness-violet))
      (,terminal-class (:foreground ,terminal-darkness-violet))))

   `(web-mode-json-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,class (:foreground ,darkness-fg))
      (,terminal-class (:foreground ,terminal-darkness-fg))))

   `(web-mode-part-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,class (:inherit web-mode-block-face))
      (,terminal-class (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,class (:foreground ,darkness-yellow))
      (,terminal-class (:foreground ,terminal-darkness-yellow))))

   `(web-mode-whitespace-face
     ((,class (:background ,darkness-red))
      (,terminal-class (:background ,terminal-darkness-red))))


   ;; whitespace-mode
   `(whitespace-space
     ((,class (:background unspecified :foreground ,darkness-comments
                           :inverse-video unspecified :slant italic))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-comments
                                    :inverse-video unspecified :slant italic))))

   `(whitespace-hspace
     ((,class (:background unspecified :foreground ,darkness-emph :inverse-video unspecified))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-emph
                                    :inverse-video unspecified))))
   
   `(whitespace-tab
     ((,class (:background unspecified :foreground ,darkness-red
                           :inverse-video unspecified :weight bold))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-red
                                    :inverse-video unspecified :weight bold))))

   `(whitespace-newline
     ((,class(:background unspecified :foreground ,darkness-comments :inverse-video unspecified))
      (,terminal-class(:background unspecified :foreground ,terminal-darkness-comments
                                   :inverse-video unspecified))))

   `(whitespace-trailing
     ((,class (:background unspecified :foreground ,darkness-orange-lc :inverse-video t))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-orange-lc
                                    :inverse-video t))))

   `(whitespace-line
     ((,class (:background unspecified :foreground ,darkness-magenta :inverse-video unspecified))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-magenta
                                    :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,class (:background ,darkness-red-lc :foreground unspecified :inverse-video unspecified))
      (,terminal-class (:background ,terminal-darkness-red-lc :foreground unspecified
                                    :inverse-video unspecified))))

   `(whitespace-indentation
     ((,class (:background unspecified :foreground ,darkness-yellow
                           :inverse-video unspecified :weight bold))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-yellow
                                    :inverse-video unspecified :weight bold))))

   `(whitespace-empty
     ((,class (:background unspecified :foreground ,darkness-red-lc :inverse-video t))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-red-lc
                                    :inverse-video t))))

   `(whitespace-space-after-tab
     ((,class (:background unspecified :foreground ,darkness-orange
                           :inverse-video t :weight bold))
      (,terminal-class (:background unspecified :foreground ,terminal-darkness-orange
                                    :inverse-video t :weight bold))))

   ;; which-func-mode
   `(which-func
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green))))

   ;; window-number-mode
   `(window-number-face
     ((,class (:foreground ,darkness-green))
      (,terminal-class (:foreground ,terminal-darkness-green)))))

  (custom-theme-set-variables
   'darkness
   `(ansi-color-names-vector
     [,darkness-bg ,darkness-red ,darkness-green ,darkness-yellow
                   ,darkness-blue ,darkness-magenta ,darkness-cyan ,darkness-fg])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,darkness-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,darkness-magenta ,darkness-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,darkness-highlight-line . 0)
       (,darkness-green-lc . 20) (,darkness-cyan-lc . 30) (,darkness-blue-lc . 50)
       (,darkness-yellow-lc . 60) (,darkness-orange-lc . 70) (,darkness-magenta-lc . 85)
       (,darkness-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,darkness-bg)
   `(pos-tip-background-color ,darkness-yellow)

   ;; vc
   `(vc-annotate-color-map
     '((20 . ,darkness-red)
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . ,darkness-yellow)
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . ,darkness-green)
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . ,darkness-cyan)
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . ,darkness-blue)))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'darkness)

;; Local Variables:
;; no-byte-compile: t
;; fill-column: 95
;; End:

;;; darkness-theme.el ends here
