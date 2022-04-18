#lang racket

;;;;; Functions not included in BiwaScheme
;;;;;;; Apparently I started this in repl.it or something?)
(define (remainder a b)
  (- a (* b (truncate (/ a b)))))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
  
(define (signum x)
  (if (< x 0) -1 1))

(define (square x) (* x x))

(define (divides? n x)
  (= (remainder n x) 0))

(define (id x) x)

;;;;; Section 2.1
(define (add-rat x y)
  (make-rat (+ (* (numer x)
                  (denom y))
               (* (numer y)
                  (denom x)))
            (* (denom x)
               (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x)
                  (denom y))
               (* (numer y)
                  (denom x)))
            (* (denom x)
               (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x)
               (numer y))
            (* (denom x)
               (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x)
               (denom y))
            (* (denom x)
               (numer y))))

(define (equal-rat? x y)
  (= (* (numer x)
        (denom y))
     (* (numer y)
        (denom x))))

(define (print-rat r)
  (display (numer r))
  (display "/")
  (display (denom r))
  (newline))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))


;; Exercise 2.1
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (* (signum n)
             (signum d)
             (/ n g))
          (/ (abs d)
             (abs g)))))

;; Exercise 2.2
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment startp endp)
  (cons startp endp))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (make-point 
    (/ (+ (x-point (start-segment s))
          (x-point (end-segment s)))
       2)
    (/ (+ (y-point (start-segment s))
          (y-point (end-segment s)))
       2)))

(define (length-segment s)
  (sqrt (+ (square (- (y-point (start-segment s))
                      (y-point (end-segment s))))
           (square (- (x-point (start-segment s))
                      (x-point (end-segment s)))))))




;; Exercise 2.3 - representation 1
(define (make-rectangle p1 p2)
  (let ((left-x (min (x-point p1)
                     (x-point p2)))
        (right-x (max (x-point p1)
                      (x-point p2)))
        (bottom-y (min (y-point p1)
                       (y-point p2)))
        (top-y (max (y-point p1)
                    (y-point p2))))
    (cons (make-point left-x top-y)
          (make-point right-x bottom-y))))

(define (top-left-rectangle r)
  (car r))

(define (bottom-right-rectangle r)
  (cdr r))

(define (bottom-left-rectangle r)
  (make-point
    (x-point (top-left-rectangle r))
    (y-point (bottom-right-rectangle r))))

(define (top-right-rectangle r)
  (make-point
    (x-point (bottom-right-rectangle r))
    (y-point (top-left-rectangle r))))

(define (top-edge r)
  (make-segment
    (top-left-rectangle r)
    (top-right-rectangle r)))

(define (bottom-edge r)
  (make-segment
    (bottom-left-rectangle r)
    (bottom-right-rectangle r)))

(define (left-edge r)
  (make-segment
   (top-left-rectangle r)
   (bottom-left-rectangle r)))

(define (right-edge r)
  (make-segment
   (top-right-rectangle r)
   (bottom-right-rectangle r)))

(define (perimeter-rectangle r)
  (+ (* 2 (length-segment (top-edge r)))
     (* 2 (length-segment (left-edge r)))))

(define (area-rectangle r)
  (* (length-segment (top-edge r))
     (length-segment (left-edge r))))

;; TODO: representation 2

;;;;; 2.1.3
(define (cons1 x y)
  (lambda (m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else "Argument not 0 or 1 -- CONS" m))))

(define (car1 z) (z 0))
(define (cdr1 z) (z 1))

;; Exercise 2.4
(define (cons2 x y)
  (lambda (m) (m x y)))

(define (car2 z)
  (z (lambda (p q) p)))

(define (cdr2 z)
  (z (lambda (p q) q)))

; ; Just for fun, verify (car2 z) = x
; (car2 z)
; => (car (cons x y))
; => (car λm.(m x y))
; => (λm.(m x y) λp.λq.p)
; => (λp.λq.p x y)
; => (λq.x y)
; => x
; 
; ; Verify (cdr2 z) = y
; (cdr z)
; => (cdr (cons x y))
; => (cdr λm.(m x y))
; => (λm.(m x y) λp.λq.q)
; => (λp.λq.q x y)
; => (λq.q y)
; => y



