;; disable whitespace-mode and whitespace-cleanup
(add-hook 'prelude-prog-mode-hook
          (lambda ()
            (prelude-turn-off-whitespace)
            (remove-hook 'before-save-hook 'whitespace-cleanup)) t)

;; For other global settings, just run the appropriate function; all
;; personal/*.el files will be evaluate after prelude-emacs is loaded.

;; disable line highlight
;(global-hl-line-mode -1)

;; make the cursor blinking
(blink-cursor-mode t)

(load-file "/Users/nv/Projects/tools/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/Applications/CoqIdE_8.4.app/Contents/Resources/bin/coqtop")
(setq proof-splash-enable nil)
(setq proof-toolbar-enable nil)

;; disable scroll bars
(scroll-bar-mode -1)
(menu-bar-mode 1)
;(tool-bar-mode 1)

;; maximize on startup
;(set-frame-position (selected-frame) 0 0)
;(set-frame-size (selected-frame) 204 55)

(defun kill-region-or-backward-kill-word (arg)
  "Woo! Kill word a la bash/zsh and preserve it in kill ring! "
  (interactive "p")
  (if mark-active
      (kill-region (point) (mark))
    (backward-kill-word arg)))
(global-set-key "\C-w" 'kill-region-or-backward-kill-word)


;; from http://whattheemacsd.com/key-bindings.el-01.html
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
    (progn
      (linum-mode 1)
      (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun fill-region-width (fill-width)
  "Fills the region with the given width"
  (set-fill-column fill-width)
  (fill-region))

(defun justify-region-80 (&optional len)
  "Justify Text at 80 or len"
  (interactive "p")
  (set-justification-full (point-min) (point-max)))
(global-set-key "\C-q" 'justify-region-80)


(defun toggle-some-personal-preferences (&optional arg)
  "Enable three minor modes for neat text"
  (interactive "p")
  (flyspell-mode 1)
  (turn-on-auto-fill)
;;  (setq auto-fill-mode t)
  (set-fill-column 80)
)

