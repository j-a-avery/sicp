#lang racket

(define (inc i) (+ i 1))
(define (dec i) (- i 1))
(define (square x) (* x x))
(define (sum xs)
  (if (empty? xs)
      0
      (+ (car xs) (sum (cdr xs)))))
(define (average x . xs)
  (/ (+ x (sum xs))
     (+ 1 (length xs))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2 (tolerance 0.0001))
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
    

;; Exercise 1.37
(define (cont-frac n d k)
  (letrec
      ((cont-frac-iter
        (lambda (n d k i)
          (if (= i k)
              (/ (n k)
                 (d k))
              (/ (n i)
                 (+ (d i)
                    (cont-frac-iter n d k (inc i))))))))
    (cont-frac-iter n d k 1)))

;; Exercise 1.38
(define (e k)
  (+ 2.0
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= 0 (remainder (inc i) 3))
                      (* 2 (/ (+ i 1) 3))
                      1.0))
                k)))

(define (close-enough? a b (places 4))
  (< (abs (- a b)) (expt 10.0 (- places))))

;; Exercise 1.39
(define (tan-cf x k)
  (let ((d (lambda (i) (- (* 2 i) 1)))
        (n (lambda (i)
             (if (= i 1)
                 x
                 (- (square x))))))
    (cont-frac n d k)))


;;;; Section 1.34
;; functions included in the text

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt1 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (cube x) (* x x x))

(define (deriv g (dx 0.00001))
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt2 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt3 x)
  (fixed-point-of-transform
   (lambda (y) (/ x y))
   average-damp
   1.0))

(define (sqrt x)
  (fixed-point-of-transform
   (lambda (y) (- (square y) x))
   newton-transform
   1.0))

;; Exercise 1.40
;; Define a procedure `cubic` that can be used together with the
;; `newtons-method` procedure in expressions of the form
;;    (newtons-method (cubic a b c) 1)
;; to approximate zeros of the cubic
;;    x^3 + ax^2 + bx + c
(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

;; Exercise 1.41
;; Define a procedure `double` that takes a procedure of one argument as an
;; argument and returns a procedure that applies the original procedure twice.
;; For example, if `inc` is a procedure that adds 1 to its argument, then
;; `(double inc)` should be a procedure that adds two.
;; What value is returned by
;;     (((double (double)) inc) 5)
(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5) ; = 21

; double = λf.λx.(f (f x))
; 
; (double double)
;  = (λf1.λx1.(f1 (f1 x1)) λf2.λx2.(f2 (f2 x2)))
;  = λx1.(λf2.λx2.(f2 (f2 x2)) (λf2.λx2.(f2 (f2 x2)) x1))
;  = λx1.(λf2.λx2.(f2 (f2 x2)) λx2.(x1 (x1 x2)))
;  = λx1.λx2.(λx2.(x1 (x1 x2)) (λx2.(x1 (x1 x2)) x2))
;  = λx1.λx2.(x1 (x1 (λx2.(x1 (x1 x2)) x2)))
;  = λx1.λx2.(x1 (x1 (x1 (x1 x2))))
; 
; (double (double double))
;  = (double λa.λb.(a (a (a (a b)))))
;  = (λf.λx.(f (f x)) λa.λb.(a (a (a (a b)))))
;  = λx.(λa1.λb1.(a1 (a1 (a1 (a1 b1)))) (λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x))
;  = λx.λb1.((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) b1))))
;  = λx.λb1.(λb2.(x (x (x (x b2)))) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) b1))))
;  = λx.λb1.(x (x (x (x (λb2.(x (x (x (x b2)))) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) b1)))))))
;  = λx.λb1.(x (x (x (x (x (x (x (x (λb2.(x (x (x (x b2)))) ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) b1))))))))))
;  = λx.λb1.(x (x (x (x (x (x (x (x (x (x (x (x ((λa2.λb2.(a2 (a2 (a2 (a2 b2)))) x) b1)))))))))))))
;  = λx.λb1.(x (x (x (x (x (x (x (x (x (x (x (x (λb2.(x (x (x (x b2)))) b1)))))))))))))
;  = λx.λb1.(x (x (x (x (x (x (x (x (x (x (x (x (x (x (x (x b1))))))))))))))))
; 
; ((double (double double)) inc)
;  = (λf.λx.(f (f (f (f (f (f (f (f (f (f (f (f (f (f (f (f x)))))))))))))))) inc)
;  = (λf.λx.(f (f (f (f (f (f (f (f (f (f (f (f (f (f (f (f x)))))))))))))))) λx.(+ x 1))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) x))))))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ x 1))))))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ x 1) 1)))))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ x 1) 1) 1))))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ x 1) 1) 1) 1)))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1))))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1)))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1))))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1)))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1))))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1))))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1))))
;  = λx.(λx.(+ x 1) (λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)))
;  = λx.(λx.(+ x 1) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1))
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 2) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 3) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 4) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 5) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 6) 1) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ (+ x 7) 1) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ (+ x 8) 1) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ (+ x 9) 1) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ (+ x 10) 1) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ (+ x 11) 1) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ (+ x 12) 1) 1) 1) 1)
;  = λx.(+ (+ (+ (+ x 13) 1) 1) 1)
;  = λx.(+ (+ (+ x 14) 1) 1)
;  = λx.(+ (+ x 15) 1)
;  = λx.(+ x 16)
; 
; (((double (double double)) inc) 5)
;  = (λx.(+ x 16) 5)
;  = (+ 5 16)
;  = 21



;; Exercise 1.42
;; Let f and g be two one-argument functions. The composition f after g is
;; defined to be the function x -> f(g(x)). Define a procedure `compose` that
;; implements composition. For example, if `inc` is a procedure that adds 1 to
;; its argument,
;;     ((compose square inc) 6) = 49
(define (compose f g)
  (lambda (x) (f (g x))))

;; Exercise 1.43
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (dec n)))))

;; Exercise 1.44
(define (smooth f (dx 0.01))
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (+ x dx)))))

(define (n-fold-smoothed f n (dx 0.01))
  ((repeated smooth n) f))

