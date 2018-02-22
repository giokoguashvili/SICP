#lang racket

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (accumulate combiner (combiner null-value (term a)) term (next a) next b)))

(define (inc a) (+ a 1))

(define (sum a b)
    (define (identity a) a)
    (accumulate + 0 identity a inc b))

(sum 1 5);15

(define (prod a b)
    (define (identity x) x)
    (accumulate * 1 identity a inc b))

(prod 1 5); 120 