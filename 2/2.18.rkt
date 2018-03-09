#lang racket

(define (revrs xs)
	(if (null? xs)
	  xs
	  (append (revrs (cdr xs)) (list (car xs)))))

(define (append xs ys)
  (if (null? xs)
    ys
    (cons (car xs) (append (cdr xs) ys))))


(define xs (list 1 2 3 4 5 6))
(revrs xs)
