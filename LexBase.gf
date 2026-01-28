interface LexBase = open Syntax in {
  oper
    unit_N: N;

    -- PREPOSITION
    equal_to_A2: A2;
    not_equal_to_A2: A2;
    less_than_A2: A2;
    more_than_A2: A2;
    less_than_or_equal_to_A2: A2;
    more_than_or_equal_to_A2: A2;
    than_Prep: Prep;
    plus_Prep: Prep;
    times_Prep: Prep;
}