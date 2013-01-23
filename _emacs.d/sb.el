(defface one-key-title
  '((t (:foreground "Gold")))
  "Face for highlighting title."
  :group 'one-key)

(defun one-key-highlight (msg msg-regexp msg-face)
  "Highlight special `MSG' with regular expression `MSG-REGEXP'.
Will highlight this `MSG' with face `MSG-FACE'."
  (with-temp-buffer
    (insert msg)
    (goto-char (point-min))
    (while (re-search-forward msg-regexp nil t)
      (add-text-properties (match-beginning 0)
                           (match-end 0)
                           msg-face))
    (buffer-string)))
(font-family-list)

(defun xxx ()
(interactive)
(insert "xxxxxxxxxxx")
(add-text-properties 0 (max-point) '(face one-key-title))
(buffer-string))




(set-face-attribute 'one-key-title nil
                    :width 'extended
                    :weight 'bold
                    :underline "red")


 
(face-attribute 'bold :weight)




(face-all-attributes  'bold)
(insert (string )) throw
font-lock-keywords
()

(setq font-lock-face-attributes
      ;; FACE FG BG bold italic underline
      '((font-lock-comment-face "Firebrick")
        (font-lock-string-face "blue1" nil nil nil t)
        (font-lock-emphasized-face nil nil t nil nil)
        (font-lock-keyword-face "Purple")
        (font-lock-function-name-face "Blue")
        (font-lock-variable-name-face "DarkGoldenrod")
        (font-lock-type-face "DarkOliveGreen")
        (font-lock-reference-face "CadetBlue")))

 FIXME:xxx 

(font-lock-add-keywords 'lisp-mode
                        '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)
                          ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)))
(setq foo (make-overlay 1 10))
(overlay-start foo)

(overlay-put foo 'face '(face one-key-title))

