#lang racket

(define (make-point x y)
    (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define p (make-point 2 5))
(print-point p)

(define (make-segment p0 p1)
    (cons p0 p1))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
    (define p0 (start-segment seg))
    (define p1 (end-segment seg))
    (define x0 (x-point p0))
    (define y0 (y-point p0))
    (define x1 (x-point p1))
    (define y1 (y-point p1))
    (define (sum a b) (+ a b))
    (define (avg a b) (/ (sum a b) 2))
    (define x (avg x0 x1))
    (define y (avg y0 y1))
    (make-point x y))


(define p0 (make-point 1 2))
(define p1 (make-point 7 5))
(define seg (make-segment p0 p1))
(define mp (midpoint-segment seg))
(print-point p0)
(print-point p1)
(print-point mp)