#lang racket

;;;;;; 1.2 Procedures and the Processes they Generate
;;;; 1.2.1 Linear Recursion and Iteration

; factorial defined on p. 32
(define (naive-factorial n)
  (if (= n 1)
      1
      (* n (naive-factorial (- n 1)))))

; improved factorial defined on p. 34/footnote on p. 33
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

;; Exercise 1.9
; First procedure:
; 
; (+ 4 5)
; => (inc (+ 3 5))
; => (inc (inc (+ 2 5)))
; => (inc (inc (inc (+ 1 5))))
; => (inc (inc (inc (inc (+ 0 5)))))
; => (inc (inc (inc (inc 5))))
; => (inc (inc (inc 6)))
; => (inc (inc 7))
; => (inc 8)
; => 9
; 
; This process is linearly recursive.


; Second procedure:
; 
; (+ 4 5)
; => (+ 3 6)
; => (+ 2 7)
; => (+ 1 8)
; => (+ 0 9)
; => 9
; 
; This process is linearly iterative.



;; Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; What are the values of the following expressions?
(A 1 10) ; = 1024
(A 2 4)  ; = 65536
(A 3 3)  ; = 65536

; Give concise mathematical definitions for these functions:
(define (f n) (A 0 n))   ; f(n) = 2n
(define (g n) (A 1 n))   ; g(n) = 2^n for n in N > 0
(define (h n) (A 2 n))   ; h(n) = 2^^n for n in N > 0
(define (k n) (* 5 n n)) ; k(n) = 5n^2


;;;; 1.2.2 Tree Recursion

; fib defined on p. 37
(define (naive-fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (naive-fib (- n 1))
                 (naive-fib (- n 2))))))

; fib defined on p. 39
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

;; Example: counting change
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0)
             (= kinds-of-coins 0))
         0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

;;;;;;; You would never actually do this in production, right? Right?!
;;;;;;; Like, instead you'd have some kind of resource file
;;;;;;; coindenoms.EN-US.dat and load that data into an array
;;;;;;; [0, 1, 5, 10, 25, 50] and then just do first-denomination[k],
;;;;;;; right?! Or at least, the compiler/interpreter would be
;;;;;;; smart enough that when it sees this kind of function, it would
;;;;;;; be smart enough to inline it as
;;;;;;;   (define (first-denomination k)
;;;;;;;     (array-ref #(1 5 10 25 50) k))
;;;;;;; Right? Please?
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
;;;;;;; Me being a smartass... the next paragraph *kind of* talks about this.
;;;;;;; Also, see Exercise 2.19.


;; Exercise 1.11
;;;; f(n) = n,                          n < 3
;;;;      = f(n-1) + 2f(n-2) + 3f(n-3), n >= 3

(define (f-rec n)
  (if (< n 3)
      n
      (+      (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

;;;;;;; Ugh. After many broken solutions and  wadded up pieces of paper manually
;;;;;;; calculating [f(i) for i in range(1,10)] and various formulas that didn't
;;;;;;; iteratively finally gave up and consulted
;;;;;;; http://community.schemewiki.org/?sicp-ex-1.11
;;;;;;; And this is why James will probably wind up with an EdD in Higher
;;;;;;; Education Administration instead of a PhD in Computer Science.
(define (f-iter n)
  (define (f* fn-1 fn-2 fn-3 i)
    (cond ((< i 0) i)
          ((= i 0) fn-1)
          (else
           (f* (+ fn-1 (* 2 fn-2) (* 3 fn-3))
               fn-1
               fn-2
               (- i 1)))))
  (f* 2 1 0 n))


;; Exercise 1.12
(define (pt r c)
  (cond ((or (<= c 0)
             (> c r))
         0)
        ((or (= c 1)
             (= c r))
         1)
        (else (+ (pt (- r 1) (- c 1))
                 (pt (- r 1) c)))))

; Just for fun, actually display n rows of the whole triangle
;;;;;;; This could be Pascals-Triangle, but apostrophe errors irk me.
(define (Pascal-Triangle n)
  (map (lambda (r)
         (map (lambda (c) (pt r c))
              (range 1 (+ r 1))))
       (range 1 (+ n 1))))

;;;;;;; Seee.... I'm so much better at this kind of thing than weird arithmetic
;;;;;;; manipulations like in 1.11. This is music pretending to be math.
;;;;;;; 1.11 is used in certain sub-circles of Hades. As is 1.13.

;; Exercise 1.13 is answered in exercise-1.13.md
;;;;;;; I actually skipped it the first time(s) I worked through this chapter,
;;;;;;; because I'm not particularly experienced writing proofs. It took some
;;;;;;; time, but once I got started, it actually wasn't that hard.

;;;; 1.2.3 Orders of Growth
;; Exercise 1.14 is answered in exercise-1.14.drawio.png

;; Exercise 1.15
(define (cube x) (* x x x))

;(define (p x)
;  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (set! count-ps 0)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; a. How mahy times is the procedure p applied when (sine 12.15) is evaluated?
; modify (p x) to count executions
(define count-ps 0)

(define (p x)
  (set! count-ps (+ 1 count-ps))
  (- (* 3 x)
     (* 4 (cube x))))

(list (sine 12.15) count-ps) ; => p is applied 5 times

;; b. What is the order of growth in space and number of steps (as a function of
;; a) used by the process generated by the sine procedure when (sine a) is
;; evaluated?
;;;;;;; I imagine the authors probably expected this to be answered without
;;;;;;; mutating a global variable and using 21st century data science tools,
;;;;;;; but analyzing the data produced by
; (for-each
;  (lambda (d)
;    (print
;     (let ((r (degrees->radians d))
;           (degrees->radians (lambda (d)
;                               (* d (/ pi 180)))))
;       (list d r (sine r) (sin r) count-ps)))
;    (newline))
;  (range 0 1800))

;;;;;;; the number of times (p x) is called grows logarithmically
;;;;;;; (though for the life of me I can't figure out what the base is).



;;;; 1.2.4 Exponentiation

; expt defined on p. 44
(define (naive-expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; expt defined on p. 45
(define (expt-iter b n)
  (define (expt-iter* b counter product)
    (if (= counter 0)
        product
        (expt-iter* b
                    (- counter 1)
                    (* b product))))
  (expt-iter* b n 1))

; fast-expt defined on p. 45
(define (square x) (* x x))
(define (even? n)
  (= (remainder n 2) 0))
(define (odd? n)
  (= (remainder n 2) 1))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


;; Exercise 1.16
(define (fast-expt-iter b n)
  (define (f* b n a)
    (cond ((= n 0) a)
          ((even? n)
           (f* (square b) (/ n 2) a))
          ((odd? n)
           (f* b (- n 1) (* a b)))))
  (f* b n 1))

;; Exercise 1.17
(define (mul-naive a b)
  (if (= b 0)
      0
      (+ a (mul-naive a (- b 1)))))

(define (double n) (* 2 n))
(define (halve n) (/ n 2))

(define (mul-fast a b)
  (cond ((= b 0) 0)
        ((even? b)
         (mul-fast (double a) (halve b)))
        ((odd? b)
         (+ a (mul-fast a (- b 1))))))

;; Exercise 1.18
(define (mul-fast-iter a b)
  (define (m* a b p)
    (cond ((= b 0) p)
          ((even? b)
           (m* (double a) (halve b) p))
          ((odd? b)
           (m* a (- b 1) (+ p a)))))
  (m* a b 0))

;;;; Greatest Common Divisor
