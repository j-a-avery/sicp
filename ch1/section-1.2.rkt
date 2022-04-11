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

;; Exercise 1.13 is answered in exercise-1.13.md.
;;;;;;; I actually skipped it the first time(s) I worked through this chapter,
;;;;;;; and it took some time to think/work through it, since I'm not
;;;;;;; particularly experienced working proofs, but it actually wasn't
;;;;;;; difficult once I got started.