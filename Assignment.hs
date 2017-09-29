{-# LANGUAGE ExplicitForAll #-}

{-
  READ THIS
    IN QUESTIONS 1 AND 2, BOOLEAN VALUES SHOULD NOT BE USED, INSTEAD,
    INTEGERS 0 AND 1 SHOULD BE USED EXCLUSIVELY.
    THIS HAS TO BE CHANGES THROUGHOUT QUESTION1 AND CHECKED FOR FURTHER QUESTIONS.
-}



{-
  by Daan and Sorin
-}

module Assignment where

--Question 1

--(a)

{-
  p implies q is equivalent to not (p and (not q)).
  This is expressable in Haskell as the following:
-}

  implies :: Bool -> Bool -> Bool
  implies p q = not (p && not q)

{-
  We can generate a truth table for this in Haskell:
-}
  table2 :: (Bool -> Bool -> Bool) -> [(Bool, Bool, Bool)]
  table2 relation = [(p, q, res) | p <- bools, q <- bools, res <- bools, res == relation p q]
    where bools = [False, True]

{-
  Now, we can test if (not (P and (not Q))) is equivalent to ((not P) or Q):
-}
  implies' :: Bool -> Bool -> Bool
  implies' p q = not p || q

{-
  By Comparing the truth tables of implies and implies',
    we can observe if they truly are equivalent:
-}

  answerto1A :: Bool
  answerto1A = table2 implies == table2 implies'

{-
  This will yield the following result:

    *Assignment> answerto1A
              => True
-}

--(b)

{-
  We can use the implies relation we defined earlier to now define:
    (p and q) implies r
      and
    p implies (q implies r)
-}

  questionB :: Bool -> Bool -> Bool -> Bool
  questionB p q r = implies (p && q) r

  questionB' :: Bool -> Bool -> Bool -> Bool
  questionB' p q r = implies p (implies q r)

{-
  We create a new function to generate a truth table,
    this time taking functions with three variables:
-}

  table3 :: (Bool -> Bool -> Bool -> Bool) -> [(Bool, Bool, Bool, Bool)]
  table3 relation = [(p,q,r,res) | p<-b,q<-b,r<-b,res<-b, res == relation p q r]
    where b = [False, True]

  answerto1B :: Bool
  answerto1B = table3 questionB == table3 questionB'

{-
    *Assignment> answerto1B
              => True
-}

--(c)

  questionC :: Bool -> Bool -> Bool -> Bool
  questionC p q r = implies (not p) r && (q || r)

  questionC' :: Bool -> Bool -> Bool -> Bool
  questionC' p q r = (p && q) || (not p && r)

  answerto1C :: Bool
  answerto1C = table3 questionC == table3 questionC'

{-
    *Assignment> answerto1C
              => False
-}

-- Question 2
