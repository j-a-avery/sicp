#lang racket
(define nil null)

;;;; Section 2.2
;; Exercise 2.17
(define (last-pair lst)
  (if (empty? (cdr lst))
      (car lst)
      (last-pair (cdr lst))))

;; Exercise 2.18
(define (reverse-me lst)
  (define (reverse* lst sofar)
    (if (empty? lst)
        sofar
        (reverse* (cdr lst) (cons (car lst) sofar))))
  (if (empty? lst)
      lst
      (reverse* (cdr lst) (list (car lst)))))

;; Exercise 2.19 - see section-2.2-exercise-2.19.rkt, etc

;; Exercise 2.20
;;;;;;; The easiest solution is just to use filter...
(define (same-parity-easy example . others)
  (if (even? example)
      (filter even? others)
      (filter odd? others)))

;;;;;;; but I feel like since we're talking about car and cdr, a more...
;;;;;;; basic?... solution is intended.
(define (same-parity example . others)
  (define (same-parity* parity others)
    (cond ((empty? others) others)
          ((parity (car others))
           (cons (car others) (same-parity* parity (cdr others))))
          (else
           (same-parity* parity (cdr others)))))
  (cons example (same-parity* (if (even? example) even? odd?) others)))

;;; Mapping over lists

;; Exercise 2.21
(define (square x) (* x x))

(define (square-list1 items)
  (if (null? items)
      nil
      (cons
       (square (car items))
       (square-list1 (cdr items)))))

(define (square-list2 items)
  (map square items))

;; Exercise 2.22
(define (square-list3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Examine using substitution
; (square-list '(1 2 3 4 5))
; => (iter '(1 2 3 4 5) '())
; => (iter '(2 3 4 5) (1 . '()))
; => (iter '(3 4 5) (4 . (1 . '())))
; ...
; => '(25 16 9 4 1)
; 
; This does not work because we are cons-ing the most recent element to the
; front of the answer list.


(define (square-list4 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; Examine using substitution
; (square-list '(1 2 3 4 5))
; => (iter '(1 2 3 4 5) nil)
; => (iter '(2 3 4 5) (nil . 1))
; => (iter '(3 4 5) ((nil . 1) . 4))
; => (iter '(4 5) (((nil . 1) . 4) . 9))
; ...
; => (((((nil . 1) . 4) . 9) . 16) . 25)
; 
; This does not built a list - instead of nil being the last element,
; everything is cons-ed onto nil.


;; Exercise 2.23
(define (for-each effect items)
  (if (empty? items)
      (newline)
      (cdr (cons (effect (car items)) ; I feel like this is cheating
                 (for-each effect (cdr items))))))

;;;;;; 2.2.2 Hierarchical Structures

;; Exercise 2.24
(list 1 (list 2 (list 3 4))) ; => '(1 (2 (3 4)))
;; See also section-2.2-exercise-2.24.png

;; Exercise 2.25
(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))
(car (car '((7))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))

;; Exercise 2.26
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ; => '(1 2 3 4 5 6)
(cons x y) ; => '((1 2 3) . (4 5 6))
           ; => '((1 2 3) . (4 . (5 . (6 . nil)))) ;
           ; => '((1 2 3) 4 5 6)
(list x y) ; => (cons x (cons y nil))
           ; => (x . (y . nil))
           ; => ((1 2 3) . ((4 5 6) . nil))
           ; => '((1 2 3) (4 5 6))

;; Excercise 2.27
(define (deep-reverse lst)
  (define (deep-reverse* lst sofar)
    (cond ((empty? lst) sofar)
          ((not (pair? lst)) lst)
          (else 
           (deep-reverse* (deep-reverse* (cdr lst) '())
                          (cons (deep-reverse* (car lst) '()) sofar)))))
  (deep-reverse* lst nil))

;; Exercise 2.28
(define (fringe t)
  (cond ((empty? t) t)
        ((not (pair? t)) t)
        (else
         (if (pair? (car t))
             (append (fringe (car t))
                     (fringe (cdr t)))
             (cons (car t)
                   (fringe (cdr t)))))))

(fringe (list (list 1 2) (list 3 4)))

;; Exercise 2.29
;;;;;;; I remember doing this one before. I remember it being annoying.
;;;;;;; I think I remember seeing my answers for it recently.
;;;;;;; If I see those answers again, then I'll add them to this.
;;;;;;; Otherwise, tacet

;;;; Mapping over trees

;; Exercise 2.30
(define (square-tree1 t)
  (cond ((null? t) nil)
        ((not (pair? t))
         (square t))
        (else
         (cons (square-tree1 (car t))
               (square-tree1 (cdr t))))))

(define (square-tree2 tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree2 subtree)
             (square subtree)))
  tree))

;; Exercise 2.31
(define (tree-map function tree)
  (cond ((null? tree) nil)
        ((not (pair? tree))
         (function tree))
        (else
         (cons (tree-map function (car tree))
               (tree-map function (cdr tree))))))

(define (square-tree3 tree) (tree-map square tree))

;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map
                 (lambda (ss)
                   (append (list (car s)) ss))
                 rest)))))

(subsets '(1 2 3))

;;;; This works because for every element in the set (including the null set),
;;;; it adds both the subsets that do not contain the element, and the subsets
;;;; that do contain it.
;;;;;;; That is a horrible explanation, but I'm sleepy.

;;;; Section 2.2.3

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Exercise 2.33
(define (map* p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(equal? (map square (range 5))
        (map* square (range 5)))

(define (append* seq1 seq2)
  (accumulate cons seq2 seq1))

(equal? (append (range 5) (range 6 11))
        (append* (range 5) (range 6 11)))

(define (length* sequence)
  (accumulate
   (lambda (item count) (+ count 1))
   0
   sequence))

(= (length (range 1000))
   (length* (range 1000)))


;; Exercise 2.34
(define (horner-eval x coefficients)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* x higher-terms) this-coeff))
              0
              coefficients))


;; Exercise 2.38
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; (fold-right / 1 (list 1 2 3))
; => (/ 1 (fold-right / 1 '(2 3)))
; => (/ 1 (/ 2 (fold-right / 1 '(3))))
; => (/ 1 (/ 2 (/ 3 (fold-right / 1 nil))))
; => (/ 1 (/ 2 (/ 3 1)))
; => (/ 1 (/ 2 3))
; => (/ 1 2/3)
; => 3/2
; 
; (fold-left / 1 (list 1 2 3))
; => (iter 1 (list 1 2 3))
; => (iter (/ 1 1) (list 2 3))
; => (iter (/ 1 2) (list 3))
; => (iter (/ 1/2 3) nil)
; => 1/6
; 
; (fold-right list nil (list 1 2 3))
; => (list 1 (fold-right list nil (list 2 3)))
; => (list 1 (list 2 (fold-right list nil (list 3))))
; => (list 1 (list 2 (list 3 (fold-right list nil nil))))
; => (list 1 (list 2 (list 3 nil)))
; => '(1 (2 (3 '())))
; 
; (fold-left list nil (list 1 2 3))
; => (iter nil (list 1 2 3))
; => (iter (list nil 1) (list 2 3))
; => (iter (list (list nil 1) 2) (list 3))
; => (iter (list (list (list nil 1) 2) 3) nil)
; => (list (list (list nil 1) 2) 3)
; => '(((() 1) 2) 3)


;;;; Fold-left and fold-right will be guaranteed to produce the same values for
;;;; any sequence iff op is associative.

;; Nested Mappings
(define (enumerate-interval a b)
  (range a (+ b 1)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))