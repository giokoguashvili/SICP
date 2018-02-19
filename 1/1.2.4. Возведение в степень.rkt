#lang racket

(define (pow b x)
    (if (= x 0)
        1
        (* b (pow b (- x 1)))))

(pow 2 4)

(define (pow2 b x)
    (define (iter b result count)
        (if (= count 0)
            result
            (iter b (* result b) (- count 1))))
    (iter b 1 x))

(pow2 2 4)
