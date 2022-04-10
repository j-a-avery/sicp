#lang racket

;; procedures from 1.1.1 through 1.1.6
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

;; Exercise 1.1

10 ; 10

(+ 5 3 4) ; 12

(- 9 1) ; 8

(/ 6 2) ; 3

(+ (* 2 4) (- 4 6)) ; 6

(define a 3) ; no output

(define b (+ a 1)) ; no output

(+ a b (* a b))
; (+ a b (* a b))
; => (+ 3 (+ a 1) (* 3 (+ a 1)))
; => (+ 3 (+ 3 1) (* 3 (+ 3 1)))
; => (+ 3 4 (* 3 4))
; => (+ 3 4 12)
; => 19


(= a b) ; #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; (if (and (> b a) (< b (* a b)))
;     b
;     a)
; => (if (and (> (+ a 1) 3) (< (+ a 1) (* 3 (+ a 1)))) (+ a 1) 3)
; => (if (and (> 4 3) (< 4 (* 3 (+ 3 1)))) (+ 3 1) 3)
; => (if (and (> 4 3) (< 4 (* 3 4))) 4 3)
; => (if (and (> 4 3) (< 4 12)) 4 3)
; => (if (and #t #t) 4 3)
; => (if #t 4 3)
; => 4


(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; (cond ((= a 4) 6)
;       ((= b 4) (+ 6 7 a))
;       (else 25))
; 
; => (cond ((= 3 4) 6) ...)
; => (cond ((= (+ 3 1) 4) (+ 6 7 a)) ...)
; => (cond ((= 4 4) (+ 6 7 a)) ...)
; => (cond (#t (+ 6 7 a)) ...)
; => (+ 6 7 a)
; => (+ 6 7 3)
; => 16


(+ 2 (if (> b a) b a))
; (+ 2 (if (> b a) b a))
; => (+ 2 (if (> (+ a 1) 3) b a))
; => (+ 2 (if (> (+ 3 1) 3) b a))
; => (+ 2 (if (> 4 3) b a))
; => (+ 2 (if #t b a))
; => (+ 2 b)
; => (+ 2 (+ a 1))
; => (+ 2 (+ 3 1))
; => (+ 2 4)
; => 6


(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; (* (cond ((> a b) a)
;          ((< a b) b)
;          (else -1))
;    (+ a 1))
; 
; => (* (cond ((> 3 (+ a 1)) a) ...)
;       (+ a 1))
; => (* (cond ((> 3 (+ 3 1)) a) ...)
;       (+ a 1))
; => (* (cond ((> 3 4) a) ...)
;       (+ a 1))
; => (* (cond ((< a b) b) ...)
;       (+ a 1))
; => (* (cond ((< 3 (+ a 1)) b) ...)
;       (+ a 1))
; => (* (cond ((< 3 (+ 3 1)) b) ...)
;       (+ a 1))
; => (* (cond ((< 3 4) b) ...)
;       (+ a 1))
; => (* (cond (#t b) ...)
;       (+ a 1))
; => (* b (+ a 1))
; => (* (+ a 1) (+ 3 1))
; => (* (+ 3 1) (+ 3 1))
; => (* 4 4)
; => 16


;; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))


;; Exercise 1.3
(define (sum-of-larger-two-squares a b c)
  (cond ((and (<= a b)
              (<= a c))
         (sum-of-squares b c))
        ((and (<= b a)
              (<= b c))
         (sum-of-squares a c))
        ((and (<= c a)
              (<= c b))
         (sum-of-squares a b))
        (else ; the three numbers are equal, so take the sum of any two squares
         (sum-of-squares a b)) ; this, of course, could be collapsed into the last case
        ))

;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; If b is positive, then b is added to a.
; If b is negative, then b is subtracted from (i.e., the absolute value of b is added to) a.
; 
; Examples:
; 
; (a-plus-abs-b 2 3)
; => ((if (> b 0) + -) a b)
; => ((if (> 3 0) + -) 2 3)
; => ((if #t + -) 2 3)
; => (+ 2 3)
; => 5
; 
; (a-plus-abs-b 2 (- 3))
; => ((if (> b 0) + -) a b)
; => ((if (> (- 3) 0) + -) 2 (- 3))
; => ((if (> -3 0) + -) 2 -3)
; => ((if #f + -) 2 -3)
; => (- 2 -3)
; => 5


;; Exercise 1.5
; (define (p) (p))
; => (define p (lambda (p) (p p)))
; 
; (define (test x y)
;   (if (= x 0)
;       0
;       y))
; 
; Applicative-Order Evaluation:
; (test 0 p)
; => (test 0 λp.(p p))
; => (if (= x 0) 0 λp.(p p))
; => (if #t 0 λp.(p p))
; => 0
; 
; Normal-Order Evaluation:
; (test 0 p)
; => (test 0 λp.(p p))
; => (test 0 p)
; => (test 0 λp.(p p))
; => (test 0 λp.(p p))
; => ...


;; procedures from 1.1.7
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 100))

;; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))
; 
; Since `if` is a special form, it does not evaluate either of its consequents
; until the truth value of the predicate is known.
; Given `(if p e1 e2)`:
;  * First p is evaluated.
;  * If p is true, then e1 is evaluated.
;    The value of the expression is the value of e1.
;  * If p is false, then e2 is evaluated.
;    The value of the expression is the value of e2.
; 
; Since `new-if` is a function and Scheme uses applicative order, the arguments
; of the function are evaluated before they are passed to the function.
; Given `(new-if p e1 e2)`:
;  * p, e1, and e2 are evaluated.
;  * p, e1, and e2 are passed as the arguments to `new-if`
;  * If p is true, then e1 is returned as the value of new-if.
;  * If p is false, then e2 is returned as the value of new-if.
; When e1 and e2 are simple values or non-recursive functions, the value of 
; new-if is the same as the value of if (though, since both consequents are
; evaluated, evaluation will be slower). If either or both of e1 or e2 are
; recursive functions that themselves call new-if, then evaluation will not
; terminate.
; 
; So, with `if`:
; 
; (sqrt 4)
; => (sqrt-iter 1.0 4)
; => (if (good-enough? 1.0 4)
;        1.0 ; then clause (not evaluated yet)
;        (sqrt-iter (improve 1.0 4) 4)) ; else clasuse (not evaluated yet)
; ; Evaluate the predicate
; => (if (< (abs (- (square 1.0) 4)) 0.001)
;        1.0
;        (sqrt-iter (improve 1.0 4) 4))
; => (if (< (abs (- (* 1.0 1.0) 4)) 0.001)
;        1.0
;        (sqrt-iter (improve 1.0 4) 4))
; => (if (< (abs (- 1.0 4) 0.001)
;        1.0
;        (sqrt-iter (improve 1.0 4) 4)))
; => (if (< (abs -3) 0.001)
;        1.0
;        (sqrt-iter (improve 1.0 4) 4))
; => (if (< 3 0.001)
;        1.0
;        (sqrt-iter (improve 1.0 4) 4))
; => (if #f
;        1.0
;        (sqrt-iter (improve 1.0 4) 4))
; ; The predicate is false, so discard the consequent for true, and evaluate the
; ; consequent for false
; => (sqrt-iter (improve 1.0 4) 4)
; ; Evaluate the arguments to sqrt-iter
; => (sqrt-iter (average 1.0 (/ 4 1.0)) 4)
; => (sqrt-iter (average 1.0 4.0) 4)
; => (sqrt-iter (/ (+ 1.0 4.0) 2) 4)
; => (sqrt-iter (/ 5.0 2) 4)
; => (sqrt-iter 2.5 4)
; => ... etc....
; Eventually this terminates and produces something close to 2.
; 
; 
; With `new-if`, however:
; 
; (sqrt 4)
; => (sqrt-iter 1.0 4)
; => (new-if (good-enough? 1.0 4)
;            1.0
;            (sqrt-iter (improve 1.0 4) 4))
; ; new-if is a function, so evaluate the arguments:
; ; (technically, in Scheme this is assumed to be done simultaneously)
; ;;;;; predicate:
; ===> good-enough? 1.0 4)
; ===> (< (abs (- (square 1.0) 4)) 0.001)
; ===> ...
; ===> #f
; ;;;;; then-clause
; ===> 1.0
; ;;;;; else-clause - this is where we run into problems, so to illustrate, I am
; ;;;;; bringing the rest of the function back into the evaluation
; ===> (new-if #f
;              1.0
;              (new-if (good-enough? 1.0 4)
;                      1.0
;                      (sqrt-iter (improve 1.0 4) 4)))
; ===> ...
; ===>(new-if #f
;              1.0
;              (new-if #f
;                      1.0
;                      (new-if #f
;                              1.0
;                              (new-if #f
;                                      1.0
;                                      (new-if #f
;                                              1.0
;                                              (new-if #f
;                                                      1.0
;                                                      (new-if
;                                                       ... ad infinitum )))))))
; Thus the evaluation never terminates.




