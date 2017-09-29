{-# LANGUAGE ExplicitForAll #-}

{-
  ! READ THIS !
    IN QUESTIONS 1 AND 2, BOOLEAN VALUES SHOULD NOT BE USED, INSTEAD,
    INTEGERS 0 AND 1 SHOULD BE USED EXCLUSIVELY.
    THIS HAS TO BE CHANGES THROUGHOUT QUESTION1 AND CHECKED FOR FURTHER QUESTIONS.

    Basically all Bool's have to be converted to 0's and 1's (Int's)
-}


{-
  Also before I forget
  Questions 1 through 5 here should be renamed
    to Questions I though V
-}

{-
  by Daan Dieperink and Sor?n ???????
      -s2014203          -s???????
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
  Now, we can test if (not (p and (not q))) is equivalent to ((not p) or q):
-}

  implies' :: Bool -> Bool -> Bool
  implies' p q = not p || q

{-
  By Comparing the truth tables of implies and implies',
    we can observe if they truly are equivalent:
-}

  equivalent2 :: (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> Bool
  equivalent2 r1 r2 = table2 r1 == table2 r2


  answerto1A :: Bool
  answerto1A = equivalent2 implies implies'

{-
  This will yield the following result:

    *Assignment> answerto1A
              => True
-}
--should become 1

--(b)

{-
  We can use the implies relation we defined earlier to now define:
    (p and q) implies r
      and
    p implies (q implies r)
-}

  questionB :: Bool -> Bool -> Bool -> Bool
  questionB p q = implies (p && q)

{-
  Note:
    questionB appears to take two arguments, but really takes three.
    The third argument is passed as the second argument of implies.
    In Haskell, this is equivalent to
      questionB p q r = implies (p && q) r
-}

  questionB' :: Bool -> Bool -> Bool -> Bool
  questionB' p q r = implies p (implies q r)

{-
  We create a new function to generate a truth table,
    this time taking functions with three variables:
-}

  table3 :: (Bool -> Bool -> Bool -> Bool) -> [(Bool, Bool, Bool, Bool)]
  table3 relation = [(p,q,r,res) | p<-b,q<-b,r<-b,res<-b, res == relation p q r]
    where b = [False, True]

  equivalent3 :: (Bool -> Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool -> Bool) -> Bool
  equivalent3 r1 r2 = table3 r1 == table3 r2


  answerto1B :: Bool
  answerto1B = equivalent3 questionB questionB'

{-
    *Assignment> answerto1B
              => True
-}
--should become 1

--(c)

  questionC :: Bool -> Bool -> Bool -> Bool
  questionC p q r = implies (not p) r && (q || r)

  questionC' :: Bool -> Bool -> Bool -> Bool
  questionC' p q r = (p && q) || (not p && r)

  answerto1C :: Bool
  answerto1C = equivalent3 questionC questionC'

{-
    *Assignment> answerto1C
              => False
-}

-- ^^^ should become 0 instead of False

-- Question 2

  mynot :: Int -> Int
  mynot 0 = 1
  mynot _ = 0

  myand :: Int -> Int -> Int
  myand 1 1 = 1
  myand _ _ = 0

  myor :: Int -> Int -> Int
  myor 0 0 = 0
  myor _ _ = 1

  myimply :: Int -> Int -> Int
  myimply 1 0 = 0
  myimply _ _ = 1

-- Question 3

{-
  Coincidentally, Question 3 is about truth tables, which we have already used
    in Question 1.
-}

  --REaD tHis
  -- shit don't work yet because table3 (and everything else) from question 1
  --    has to be converted to Int from Bool
  --       just
  --           so
  --              you
  --                  know
  --                      ...


  -- a1 :: Int -> Int -> Int -> Int
  -- a1 p q r = myimply p q
  --
  -- truthtable :: (Int -> Int -> Int -> Int) -> [(Int, Int, Int, Int)]
  -- truthtable = table3
  --
  -- answertoQ3 :: [(Bool, Bool, Bool, Bool)]
  -- answertoQ3 = truthtable a1

-- Question IV

{-
  And yet again, we have already defined the answer to (a part of) the question.
-}
--equiv r1 r2 = equivalent3 r1 r2
