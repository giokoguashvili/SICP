#lang racket

(define (make-rect point width height)
    (cons (cons width height) point))

(define (rect-width rect)
    (car (car rect)))
(define (rect-height rect)
    (cdr (car rect)))

(define (S rect)
    (* (rect-width rect) (rect-height rect)))
(define (P rect)
    (* 2 (+ (rect-width rect) (rect-height rect))))

(define r (make-rect (cons 1 1) 10 20))
(S r)
(P r)