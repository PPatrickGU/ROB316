(define (problem MONKEY-1)
    (:domain MONKEY)
  (:objects A B C MyMonkey MyBox MyBananas )
  (:init (monkey MyMonkey)
        (box MyBox)
        (bananas MyBananas)
        (onfloor)
        (at MyMonkey A)
        (at MyBox B)
        (at MyBananas C)
)
  (:goal (and (hasbananas)))
)
