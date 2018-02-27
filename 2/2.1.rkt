#lang racket

(define (make-rat a b)
    (lambda (selector)
        (selector a b)))

(define (gcd a b)
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
    (make-rat (/ n g) (/ d g)))

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
            (one-half (make-rat 1 2))
            (one-third (make-rat 1 3)))
    (print-rat (add-rat one-half one-third))
    (print-rat (mul-rat one-half one-third))
    (print-rat (abbreviated-rat (add-rat one-third one-third)))))

(run)