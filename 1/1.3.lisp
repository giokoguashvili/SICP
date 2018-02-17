(define (sum a b c)
  (- (+ (square a)
        (square b)
        (square c))
     (square (min a (min b c)))))

(define (square x) (* x x))
(define (min a b) (if (< a b) a b))

(sum 2 3 4)
