#lang racket

(define zero (lambda (f) (lambda (x) x)))
(define (succ n) (lambda (f) (lambda (x) ((n f) (f x)))))

(define (decodeNumber n) ((n (lambda (x) (+ 1 x))) 0))

(decodeNumber (succ zero))
(define (sum n0 n1) ((n0 succ) n1))
(decodeNumber (sum (succ zero) (succ zero)))
