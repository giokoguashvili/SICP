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

(define (revrs2 xs)
  (define (revrs-iter result xs)
    (if (null? xs)
      result
      (revrs-iter (cons (car xs) result) (cdr xs))))
  (revrs-iter (list) xs))

(revrs2 xs)
