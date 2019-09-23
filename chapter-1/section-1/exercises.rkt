#lang sicp

;; Exercise 1.1
10
(+ 5 3 4)
(- 9 1)
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(if (and (> b a) (< b (* a b)))
    b
    a)
(= a b)
;; Exercise 1.2
(/ (+ 5 4
      (- 2 (- 3 (+ 6 0.8))))
   (* 3
      (- 6 2)
      (- 2 7)))
;; Exercise 1.3
(define (fun x y z)
  (cond ((and (< z x) (< z y)) (+ (* x x) (* y y)))
        ((and (< y x) (< y z)) (+ (* x x) (* z z)))
        ((and (< x z) (< x y)) (+ (* y y) (* z z)))
        )
  )
(fun 1 2 3)
;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)
  )
(a-plus-abs-b 3 2)
(a-plus-abs-b 2 -4)

;; Exerise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y)
  )
(test 0 p)

;; Since in applicative-order (= x 0) returns true for (test 0 p) y will never get evaluated and everything will work as expected.
;; In normal order y would never get evaluated also?

;; Exercise 1.6

;; new-if is a function that evaluates all its arguments instead of one debending on the predicate outcome
;; because of that function will get ultimately much slower


;; Exercise 1.7

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)
      )
  )

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1 x))
;;(sqrt 0.000000020) ;; To get good result we need to make epsilon much smaller. For large epsilon result will be incorrect
;;(sqrt 10000000000) ;; Takes very long to compute (actually id does not finish in my case)

;; Below is better version that checks differene beteween subsequent calls
(define (sqrt-iter2 guess x)
  (if (good-enough?2 (improve guess x) guess)
      guess
      (sqrt-iter2 (improve guess x)
                 x)
      )
  )

(define (good-enough?2 current_guess last_guess)
  (< (abs (- current_guess last_guess)) (* 0.001 last_guess)))

(define (sqrt2 x) ( sqrt-iter2 1 x))
;;(sqrt2 10000000000) ;; No change for big numbers
;;(sqrt2 0.000000020) ;; This approach work for small numbers

;; Exercise 1.8
(define (sqrt-iter3 guess x)
  
  (if (good-enough?3 (improve3 guess x) guess)
      guess
      (sqrt-iter3 (improve3 guess x)
                 x)
      )
  )
(define (improve3 guess x)
  (/
   (+
    (/ x (square guess))
    (* 2 guess))
   3
   ))
(define (good-enough?3 current_guess last_guess)
  (< (abs (- current_guess last_guess)) (* 0.000001 last_guess)))

(define (curt x) ( sqrt-iter3 1 x))
(curt 9)