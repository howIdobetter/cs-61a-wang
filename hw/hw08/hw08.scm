(define (ascending? s)
  (if (or (null? s) (null? (cdr s)))
      #t
      (and (<= (car s) (car (cdr s)))
           (ascending? (cdr s)))))

(define (my-filter pred s)
  (cond ((null? s) '())
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)
  (cond ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1)
                   (cons (car lst2)
                         (interleave (cdr lst1) (cdr lst2)))))))

(define (no-repeats s)
  (define (member? x lst)
    (cond ((null? lst) #f)
          ((= x (car lst)) #t)
          (else (member? x (cdr lst)))))
  
  (cond ((null? s) '())
        ((member? (car s) (cdr s)) (no-repeats (cdr s)))
        (else (cons (car s) (no-repeats (cdr s))))))