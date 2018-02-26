#lang racket

(define (** a b)
    (if (= b 0)
        0
        (+ a (** a (- b 1)))))
        
(define (odd? x) (= (remainder x 2) 1))

(define (*** a b)
    (define (double x) (+ x x))
    (define (halve x) (/ x 2))
    (cond 
        ((= b 0) 0)
        ((= b 1) a)
        ((odd? b) (+ a (*** a (- b 1))))
        (else (*** (double a) (halve b)))))

(*** 4 18)