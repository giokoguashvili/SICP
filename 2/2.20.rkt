#lang racket

(define (same-parity fst . xs)
  (filter (lambda (x) (= (odd? x) (odd? fst))) (cons fst xs)))

(define (filter pred xs)
    (if (null? xs)
      xs
      (if (pred (car xs))
	(cons (car xs) (filter pred (cdr xs)))
	(filter pred (cdr xs)))))

(define (odd? x) (remainder x 2))

(same-parity 1 2 3 4 5 6 7 8 9)
(same-parity 2 3 4 5 6 7 8 9)
