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
