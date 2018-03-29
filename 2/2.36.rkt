#lang racket

(define (accumulate op initial xs)
  (if (null? xs)
    initial 
    (op (car xs)
	(accumulate op initial (cdr xs)))))

(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
    (list) 
    (cons (accumulate op initial (map car seqs))
	  (accumulate-n op initial (map cdr seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
