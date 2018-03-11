#lang racket
;;2.25
(display "# 2.25")
(newline)
;;(1 3 (5 7) 9)
(define xs (list 1 2 (list 5 7) 9))
;;((7))
(define ys (list (list 7)))
;;(1 (2 (3 (4 (5 (6 7))))))
(define zs (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
xs
ys
zs
(car (cdr (car (cdr (cdr xs)))))
(car (car ys))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr zs))))))))))))

(define (findx tree x)
  (if (null? tree)
   '()
    (if (pair? tree)
      (append (findx (car tree) x)
	      (findx (cdr tree) x))
      (if (= x tree)
	(list x)
	'()))))

(car (findx xs 7))
(car (findx ys 7))
(car (findx zs 7))
