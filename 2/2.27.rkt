#lang racket

(define xs (list (list 1 2 3) (list 1 2) (list 1)))
xs
(car xs)

(define (deep-reverse xs)
  (define (reverse-it ys)
    (if (list? ys)
      (deep-reverse ys)
      ys))
  (define (deep-reverse-it src result)
    (if (null? src)
      result
      (deep-reverse-it (cdr src)
		       (cons (reverse-it (car src)) result))))
  (deep-reverse-it xs (list)))

(deep-reverse xs)
