#lang racket

(define (power x n)
    (define (iter res x n)
        (cond ((= n 0) res)
              ((even? n) (iter res (square x) (/ n 2)))
              (else (iter (* res x) x (- n 1)))))
    (define (square x) (* x x))
    (define (even? x) (= (remainder x 2) 0))
    (iter 1 x n))

(define (power2 a n)
    (define (even? a) (= (remainder a 2) 1))
    (define (iter a b n)
        (if (= n 0)
            b
            (if (even? n)
                (iter a (* b a) (- n 1))
                (iter (* a a) b (/ n 2)))))
    (iter a 1 n))

(power 2 7)
(power2 2 7)