#lang racket

(define (repeated f n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (define (iter n res)
        (if (= n 1)
            res
            (iter (- n 1) (compose f res))))
    (iter n f))
        
((repeated (lambda (x) (* x x)) 2) 5)