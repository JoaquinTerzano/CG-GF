instance LexBaseSpa of LexBase = open SyntaxSpa, ParadigmsSpa in {
  oper
    -- SUSTANTIVOS
    unit_N = mkN "unidad";

    -- PREPOSITION
    equal_to_A2 = mkA2 (mkA "igual") dative;
    not_equal_to_A2 = mkA2 (mkA "distinto" "distinta" "distintos"
      "distintas" "distinto") genitive;
    less_than_A2 = mkA2 (mkA "menor") dative;
    more_than_A2 = mkA2 (mkA "mayor") dative;
    less_than_or_equal_to_A2 = mkA2 (mkA "menor o igual") dative;
    more_than_or_equal_to_A2 = mkA2 (mkA "mayor o igual") dative;
    than_Prep = mkPrep "que";
    plus_Prep = mkPrep "más";
    times_Prep = mkPrep "por";
}