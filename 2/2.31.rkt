#lang racket

(define (tree-map func tree)
  (if (null? tree)
    tree
    (if (pair? tree)
    	(cons (tree-map func (car tree))
	      (tree-map func (cdr tree)))
	(func tree))))

(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))

(define tree (list 1
		   (list 2 (list 3 4) 5)
		   (list 6 7)))

(square-tree tree)
