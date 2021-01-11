(define (domain MONKEY)
  (:requirements :strips)
  (:predicates (at ?x ?y)
    (onfloor)
    (onbox ?x)
    (hasbananas)
    (monkey ?x)
    (box ?x)
    (bananas ?x)
    )

  (:action aller
    :parameters (?m ?x ?y)
    :precondition ( and (monkey ?m) (onfloor) (at ?m ?x))
    :effect
      (and (at ?m ?y)
      (not (at ?m ?x))
       )
  )

  (:action pousser
    :parameters (?m ?b ?x ?y)
    :precondition ( and (monkey ?m) (box ?b) (at ?b ?x) (at ?m ?x) (onfloor))
    :effect
      (and (at ?m ?y)
      (not (at ?m ?x))
      (at ?b ?y)
      (not (at ?b ?x))
      )
  )

  (:action monter
    :parameters (?m ?b ?x)
    :precondition ( and (monkey ?m) (box ?b) (at ?b ?x) (at ?m ?x) (onfloor) )
    :effect
      (and (not (onfloor))
      (onbox ?x)
      )
  )

  (:action descendre
    :parameters (?m ?b ?x)
    :precondition ( and (monkey ?m) (box ?b) (at ?b ?x) (at ?m ?x) (onbox ?x) )
    :effect
      (and (onfloor)
      (not (onbox ?x))
      )
  )

  (:action attraper
    :parameters (?m ?x)
    :precondition ( and (monkey ?m) (bananas ?x) (onbox ?x) (at ?m ?x))
    :effect
      ( and (hasbananas)
      )
  )

  (:action lacher
    :parameters (?m ?x ?b)
    :precondition ( and (monkey ?m) (bananas ?b) (hasbananas) (at ?m ?x))
    :effect
      ( and (not(hasbananas))
        (at ?b ?x)
      )
  )


)
