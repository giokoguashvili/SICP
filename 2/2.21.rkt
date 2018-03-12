#lang racket

(define (map1 mapper xs)
  (if (null? xs)
    xs
    (cons (mapper (car xs))
	  (map1 mapper (cdr xs)))))

(define xs (list 1 2 3 4 5 6))
(map1 (lambda (x) (* x 2)) xs)
