#lang racket

(define (sum-iter a b next fun)
    (if (> a b)
        0
        (+ (fun a) (sum-iter (next a) b next fun))))

(define (cube x) (* x x x))

(define (integral-simp f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (define (odd x) (= (remainder x 2) 1))
    (define (const i) 
        (cond 
            ((= i 0) 1)
            ((= i n) 1)
            ((odd i) 4)
            (else 2)))
    (define (fun index) (* (const index) (y index)))
    (define (next x) (+ x 1))
    (/ (* h (sum-iter 0 n next fun)) 3.0))

(integral-simp cube 0 1 100)
 