#lang racket

(define (** a b)
    (define (double x) (+ x x))
    (define (halve x) (/ x 2))
    (define (even? x) (= (remainder x 2) 0))
    (define (iter-* a b c)
        (cond ((= b 0) c)
              ((even? b) (iter-* (double a) (halve b) c))
              (else (iter-* a (- b 1) (+ c a)))))
    (iter-* a b 0))

(** 7 4)
