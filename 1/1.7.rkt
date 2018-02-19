#lang racket

(define (sqrt x) (sqrt-iter 0.5 1.0 x))

(define (sqrt-iter prev-guess guess x)
  (if (good-enough?? prev-guess guess x)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (good-enough?? prev-guess guess x)
  (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b) (/ (+ a b) 2))

(define (abs a)
  (if (< a 0)
      (- a)
      a))

(define (square x) (* x x))

(sqrt 9)
(sqrt 0.1)
(sqrt 0.001)
(sqrt 100000000)
(sqrt 1000000000)
(sqrt 10000000000)
