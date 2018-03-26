#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define mobile 
  (make-mobile (make-branch 1 10)
	       (make-branch 2 20)))

(define lb (left-branch mobile))
(define rb (right-branch mobile))

mobile
lb
rb

(branch-length lb)
(branch-structure lb)

(branch-length rb)
(branch-structure rb)

(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile
    (+ (total-weight (branch-structure (right-branch mobile)))
       (total-weight (branch-structure (left-branch mobile))))))

(total-weight mobile)

(define mobile2
  (make-mobile
    (make-branch 1 10)
    (make-branch
      2
      (make-mobile 
	(make-branch 
	  3
	  (make-mobile
	    (make-branch 5 50)
	    (make-branch 6 60)))
	 (make-branch 4 40)))))

mobile2
(total-weight mobile2)
