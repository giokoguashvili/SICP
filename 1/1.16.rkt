#lang racket

(define (power x n)
    (define (iter res x n)
        (cond ((= n 0) res)
              ((even? n) (iter res (square x) (/ n 2)))
              (else (iter (* res x) x (- n 1)))))
    (define (square x) (* x x))
    (define (even? x) (= (remainder x 2) 0))
    (iter 1 x n))

(power 2 4)