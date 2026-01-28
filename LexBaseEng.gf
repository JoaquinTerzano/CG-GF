instance LexBaseEng of LexBase = open SyntaxEng, ParadigmsEng in {
  oper
    unit_N = mkN "unit";

    -- PREPOSITION
    equal_to_A2 = mkA2 "equal" to_Prep;
    not_equal_to_A2 = mkA2 "distinct" from_Prep;
    less_than_A2 = mkA2 "less" than_Prep;
    more_than_A2 = mkA2 "more" than_Prep;
    less_than_or_equal_to_A2 = mkA2 "less than or equal" to_Prep;
    more_than_or_equal_to_A2 = mkA2 "more than or equal" to_Prep;
    than_Prep = mkPrep "than";
    plus_Prep = mkPrep "plus";
    times_Prep = mkPrep "times";
}