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

;; Exercise 1.11
(define (fun11 n)
  (cond ((< n 3) n)
        ((> n 2) (+ (fun11 (- n 1)) (* 2 (fun11 (- n 2))) (* 3 (fun11 (- n 3)))))))
;; (fun11 30)
(define (fun11i n)
  (cond ((< n 3) n)
        (else (fun11igo (- n 3) 2 1 0))
         ))
(define (fun11igo n a b c)
  (cond ((= n 0) (+ a (* 2 b) (* 3 c)))
        (else (fun11igo (- n 1) (+ a (* 2 b) (* 3 c)) a b))
        )
  )
;; (fun11i 30)
;; Exercise 1.12
(define (pascal col row)
  (cond ((< col 1) 0)
        ((> col row) 0)
        ((= col 1) 1)
        (else (+ (pascal (- col 1) (- row 1)) (pascal col (- row 1))))
        )
  )
(pascal 2 4)