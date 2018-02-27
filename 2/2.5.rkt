#lang racket

(define (while a pred next res)
    (if (pred a)
         (while (next a) pred next (+ 1 res))
         res))

(define ff 2)
(define ss 3)

(define (tuple a b)
    (* (pow ff a) (pow ss b)))

(define (first t)
    (get ff t))

(define (second t)
    (get ss t))

(define (get ind t)
    (while t (lambda (x) (= (remainder x ind) 0)) (lambda (x) (/ x ind)) 0))

(define (pow a x)
    (define (pow* a res count)
        (if (= count 0)
            res
            (pow* a (* a res) (- count 1))))
    (pow* a 1 x))

(define t (tuple 21 2))
(first t)
(second t)