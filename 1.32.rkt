#lang racket

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (accumulate combiner (combiner null-value (term a)) term (next a) next b)))

(define (sum a b)
    (define (combiner prev res) (+ prev res))
    (define (identity a) a)
    (define (inc a) (+ a 1))
    (accumulate combiner 0 identity a inc b))

(sum 1 5);15

(define (prod a b)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (define (combiner prev res) (* prev res))
    (accumulate combiner 1 identity a inc b))

(prod 1 5); 120 