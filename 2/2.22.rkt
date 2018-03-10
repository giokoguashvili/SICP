#lang racket

(define (mapp1 mapper xs)
  (define (map-iter mapper res xs)
    (if (null? xs)
      res
      (map-iter mapper (append res (list (mapper (car xs)))) (cdr xs))))
  (map-iter mapper '() xs))

(mapp1 (lambda (x) (* x 2)) (list 1 2 3 4 5 6 7 8 9))
