#lang racket

(define (iter a b next f result)
    (if (> a b)
        result
        (iter (next a) b next f (f result a))))

(define (inc x) (+ x 1))

(define (sum-iter a b)    
    (define (sum a b) (+ a b))
    (iter a b inc sum 0))

(define (product-iter a b)
    (define (product a b) (* a b))
    (iter a b inc product 1))

(sum-iter 1 5) ; 15
(product-iter 1 5) ; 16

(define (fact n)
    (product-iter 1 n))

(fact 7)

;Pi Formul John Wallis
(define (pi-jw fixed)
    (define (inc2 x) (+ 2 x))
    (define (f r k) (/ (* r (- k 1) (+ k 1)) (* k k)))
    (* 4 (iter 3.0 fixed inc2 f 1)))
(pi-jw 1000)