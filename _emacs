(server-start)
;;------------------------------------------------------------------[ LoadPath ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cscope"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/color-theme"))

;;------------------------------------------------------------------[ Test  ]
;;(require 'idle-highlight-mode)
;;(idle-highlight-mode)
;;------------------------------------------------------------------[ Basic ]
(require 'font-lock)
(require 'linum)
(global-linum-mode 1)
(require 'highlight-cl)
(require 'show-wspace)
(setq-default tab-width 4)
(setq mouse-yank-at-point t)         ; yank at cursor
(setq-default indent-tabs-mode nil)  ; forbide tab
(fset 'yes-or-no-p 'y-or-n-p)        ; shot answer
(setq x-select-enable-clipboard t)   ; 支持emacs和外部程序的粘贴
(setq max-lisp-eval-depth 40000)     ; lisp最大执行深度
(setq mark-ring-max 1024)
(setq undo-outer-limit 5000000)      ; 撤销限制
(setq kill-ring-max 1024)            ; KillRring
(setq ring-bell-function 'ignore)    ; 关闭出错时的提示声
(require 'highlight-current-line)
(highlight-current-line-on t)                            ; 高亮显示当前行
(if (functionp 'tool-bar-mode) (tool-bar-mode nil))      ; 关闭工具栏
(setq-default make-backup-files nil) 

(show-paren-mode)                    ; 高亮匹配的括号
;;------------------------------------------------------------------[ Themes ]
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)
;;(color-theme-classic)
;;(color-theme-charcoal-black)
;;------------------------------------------------------------------[ CCPP   ]
(require 'cc-mode)
(global-set-key (kbd "<f9>") 'compile) 

;;------------------------------------------------------------------[ CCPP   ]
(tool-bar-mode -1)                   ; 隐藏工具栏
;;------------------------------------------------------------------[ Keymap ]
(global-set-key (kbd "M-h") 'backward-char) 
(global-set-key (kbd "M-l") 'forward-char)  
(global-set-key (kbd "M-k") 'previous-line) 
(global-set-key (kbd "M-j") 'next-line) 
(global-set-key (kbd "M-o") 'forward-word) 
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-o") 'open-newline-below)
(global-set-key [(super f12)] 'reload) ;; TODO: miss def
(global-set-key (kbd "M-g")  'goto-line)
(global-set-key "%" 'match-paren)
(global-set-key (kbd "C-l") 'kill-whole-line)
;; (global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<enter>") 'newline-and-indent)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-`") 'browse-kill-ring)
(global-set-key (kbd "M-b") 'blance-frame)
(global-set-key (kbd "<f5>") 'comment-or-uncomment-region+)
;;------------------------------------------------------------------[ OneKey ]
(require 'lazy-set-key)
(require 'one-key)
(lazy-unset-key '("C-d" "<del>" "C-n" "C-f" "M-u" "M-o" "C-p" "C-b" "C-j" "M-SPC" "M-h" "M-d" "M-h" "C-g"))
(defun one-key-menu-delete ()
  "`One-Key' menu for delete operation."
  (interactive)
  (one-key-menu "DELETE" one-key-menu-delete-alist t))
(setq one-key-menu-delete-alist
      '(
        (("d" . "Kill LINE") . kill-whole-line)
        (("M-d" . "Kill LINE") . kill-whole-line)
        (("w" . "Kill current WORD") . kill-symbol)
        (("e" . "Kill to LINE END($)") . kill-line)
        (("m" . "Kill MIDDLE text") . kill-enclosed-text)
        (("s" . "Kill to LINE START(^)") . backward-kill-line)
        (("c" . "Kill COMMENT") . kill-comment)        
        (("f" . "Kill to CHAR") . zap-to-char)
        (("SPC"  . "Kill WHITE SPACE") . thing-paste-whitespace)
        ))
(global-set-key (kbd "M-d") 'one-key-menu-delete)

(setq one-key-menu-goto-alist
'(
  (("l" . "Goto LINE") . goto-line)
  (("M-j" . "Goto last change") . goto-last-change)
  (("j" . "Goto last change") . goto-last-change)
  (("c" . "Goto CHAR") . goto-char)
  (("s" . "Goto START of line") . move-beginning-of-line)
  (("e" . "Goto END of line") . move-end-of-line)
  (("f" . "Goto SYMBOL") . semantic-complete-jump-local)
  (("b" . "Goto BUFFER") . switch-to-buffer)))

(defun one-key-menu-goto ()
  "`One-Key' menu for ."
  (interactive)
  (one-key-menu "GOTO" one-key-menu-goto-alist t))

(global-set-key (kbd "C-j") 'one-key-menu-goto)
;;------------------------------------------------------------------[ CharSet ]
(setq default-buffer-file-coding-system 'utf-8-unix)                ;缓存文件编码
(setq default-file-name-coding-system 'utf-8-unix)                  ;文件名编码
(setq default-keyboard-coding-system 'utf-8-unix)                   ;键盘输入编码
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))     ;进程输出输入编码
(setq default-sendmail-coding-system 'utf-8-unix)                   ;发送邮件编码
(setq default-terminal-coding-system 'utf-8-unix)        


;;------------------------------------------------------------------[ ECB ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ecb"))
;; (require 'ecb)
;; (setq stack-trace-on-error t)

;;------------------------------------------------------------------[ BrowerKillRing ] 
(require 'browse-kill-ring+)

;;------------------------------------------------------------------[ Anything ] 
(require 'anything)
;;(require 'anything-config)
;;------------------------------------------------------------------[ Shell ]
(defun amas-sh-mode-hook () 
  ( message "amas sh-mode-hook triggered!!!")
  (define-key sh-mode-map (kbd "C-<f11>") 'executable-interpret)
  (define-key sh-mode-map (kbd "<f5>") 'comment-or-uncomment-region+))

(add-hook 'sh-mode-hook 'amas-sh-mode-hook)
;;------------------------------------------------------------------[ Erlang ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/erlang"))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)
;;------------------------------------------------------------------[ Erlang.Distel ]
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/distel/elisp"))
;;(require 'distel)
;;(distel-setup)

;; prevent annoying hang-on-compile
;;(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
;;(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
;;(setq erl-nodename-cache 'emacs@localhost)

;;------------------------------------------------------------------[ Erlang.amas ]
(defun amas-erlang-mode-hook () 
  ( message "amas erlang-mode-hook triggered!!!")
  (define-key erlang-mode-map (kbd "<f5>") 'comment-or-uncomment-region+)
  (define-key erlang-mode-map (kbd "C-<f11>") 'erlang-compile))
(add-hook 'erlang-mode-hook 'amas-erlang-mode-hook)

;;------------------------------------------------------------------[ Haskell ]
(load "~/.emacs.d/haskell/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(require 'inf-haskell)

;; (defun unicode-symbol (name)
;;   "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW                                      
;;  or GREATER-THAN into an actual Unicode character code. "
;;   (decode-char 'ucs (case name                                             
;;                       ('left-arrow 8592)
;;                       ('up-arrow 8593)
;;                       ('right-arrow 8594)
;;                       ('down-arrow 8595)                                                
;;                       ('double-vertical-bar #X2551)                  
;;                       ('equal #X003d)
;;                       ('not-equal #X2260)
;;                       ('identical #X2261)
;;                       ('not-identical #X2262)
;;                       ('less-than #X003c)
;;                       ('greater-than #X003e)
;;                       ('less-than-or-equal-to #X2264)
;;                       ('greater-than-or-equal-to #X2265)                        
;;                       ('logical-and #X2227)
;;                       ('logical-or #X2228)
;;                       ('logical-neg #X00AC)                                                  
;;                       ('nil #X2205)
;;                       ('horizontal-ellipsis #X2026)
;;                       ('double-exclamation #X203C)
;;                       ('prime #X2032)
;;                       ('double-prime #X2033)
;;                       ('for-all #X2200)
;;                       ('there-exists #X2203)
;;                       ('element-of #X2208)              
;;                       ('square-root #X221A)
;;                       ('squared #X00B2)
;;                       ('cubed #X00B3)                                            
;;                       ('lambda #X03BB)
;;                       ('alpha #X03B1)
;;                       ('beta #X03B2)
;;                       ('gamma #X03B3)
;;                       ('delta #X03B4))))

;; (defun substitute-pattern-with-unicode (pattern symbol)
;;   "Add a font lock hook to replace the matched part of PATTERN with the                                       
;;      Unicode symbol SYMBOL looked up with UNICODE-SYMBOL."
;;   (interactive)
;;   (font-lock-add-keywords
;;    nil `((,pattern 
;;           (0 (progn (compose-region (match-beginning 1) (match-end 1)
;;                                     ,(unicode-symbol symbol)
;;                                     'decompose-region)
;;                     nil))))))

;; (defun substitute-patterns-with-unicode (patterns)
;;   "Call SUBSTITUTE-PATTERN-WITH-UNICODE repeatedly."
;;   (mapcar #'(lambda (x)
;;               (substitute-pattern-with-unicode (car x)
;;                                                (cdr x)))
;;           patterns))

;; (defun haskell-unicode ()
;;   (interactive)
;;   (substitute-patterns-with-unicode
;;    (list (cons "\\(<-\\)" 'left-arrow)
;;          (cons "\\(->\\)" 'right-arrow)
;;          (cons "\\(==\\)" 'identical)
;;          (cons "\\(/=\\)" 'not-identical)
;;          (cons "\\(()\\)" 'nil)
;;          (cons "\\<\\(sqrt\\)\\>" 'square-root)
;;          (cons "\\(&&\\)" 'logical-and)
;;          (cons "\\(||\\)" 'logical-or)
;;          (cons "\\<\\(not\\)\\>" 'logical-neg)
;;          (cons "\\(>\\)\\[^=\\]" 'greater-than)
;;          (cons "\\(<\\)\\[^=\\]" 'less-than)
;;          (cons "\\(>=\\)" 'greater-than-or-equal-to)
;;          (cons "\\(<=\\)" 'less-than-or-equal-to)
;;          (cons "\\<\\(alpha\\)\\>" 'alpha)
;;          (cons "\\<\\(beta\\)\\>" 'beta)
;;          (cons "\\<\\(gamma\\)\\>" 'gamma)
;;          (cons "\\<\\(delta\\)\\>" 'delta)
;;          (cons "\\(''\\)" 'double-prime)
;;          (cons "\\('\\)" 'prime)
;;          (cons "\\(!!\\)" 'double-exclamation)
;;          (cons "\\(\\.\\.\\)" 'horizontal-ellipsis))))

;; (add-hook 'haskell-mode-hook 'haskell-unicode)

;;------------------------------------------------------------------[ Emacs Auto ]
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(haskell-program-name "ghci -i \".\"")
 '(py-shell-name "python2.7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "black"))))
 '(ido-first-match ((t (:background "black" :foreground "cyan" :weight bold))))
 '(linum ((t (:inherit (shadow default) :foreground "yellow"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit default :background "gray50" :foreground "grey75" :height 0.8))))
 '(tabbar-highlight ((t (:foreground "cyan"))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "gray20" :foreground "green" :box (:line-width 1 :color "white" :style released-button)))))
 '(tabbar-separator ((t (:inherit tabbar-default :height 0.1))))
 '(tabbar-unselected ((t (:inherit tabbar-default :box (:line-width 1 :color "white" :style pressed-button))))))
;;------------------------------------------------------------------[ W3M ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/w3m"))
;(if (= emacs-major-version 23)
;    (progn
;      (add-to-list 'load-path "~/emacs/w3m")
;      (require 'w3m-load))
;  (require 'w3m))


;(add-to-list 'load-path "~/emacs/w3m")
(if (= emacs-major-version 23)
	(require 'w3m-load)
  (require 'w3m))
;;------------------------------------------------------------------[ Trac ]
;;(setq url-proxy-services
;;                '(("http"     . "127.0.0.1:80")))
(require 'trac-wiki)
(trac-wiki-define-project "amas"  "http://localhost/wiki" t)
(global-set-key (kbd "<f12>") 'trac-wiki-edit)

;;------------------------------------------------------------------[ Icicles ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/icicles/"))
(require 'icicles)
;;(icy-mode 1)

;;------------------------------------------------------------------[ Python ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/python/python/Pymacs"))
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call  "pymacs")
(autoload 'pymacs-eval  "pymacs" nil t)
(autoload 'pymacs-exec  "pymacs" nil t)
(autoload 'pymacs-load  "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
(setq ropemacs-enable-autoimport t)
(pymacs-load "ropemacs" "rope-")

;; 暂时不能用
;; (require 'python)
;; (setq python-shell-interpreter "python2")


(add-to-list 'load-path "~/.emacs.d/python/python-mode") 
(setq py-install-directory "~/.emacs.d/python/python-mode")
(require 'python-mode)
(setq py-shell-name "python2")
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
;;------------------------------------------------------------------[ CUA ]
;;(require 'cua)
(cua-mode t)
;; If you don't want to modify the bindings of C-z C-x C-c C-v, but still want the CUA 
;; enhanced functionality for the standard emacs bindings of undo, kill, copy, and yank, 
;; use the following lines instead:
;; (CUA-mode 'emacs)

;; shift + click select region
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
(put 'mouse-set-point 'CUA 'move)

;;------------------------------------------------------------------[ IDO ]
(require 'ido)
(ido-mode t)
;;(global-set-key (kbd "M-a") 'ido-switch-buffer)
(setq ido-first-match '((t (:foreground "yellow" :weight bold))))

;;------------------------------------------------------------------[ LazySearch ]
(require 'lazy-search)
(global-set-key (kbd "M-s") 'lazy-search-menu)

;;------------------------------------------------------------------[ Tabbar ]
(require 'tabbar)
(tabbar-mode t)

;;------------------------------------------------------------------[ ISpell ]
(require 'ispell)
(setq ispell-dictionary "american")

;;------------------------------------------------------------------[ MyLisp ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/amas-emacs"))
(require 'amas-lib-edit)

;;------------------------------------------------------------------[ AucTex ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auctex"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auctex/preview"))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
;;------------------------------------------------------------------[ Yasnippet ]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")



;;------------------------------------------------------------------[ Recentf ]
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(setq recentf-auto-cleanup 'never)
(global-set-key [(meta f12)] 'recentf-open-files)

;;------------------------------------------------------------------[ Emacs.AutoModeAList ]
;; 根据文件名匹配major-mode
(setq auto-mode-alist 
      (append '(
                ("\\.tpl$"      . html-mode)
                ("\\.template$" . html-mode)
                ("\\.frag$"     . html-mode)
                ("\\.mako$"     . html-mode)
                ("\\.as[pc]x$"  . html-mode)
                ("\\.js$"       . js2-mode)
                ("\\.mm$"       . objc-mode)
                ("\\.zsh$"      . sh-mode)
                ("\\.org"       . org-mode)
                ) auto-mode-alist))

;;------------------------------------------------------------------[ AutoComplete]
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-complete"))
(require 'auto-complete)
;; (setq ac-user-dictionary '("foobar@example.com" "hogehoge@example.com"))
(require 'auto-complete-config)
(ac-config-default)
;; 我的字典
(add-to-list 'ac-user-dictionary-files "~/.ac-dict")
(setq ac-auto-start 3)
;;(setq ac-user-dictionary-files "~/.ac-dict")
(setq ac-comphist-file "~/.emacs.d/cache/ac-comphist-cache")

(define-key ac-complete-mode-map "\M-n" 'ac-next)
(define-key ac-complete-mode-map "\M-p" 'ac-previous)

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
;; known ac-sources see: `/.emacs.d/auto-complete`
(defun amas-ac-emacs-lisp-mode ()
  (setq ac-sources '(ac-source-features 
                     ac-source-functions 
                     ac-source-yasnippet 
                     ac-source-variables 
                     ac-source-symbols 
                     ac-source-words-in-same-mode-buffers 
                     ac-source-dictionary)))

(defun amas-ac-trac-wiki-mode ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-yasnippet ac-source-filename ac-source-dictionary)))

;; major mode -> source
(add-hook 'trac-wiki-mode-hook 'amas-ac-trac-wiki-mode)

;; ------------------------------------------------------------------[ ORG-MODE ]
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(require 'org-install)

;; ------------------------------------------------------------------[ FLYMAKE ]
(require 'flymake)
(setq flymake-max-parallel-syntax-checks 4)
(setq temporary-file-directory "/tmp/.emacs.d/flymake")
(setq flymake-number-of-errors-to-display 4)

;; python: pylint
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pylint-init)))

;; shell: 不是很好用
(require 'flymake-shell)
(add-hook 'sh-mode-hook 'flymake-shell-load)
;; ------------------------------------------------------------------[ SLIME ]
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")    ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/slime/release")  ; your SLIME directory
(require 'slime)
(slime-setup)
;; ------------------------------------------------------------------[ CCPP ]
;(setq gdb-many-windows t)
;(gud-tooltip-mode)
;(global-set-key [f5]    'gdb)          ;; 调试模式
;(global-set-key [C-f5]  'gud-run) 
;(global-set-key [S-f5]  'gud-cont)
;(global-set-key [f7]    'compile)      ;; 编译
;(global-set-key [f8]    'gud-print)
;(global-set-key [C-f8]  'gud-pstar)
;(global-set-key [f9]    'gud-break)
;(global-set-key [C-f9]  'gud-remove)
;(global-set-key [f10]   'gud-next)
;(global-set-key [C-f10] 'gud-until)
;(global-set-key [S-f10] 'gud-jump)
;(global-set-key [f11]   'gud-step)
;(global-set-key [C-f11] 'gud-finish)
;(add-hook 'gdb-mode-hook '(lambda ()
;                            (define-key c-mode-base-map [(f5)] 'gud-go)))
