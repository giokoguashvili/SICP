#lang racket

(define (make-rat a b)
    (abbreviated-rat (signed-rat (make-rat* a b))))

(define (make-rat* a b)
    (lambda (selector)
        (selector a b)))

(define (gcd aa bb)
    (define a (abs aa))
    (define b (abs bb))
    (define (gcd* a b)
        (if (= b 0)
            a
            (gcd b (remainder a b))))
    (if (> a b)
        (gcd* a b)
        (gcd* b a)))

(define (abbreviated-rat x)
    (define n (number x))
    (define d (denom x))
    (define g (gcd n d))
    (make-rat* (/ n g) (/ d g)))

(define (abs x)
        (if (< x 0)
            (- x)
            x))

(define (signed-rat x)
    (define n (number x))
    (define d (denom x))
    (define (sign x) 
        (if (< x 0)
            -1
            1))
    (make-rat* (abs n) (* (sign (* n d)) (abs d))))
        

(define (number x)
    (define (fst a b) a)
    (x fst))

(define (denom x)
    (define (snd a b) b)
    (x snd))

(define (add-rat x y)
    (make-rat (+ (* (number x) (denom y)) 
                 (* (number y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat (* (number x) (number y))
              (* (denom x) (denom y))))

(define (print-rat x)
    (newline)
    (display (number x))
    (display "/")
    (display (denom x)))

;; ================================

(define (run)
    (let (
            (one-half (make-rat -1 2))
            (one-third (make-rat -1 3)))
    (print-rat (add-rat one-half one-third))
    (print-rat (mul-rat one-half one-third))
    (print-rat (abbreviated-rat (add-rat one-third one-third)))))

(run)