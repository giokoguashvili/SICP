#lang racket

(define (prime? n)
    (= (smallest-divisor n) n))

(define (smallest-divisor n)
    (define (next a) 
        (cond 
            ((= a 2) 3)
            (else (+ a 2))))
    (define (find-divisor n test-divisor)
        (cond 
            ((> (* test-divisor test-divisor) n) n)
            ((divides? n test-divisor) test-divisor)
            (else (find-divisor n (+ 1 test-divisor)))))
    (define (divides? n divisor) (= (remainder n divisor) 0))
    (find-divisor n 2))

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (accumulate combiner (combiner null-value (term a)) term (next a) next b)))

(define (filtered-accumulate combiner null-value term a next b pred)
    (if (> a b)
        null-value
        (if (pred a)
            (filtered-accumulate combiner (combiner null-value (term a)) term (next a) next b pred)
            (filtered-accumulate combiner null-value term (next a) next b pred))))

(define (sum-prime-squares a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (filtered-accumulate + 0 square a inc b prime?))

(sum-prime-squares 2 3) ;13
(sum-prime-squares 2 5) ;38

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(gcd 8 16)

(define (sum-of-all n)
    (define (id x) x)
    (define (inc x) (+ x 1))
    (define (pred x) (= 1 (gcd x n)))
    (filtered-accumulate * 1 id 1 inc (- n 1) pred))

(sum-of-all 10)