#lang racket

(define (square-tree tree)
  (if (null? tree)
    tree
    (if (pair? tree)
      (cons (square-tree (car tree))
	    (square-tree (cdr tree)))
      (* tree tree))))

(define tree (list 1
		   (list 2 (list 3 4) 5)
		   (list 6 7)))

(square-tree tree)

(define (square-tree1 tree)
  (map (lambda (elem)
	 (if (pair? elem)
	   (square-tree1 elem)
	   (* elem elem))) tree))

(square-tree1 tree)
