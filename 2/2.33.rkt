#lang racket

(define (accumulate op initial xs)
  (if (null? xs)
    initial 
    (op (car xs)
	(accumulate op initial (cdr xs)))))

(define (map1 p xs)
  (accumulate (lambda (x y) (cons (p x) y)) (list) xs))
(define (append1 xs ys)
  (accumulate cons ys xs))
(define (length1 xs)
  (accumulate (lambda (e init) (+ init 1)) 0 xs))

(define xs (list 1 2 3 4 5 6))
(define ys (list 7 8 9 10 11 12))

(map1 (lambda (x) (* x x)) xs)
(append1 xs ys)
(length1 ys)