;; Exercise 2.5
;;;;;;; (2/17/22) Wow, I actually did this one, huh?
(define (cons3 a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (log-x x n)
  (if (divides? n x)
      (+ 1 (log-x x (/ n x)))
      0))

(define (car3 z)
  (log-x 2 z))

(define (cdr3 z)
  (log-x 3 z))

;; Exercise 2.6
(define zero
  (lambda (f)
    (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

;  add1 := λn.λf.λx.(f ((n f) x))
;  zero := λf.λx.x
;  one  := (add1 zero) = ...
;        = λf.λx.(f x)
;  two  := (add1 one)
;        = λf.λx.(f (f x))
;  add  ?= λa.λb.λf.λx.((a f) ((b f) x))
;  
;  (add zero one) ; should simplify to one = λf.λx.(f x)
;   = ((add zero) one)
;   = ((λna.λfa.λxa.(fa ((na fa) xa)) λf0.λx0.x0) λf1.λx1.(f1 x1))
;   = (λfa.λxa.(fa ((λf0.λx0.x0 fa) xa)) λf1.λx1.(f1 x1))
;   = λxa.(λf1.λx1.(f1 x1) ((λf0.λx0.x0 fa) xa))
;   = λxa.λx1.(((λf0.λx0.x0 fa) xa) x1)
;   = λxa.λx1.((λx0.x0 xa) x1)
;   = λxa.λx1.(xa x1)
;   = λf.λx.(f x) = one QED!
;  
;  (add one one) ; should simplify to two = λf.λx.(f (f x))
;   = ((add one) one)
;   = ((λa.λb.λfa.λxa.((a fa) ((b fa) xa)) λf1.λx1.(f1 x1)) λf2.λx2.(f2 x2))
;   = (λb.λfa.λxa.((λf1.λx1.(f1 x1) fa) ((b fa) xa)) λf2.λx2.(f2 x2))
;   = λfa.λxa.((λf1.λx1.(f1 x1) fa) ((λf2.λx2.(f2 x2) fa) xa))
;   = λfa.λxa.(λx1.(fa x1) ((λf2.λx2.(f2 x2) fa) xa))
;   = λfa.λxa.(λx1.(fa x1) (λx2.(fa x2) xa))
;   = λfa.λxa.(λx1.(fa x1) (fa xa))
;   = λfa.λxa.(fa (fa xa))
;   = λf.λx.(f (f x)) = two QED!
;  
;  four := (add1 (add1 (add1 (add1 zero)))) ; 0+1+1+1+1
;   = (add1 (add1 (add1 (λn.λf.λx.(f ((n f) x)) λf0.λx0.x0))))
;   = (add1 (add1 (add1 (λf.λx.(f ((λf0.λx0.x0 f) x))))))
;   = (add1 (add1 (add1 (λf.λx.(f (λx0.x0 x))))))
;   = (add1 (add1 (add1 (λf.λx.(f x)))))
;   = (add1 (add1 (add1 one))) ; 1+1+1+1
;   = (add1 (add1 (λn1.λf1.λx1.(f1 ((n1 f1) x1)) λf.λx.(f x))))
;   = (add1 (add1 (λf1.λx1.(f1 ((λf.λx.(f x) f1) x1)))))
;   = (add1 (add1 (λf1.λx1.(f1 (λx.(f1 x) x1)))))
;   = (add1 (add1 (λf1.λx1.(f1 (f1 x1)))))
;   = (add1 (add1 (λf.λx.(f (f x)))))
;   = (add1 (add1 two)) ; 2+1+1
;   = (add1 (λna.λfa.λxa.(fa ((na fa) xa)) λf2.λx2.(f2 (f2 x2))))
;   = (add1 λfa.λxa.(fa ((λf2.λx2.(f2 (f2 x2)) fa) xa)))
;   = (add1 λfa.λxa.(fa (λx2.(fa (fa x2)) xa)))
;   = (add1 λfa.λxa.(fa (fa (fa xa))))
;   = (add1 λf.λx.(f (f (f x)))) ; predicted function for 3
;   = (λna.λfa.λxa.(fa ((na fa) xa)) λf.λx.(f (f (f x))))
;   = λfa.λxa.(fa ((λf.λx.(f (f (f x))) fa) xa))
;   = λfa.λxa.(fa (λx.(fa (fa (fa x))) xa))
;   = λfa.λxa.(fa (fa (fa (fa xa))))
;   = λf.λx.(f (f (f (f x)))) ; predicted function for 4
;  
;  four := (add two two) ; 2 + 2 = 4
;   = ((add two) two)
;   = ((λa.λb.λf.λx.((a f) ((b f) x)) λf2.λx2.(f2 (f2 x2))) two)
;   = (λb.λf.λx.((λf2.λx2.(f2 (f2 x2)) f) ((b f) x)) two)
;   = (λb.λf.λx.(λx2.(f (f x2)) ((b f) x)) two)
;   = (λb.λf.λx.(f (f ((b f) x))) two)
;   = (λb.λf.λx.(f (f ((b f) x))) λf2.λx2.(f2 (f2 2x)))
;   = λf.λx.(f (f ((λf2.λx2.(f2 (f2 2x)) f) x)))
;   = λf.λx.(f (f (λx2.(f (f x2)) x)))
;   = λf.λx.(f (f (f (f x)))) = four QED!


;;;; 2.1.4
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div1-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;; Exercise 2.7
(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

;; Exercise 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;; Exercise 2.9
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

; ;;;; Show that the width of the sum/difference of two intervals is a function
; ;;;; of the widths of the intervals being added/subtracted.
; 
; (define i (interval li ui))
; (define j (interval lj uj))
; 
; then
; (width i)
; => (* 1/2 (- (upper-bound i) (lower-bound i)))
; => (* 1/2 (- ui li))
; 
; and
; (width j)
; => (* 1/2 (- (upper-bound j) (lower-bound j)))
; => (* 1/2 (- uj lj))
; 
; The sum i + j is
; (add-interval i j)
; => (interval (+ (lower-bound i) (lower-bound j))
;              (+ (upper-bound i) (upper-bound j)))
; 
; and the width of the interval (i + j) is
; (width (add-interval i j))
; => (width (interval (+ (lower-bound i) (lower-bound j))
;                     (+ (upper-bound i) (upper-bound j))))
; => (width (interval (+ li lj) (+ ui uj)))
; => (* 1/2 (- (+ ui uj) (+ li lj)))
; => (* 1/2 (- (+ ui uj) li lj))
; => (* 1/2 (+ (- ui li) (- uj lj)))
; => (+ (* 1/2 (- ui li))
;       (* 1/2 (- uj lj)))
; => (+ (width i) (width j))
; 
; Thus (width (add-interval i j)) is a function of the widths of i and j.
; 
; (...in traditional math notation...)
; 
; Let i be the interval (li, ui)
; Let j be the interval (lj, uj)
; 
; Then width(i) = (1/2)(ui - li)
; and  width(j) = (1/2)(uj - lj)
; and the interval h = i + j = the interval (li + lj, ui + uj)
; 
; Then width(h) = (1/2)((ui + uj) - (li + lj))
; => (1/2)(ui + uj - li - lj)
; => (1/2)(ui - li + uj - lj)
; => (1/2)(ui - li) + (1/2)(uj + lj)
; => width(i) + width(j)
; Thus, width(h) = width(i + j) = width(i) + width(j),
; i.e. the width of the sum of two intervals is a function of the widths of the
; intervals.
; 
; 
; ;;;; Give examples to show that this is not true for multiplication or
; ;;;; division.
; 


(define i1 (make-interval 1 2))
(define i2 (make-interval 2 4))
(define i3 (make-interval 3 6))
(define i4 (make-interval 2 8))
(define i5 (make-interval -2 8))
(define i6 (make-interval -8 -2))

(display "Widths of individual intervals")(newline)
(width i1)
(width i2)
(width i3)
(width i4)
(width i5)
(width i6)

(display "Widths of products of intervals")(newline)
(list (width i1) (width i2) (width (mul-interval i1 i2)))
(list (width i2) (width i3) (width (mul-interval i2 i3)))
(list (width i3) (width i4) (width (mul-interval i3 i4)))
(list (width i4) (width i5) (width (mul-interval i4 i5)))
(list (width i4) (width i6) (width (mul-interval i4 i6)))

;; Exercise 2.10
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "Dividing by an interval which straddles 0 implicitly divides by 0.")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

;; Exercise 2.11 - tacet

; definitions from p. 95
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

;; Exercise 2.12
(define (make-center-percent center percent-tolerance)
  (let ((tolerance (* center percent-tolerance)))
    (make-interval (- center tolerance) (+ center tolerance))))

;; The percent selector could be either i = c +/- p => p = u/c-1 or p = 1-l/c,
;; where of course u = (upper-bound i), l = (lower-bound i), and c = (center i).
;; (Yay seventh grade pre-algebra!)
;; The code for the latter is infinitessimally more readable,
;; so I'm going with that one.
(define (percent i)
  (- 1 (/ (lower-bound i) (center i))))

