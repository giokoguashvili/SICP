#lang racket

(define (prime? n)
    (= (smallest-divisor n) n))

(define (smallest-divisor n)
    (define (find-divisor n test-divisor)
        (cond 
            ((> (* test-divisor test-divisor) n) n)
            ((divides? n test-divisor) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (define (divides? n divisor) (= (remainder n divisor) 0))
    (find-divisor n 2))


(prime? 3)
(prime? 5)
(prime? 7)
(prime? 13)
(prime? 19)
(prime? 10)

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)