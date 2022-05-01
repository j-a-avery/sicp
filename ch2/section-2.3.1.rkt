#lang racket

;; Section 2.3.1

;; Exercise 2.53
(list 'a 'b 'c) ; => '(a b c)

(list (list 'george)) ; => '((george))

(cdr '((x1 x2) (y1 y2))) ; => '((y1 y2))

(cadr '((x1 x2) (y1 y2))) ; => 'y1
; Wrong! (cdr (e . (e1 . (...en . '())))) => (e1 . (...en . '()))
; which is still a list. So (cdr ((x1 x2) (y1 y2))) => ((y1 y2))
; (which, duh, I know, because I got the previous problem right!)
; so (car '((y1 y2))) => '(y1 y2)
; 
; (cadr '((x1 x2) (y1 y2)))
; => (car (cdr '((x1 x2) (y1 y2))))
; => (car '((y1 y2)))
; => '(y1 y2)


(pair? (car '(a short list))) ; => #f

(memq 'red '((red shoes) (blue socks))) ; => #f
; the members are '(red shoes) and '(blue socks)

(memq 'red '(red shoes blue socks))
; Since Scheme defines #t and #f, this *should* return #t, since
; (memq x list-not-containing-x) returns #f. Instead, it returns
; '(red shoes blue socks) since 'red occurs as the first element of the list.
; This made sense in older Lisps where '() is false and everything else is true,
; but in a language with boolean literals, it seems the function that returns a
; sublist if the item is found should be different from the function that
; returns #f if the item is not found.
; (This, of course, is to say nothing about how terribly named memq is!)


;; Exercise 2.54
(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
        ((and (number? l1) (number? l2))
         (= l1 l2))
        ((and (symbol? l1) (symbol? l2))
         (eq? l1 l2))
        ((and (pair? l1) (pair? l2))
         (and (equal? (car l1) (car l2))
              (equal? (cdr l1) (cdr l2))))
        (else #f)))

;; Exercise 2.55
; For some expression e, 'e is syntactic sugar for (quote e).
; Then, ''e is (quote (quote e)), or, in cons notation,
; (quote . (quote . (e . '())))
; 
; So
; (car ''abracadabra)
; => (car (quote (quote abracadabra)))
; => (car (quote . (quote . (abracadabra . nil))))
; Then, `quote` is the first element of the list `(quote (quote abracadabra))`.
; (Here I'm using `` as in Markdown, to denote code as part of a document. If
; this weren't a question about 'quote, then I'd just use ', but 'quote gets
; confusing.)

