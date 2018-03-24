#lang racket

(define xs (list (list 1 2 3) (list 4 5) (list 6)))
xs
(car xs)
(cdr xs)

(define (deep-reverse xs)
  (define (reverse-it ys)
    (if (list? ys)
      (deep-reverse ys)
      ys))
  (define (deep-reverse-iter res ys)
    (if (null? ys)
      res
      (deep-reverse-iter (cons (reverse-it (car ys)) res)
			 (cdr ys))))
  (deep-reverse-iter (list) xs))

(deep-reverse xs)
