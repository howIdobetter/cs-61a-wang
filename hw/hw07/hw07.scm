(define (square n) (* n n))

(define (pow base exp)
  (define (pow-iter b e result)
    (cond ((= e 0) result)
          ((even? e) (pow-iter (square b) (/ e 2) result))
          (else (pow-iter b (- e 1) (* result b)))))
  (pow-iter base exp 1))

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let ((y (repeatedly-cube (- n 1) x)))
        (* y y y))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))
