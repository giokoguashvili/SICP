#lang racket

(define (leaves-count tree)
  (if (isEmpty? tree)
    0
    (if (isLeave? tree)
      1
      (+ (leaves-count (car tree))
	 (leaves-count (cdr tree))))))

(define (isEmpty? tree) (null? tree))
(define (isLeave? tree) (not (pair? tree)))

(define tree (cons (list 1 2 3) (list 4 5 6)))
(display "tree: ")
tree
(display "length: ")
(length tree)
(display "leaves count: ")
(leaves-count tree)
(newline)

(define x (cons (list 1 2) (list 3 4)))
(display "tree: ")
x
(display "length: ")
(length x)
(display "leaves count: ")
(leaves-count x)
(newline)

(define xx (list x x))
(display "tree: ")
xx
(display "lentgh: ")
(length xx)
(display "leaves count: ")
(leaves-count xx)
(newline)

(define xxx (list 1 (list 2 (list 3 4))))
(display "tree: ")
xxx
(display "length: ")
(length xxx)
(display "leaves count: ")
(leaves-count xxx)

(cons 1 (cons 2 (cons 3 4))) 


;;2.24
;;(1 (2 (3 4)))

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
