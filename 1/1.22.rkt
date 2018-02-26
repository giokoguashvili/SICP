#lang racket

(define (prime? n)
    (= (smallest-divisor n) n))

(define (smallest-divisor n)
    (define (next a) 
        (cond 
            ((= a 2) 3)
            (else (+ a 2))))
    (define (find-divisor n test-divisor)
        (cond 
            ((> (* test-divisor test-divisor) n) n)
            ((divides? n test-divisor) test-divisor)
            (else (find-divisor n (+ 1 test-divisor)))))
    (define (divides? n divisor) (= (remainder n divisor) 0))
    (find-divisor n 2))

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time)) 
        false))

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
    true)

(timed-prime-test 19)

(define (search-for-primes ind count)
    (if (> count 0) 
        (if (timed-prime-test ind)
            (search-for-primes (+ ind 1) (- count 1))
            (search-for-primes (+ ind 1) count))
        (newline)))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)

#|
1009 *** 0
1013 *** 0
1019 *** 0

10007 *** 0
10009 *** 0
10037 *** 0

100003 *** 0
100019 *** 0
100043 *** 0

1000003 *** 0
1000033 *** 0
1000037 *** 0

100000000003 *** 16
100000000019 *** 0
100000000057 *** 0

1000000000039 *** 15
1000000000061 *** 16
1000000000063 *** 15

10000000000037 *** 47
10000000000051 *** 47
10000000000099 *** 47

100000000000031 *** 147
100000000000067 *** 145
100000000000097 *** 149

[Done] exited with code=0 in 1.626 seconds
|#

#|
1009 *** 0
1013 *** 0
1019 *** 0

10007 *** 0
10009 *** 0
10037 *** 0

100003 *** 0
100019 *** 0
100043 *** 0

1000003 *** 0
1000033 *** 0
1000037 *** 0

100000000003 *** 15
100000000019 *** 12
100000000057 *** 8

1000000000039 *** 32
1000000000061 *** 28
1000000000063 *** 28

10000000000037 *** 88
10000000000051 *** 88
10000000000099 *** 88

100000000000031 *** 479
100000000000067 *** 272
100000000000097 *** 276

[Done] exited with code=0 in 2.615 seconds
|#