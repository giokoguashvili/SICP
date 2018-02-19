#lang racket

(define (change amount) 
    (ch amount 5))

(define (ch amount koins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= koins 0)) 0)
          (else (+  (ch amount 
                        (- koins 1)) 
                    (ch (- amount (first koins)) 
                        koins)))))

(define (first coin)
    (cond   ((= coin 1) 1)
            ((= coin 2) 5)
            ((= coin 3) 10)
            ((= coin 4) 25)
            ((= coin 5) 50)))

(change 100)