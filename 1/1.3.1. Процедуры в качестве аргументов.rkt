#lang racket

(define (sum-integers a b)
    (if (> a b)
        0
        (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10) ;55

; ====================================

(define (pi-sum a b)
    (define (f n)
        (/ 1.0 (* n (+ n 2))))
    (if (> a b)
        0
        (+ (f a) (pi-sum (+ a 4) b))))

(define (pi-f pi-sum) (* (pi-sum 1 99999) 8.0))
(pi-f pi-sum) ;3.141572653589795

; ====================================

(define (sum-iter a b next fun)
    (if (> a b)
        0
        (+ (fun a) (sum-iter (next a) b next fun))))

(define (inc x) (+ x 1))
(define (cube x) (* x x x))

(define (sum-cubes a b)
    (sum-iter a b inc cube))

(sum-cubes 1 10) ;3025

; ====================================

(define (pi-sum2 a b)
    (define (next x) (+ x 4))
    (define (fun x)  (/ 1.0 (* x (+ x 2))))
    (sum-iter a b next fun))

(pi-f pi-sum2) ;3.141572653589795
