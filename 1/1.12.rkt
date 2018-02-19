#lang racket

(define (pascal row index)
    (cond   ((or (= index 1) (= row 1) (= index row)) 1)
            (else (+ (pascal (- row 1) (- index 1))
                     (pascal (- row 1) index)))))

(pascal 1 1)

(pascal 2 1)
(pascal 2 2)

(pascal 3 1)
(pascal 3 2)
(pascal 3 3)

(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)

(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)


;1
;11
;121
;1331
;14641