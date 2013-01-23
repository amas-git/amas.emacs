(require 'cl)

(defcustom android-logcat-buffer-name "*logcat*"
  "The buffer name of logcat window."
  :type 'string
  :group 'android-logcat)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Faces ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface android-logcat-tag
  '((t (:foreground "Gold")))
  "Face for highlighting title."
  :group 'android-logcat)

(defface android-logcat-critical
  '((t (:foreground "DarkRed")))
  "Face for highlighting keystroke."
  :group 'android-logcat)

(defface android-logcat-keyword
  '((t (:foreground "khaki3")))
  "Face for highlighting prompt."
  :group 'android-logcat)


(defun android-logcat-window-live-p ()
  "Return `non-nil' if `' help window exist.
Otherwise, return nil."
  (and (get-buffer one-key-buffer-name)
       (window-live-p (get-buffer-window (get-buffer one-key-buffer-name)))))


(defun android-logcat-open-window ()
  "Open logcat window"
  ;; Generate buffer information.
  (interactive)
  (unless (get-buffer android-logcat-buffer-name)
    (with-current-buffer (get-buffer-create android-logcat-buffer-name)
      (goto-char (point-min))))
  (pop-to-buffer android-logcat-buffer-name)
  (set-buffer-modified-p nil)
  ;; run logcat command
  (android-logcat)
  )

(defun android-logcat ()
  "Switch to logcat buffer, create it when it doesn't exists yet."
  (interactive)
  (android-start-exclusive-command android-logcat-buffer-name "adb" "logcat"))

(defvar android-exclusive-processes ())
(defun android-start-exclusive-command (name command &rest args)
  (and (not (find (intern name) android-exclusive-processes))
       (set-process-sentinel (apply 'start-process-shell-command name name command args)
                             (lambda (proc msg)
                               (when (memq (process-status proc) '(exit signal))
                                 (setq android-exclusive-processes
                                       (delete (intern (process-name proc)) android-exclusive-processes)))))
       ;; install filter
       (set-process-filter (get-process name) 'android-logcat-filter)
       (setq android-exclusive-processes (cons (intern name) android-exclusive-processes))))

(defun android-logcat-filter (process line)
  "Tail filter called when some output comes."
  ;; (princ
  ;;   (format "Process: %s ---- %s" process line))
  (insert line)
  (add-text-properties 0 (length line) '(face android-logcat-tag))
)


;; (defun android-logcat-highlight (msg-regexp msg-face)
;;   "Highlight special `MSG' with regular expression `MSG-REGEXP'.
;; Will highlight this `MSG' with face `MSG-FACE'."
;;   (with-temp-buffer
;;     (while (re-search-forward msg-regexp nil t)
;;       (add-text-properties (match-beginning 0)
;;                            (match-end 0)
;;                            msg-face))
;;     (buffer-string)))


;; (Defun msg-me (process event)
;;   (princ
;;    (format "Process: %s had the event `%s'" process event)))

;; (set-process-sentinel (get-process "shell") 'msg-me)

;; msg-me

;; (kill-process (get-process "shell"))

;; -| Process: #<process shell> had the event `killed'
;; #<process shell>


;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
   [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-cm" 'replace-ctrlms)
