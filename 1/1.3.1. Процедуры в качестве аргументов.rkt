#lang racket

(define (sum-integers a b)
    (if (> a b)
        0
        (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10)

(define (pi-sum a b)
    (define (f n)
        (/ 1.0 (* n (+ n 2))))
    (if (> a b)
        0
        (+ (f a) (pi-sum (+ a 4) b))))

(define pi (* (pi-sum 1 9999999) 8.0))
pi

