;;;


;;; 
(+ 2 2)

;;;
'(this is list)


;;; 来制造一个错误
(this is list)

;; Debugger entered--Lisp error: (void-function this)
;;   (this is list)
;;   eval((this is list))
;;   eval-last-sexp-1(nil)
;;   eval-last-sexp(nil)
;;   call-interactively(eval-last-sexp nil nil)

;; 编译
byte-compile-file

(+ 2 (+ 3 3))


;; 变量


fill-column ;; eval this variable

(concat "abc" "def")
(concat "a" "b" "c" "xxx")
(substring "123456789" 0 5)
(defvar hello-emacs 12)
(+ 1 hello-emacs) ; : 13
(concat "The " " 1+1="(number-to-string (+ 1 1))) ;
(+) ; >>> 0
(*) ; >>> 1
(message "hello emacs")
(message "fill-column=%d" fill-column)


;;; 给变量赋值
(set 'flowers '(a b c d))
flowers
(setq flowers '(1 2 3 4))
(setq name-a "zhoujb" sex-a "man") ;;; 可以给多个变量赋值
sex-a
name-a


(buffer-name)
(buffer-file-name)