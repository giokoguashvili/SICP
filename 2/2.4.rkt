#lang racket

(define (tuple a b)
    (lambda (selector)
        (selector a b)))

(define (first x)
    (define (fst a b) a)
    (x fst))

(define (second x)
    (define (snd a b) b)
    (x snd))
