#lang racket

(define (accumulate op initial xs)
  (if (null? xs)
    initial 
    (op (car xs)
	(accumulate op initial (cdr xs)))))

(define (count-leaves tree)
  (accumulate + 0 (map (lambda (x)
			 (if (pair? x)
			   (count-leaves x)
			   1)) tree)))
(count-leaves (list (list 3 5) 1 2))
