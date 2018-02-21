#lang racket

(define (sum-integers a b)
    (if (> a b)
        0
        (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10) ;55

(define (pi-sum a b)
    (define (f n)
        (/ 1.0 (* n (+ n 2))))
    (if (> a b)
        0
        (+ (f a) (pi-sum (+ a 4) b))))

(define pi (* (pi-sum 1 99999) 8.0))
pi ;3.141572653589795

(define (sum-iter a b next fun)
    (if (> a b)
        0
        (+ (fun a) (sum-iter (next a) b next fun))))

(define (inc x) (+ x 1))
(define (cube x) (* x x x))

(define (sum-cubes a b)
    (sum-iter a b inc cube))

(sum-cubes 1 10) ;3025

