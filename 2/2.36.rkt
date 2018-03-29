#lang racket

(define (accumulate op initial xs)
  (if (null? xs)
    initial 
    (op (car xs)
	(accumulate op initial (cdr xs)))))

(define (accumulate-n op initial seqs)
  (if (null? seqs)
    (list)
    (cons (accumulate op initial (car seqs))
	  (accumulate-n op initial (cdr seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
