#lang racket

(list 1 2 3)
(list-ref (list 1 2 3) 2)
(car (list 1 2 3))
(cadr (list 1 2 3))
(cons 0 (list 1 2 3))

(define (elemAt xs n)
  (if (= n 0)
    (car xs)
    (elemAt (cdr xs) (- n 1))))

(define xs (list 1 2 3 4 5 6 7))

(elemAt xs 4)

(define (len xs)
  (define (rlen result xs)
    (if (null? xs)
      result
      (rlen (+ 1 result) (cdr xs))))
  (rlen 0 xs))

(len xs)

(define (append xs ys)
  (if (null? xs)
    ys
    (cons (car xs) (append (cdr xs) ys))))

(define ys (list 10 11 12 13))

(append xs ys)

(define (last-pair xs)
  (if (null? (cdr xs))
    (car xs)
    (last-pair (cdr xs))))

(last-pair ys)
