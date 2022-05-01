#lang racket

;; Section 2.3.2, exercise 2.56

(define (deriv exp wrt)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp wrt)
             1
             0))
        ((sum? exp)
         (make-sum (deriv (addend exp) wrt)
                   (deriv (augend exp) wrt)))
        ((difference? exp)
         (make-difference (deriv (minuend exp) wrt)
                          (deriv (subtrahend exp) wrt)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) wrt))
          (make-product (deriv (multiplier exp) wrt)
                        (multiplicand exp))))
        ((quotient? exp)
         (make-quotient
          (make-difference (make-product (denominator exp)
                                         (deriv (numerator exp) wrt))
                           (make-product (numerator exp)
                                         (deriv (denominator exp) wrt)))
          (make-exponentiation (denominator exp) 2)))
        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation (base exp)
                                (make-difference (exponent exp) 1)))
          (deriv (base exp) wrt)))
        (else
         (error "Unknown expression type -- DERIV" exp))))

;; Just 'cause
(define (d/dx exp) (deriv exp 'x))


;;;; Predicates for testing terminals
(define (variable? e)
  (symbol? e))

(define (same-variable? v w)
  (and (variable? v)
       (variable? w)
       (eq? v w)))

(define (=number? e n)
  (and (number? e)
       (= e n)))


;;;; Constructors for nonterminals


   
(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a)
              (number? b))
         (+ a b))
        (else (list '+ a b))))

(define (make-product m n)
  (cond ((or (=number? m 0)
             (=number? n 0))
         0)
        ((=number? m 1) n)
        ((=number? n 1) m)
        ((and (number? m)
              (number? n))
         (* m n))
        (else
         (list '* m n))))

(define (make-difference a b)
  (cond ((=number? a 0) (- b))
        ((=number? b 0) a)
        ((and (number? a)
              (number? b))
         (- a b))
        (else
         (list '- a b))))

(define (make-quotient n d)
  (cond ((=number? n 0) 0)
        ((=number? d 0)
         (error "Attempting to make a quotient with division by zero." d))
        ((and (number? n)
              (number? d))
         (/ n d))
        ((and (number? d)
              (not (number? n)))
         (make-product (/ 1 d) n))
        (else
         (list '/ n d))))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base)
              (number? exponent))
         (expt base exponent))
        (else
         (list '^ base exponent))))


;;;; Predicates for testing nonterminals
(define (sum? e)
  (and (pair? e)
       (eq? (car e) '+)))

(define (product? e)
  (and (pair? e)
       (eq? (car e) '*)))

(define (difference? e)
  (and (pair? e)
       (eq? (car e) '-)))

(define (quotient? e)
  (and (pair? e)
       (eq? (car e) '/)))

(define (exponentiation? e)
  (and (pair? e)
       (eq? (car e) ' ^))) ; Being rebelious and using ^ instead of **

;;;; Selectors for picking parts of nonterminals
(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define (minuend d)
  (cadr d))

(define (subtrahend d)
  (caddr d))

(define (dividend q)
  (cadr q))
(define numerator dividend)

(define (divisor q)
  (caddr q))
(define denominator divisor)

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))