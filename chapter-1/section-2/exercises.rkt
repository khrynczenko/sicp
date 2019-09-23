#lang sicp

;; Exercise 1.9
;; First procedure is incrementing after the + operator. This will need to be remembered so the process is recursive.
;; Second procedure uses + operator as a last procedure which makes it tail-recursive and by that iterative in its core.

;; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

(A 2 4)
(define (f n) (A 0 n)) ;; f(n) = 2n
(define (g n) (A 1 n)) ;; f(n) = 2^n
(define (h n) (A 2 n)) ;; f(n) = ??
