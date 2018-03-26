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

lb
rb

(branch-length lb)
(branch-structure lb)

(branch-length rb)
(branch-structure rb)
