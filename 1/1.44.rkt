#lang racket

(define (repeated f n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (define (iter n res)
        (if (= n 1)
            res
            (iter (- n 1) (compose f res))))
    (iter n f))

(define (smooth f)
    (let ((dx 0.0001))
        (lambda (x) (/ 3.0 (+ (f (- x dx)) (f x) (f (+ x dx)))))))

(define (repeated-smooth n)
    (repeated smooth n))