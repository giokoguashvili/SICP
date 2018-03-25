#lang racket

(define (tmap combiner null-value f tree)
  (if (null? tree)
    null-value
    (if (pair? tree)
      (combiner (tmap combiner null-value f (car tree))
		(tmap combiner null-value f (cdr tree)))
      (f tree))))

(define xs (list (list 1 2) (list 3 4)))

(tmap (lambda (l r) (cons r l)) (list) (lambda (x) x) xs)


(define (ttmap f null-value tree)
  (if (null? tree)
    null-value
    (if (pair? tree)
      (ttmap f (ttmap f null-value (cdr tree)) (car tree))
      (f tree null-value))))

(ttmap (lambda (r l) (cons r l)) (list) xs)
