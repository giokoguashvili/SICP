#lang racket

(define (for-each1 f xs)
   (if (null? xs)
     	#t
	((lambda () (f (car xs)) (for-each1 f (cdr xs))))))

(for-each1 (lambda (x) (newline) (display x)) (list 1 2 3 4 5 6 7 8 9))
