#lang racket

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

;; Exercise 2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define tw-coins (list 50 20 10 5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
         ((or (< amount 0)
              (no-more? coin-values)) 0)
         (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (no-more? coin-values)
  (empty? coin-values))

;;;; Changing the order of coin-values does not affect the answer produced,
;;;; but it does affect the amount of time it takes.
;;;; (cc 111 uk-coins) (cc 111 uk-coins-reversed) (cc 111 uk-coins-shuffled)
;;;; all produce the same answer, 166880, but using the shuffled list takes
;;;; slightly longer, and using the reversed list takes four times as long.
(define uk-coins-reversed (reverse uk-coins))
(define uk-coins-shuffled (shuffle uk-coins))


(for ([i (range 201)])
  (for ([times (range 5)])
    (for ([coin-list (list (cons "DSC" uk-coins) (cons "ASC" uk-coins-reversed) (cons "RND" uk-coins-shuffled))])
      (display (apply string-append (list (number->string i) " " (car coin-list) " ")))
      (time (display (cc i (cdr coin-list)))))))
