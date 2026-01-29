instance LexCGSpa of LexCG = open SyntaxSpa, ParadigmsSpa in {
  oper
    -- SUSTANTIVOS
    card_N = mkN "carta";
    deck_N = mkN "mazo";
    hand_N = mkN "mano" feminine;
    pile_N = mkN "pila";
    size_N = mkN "tamaño";
    player_N = mkN "jugador";
    opponent_N = mkN "oponente";
    discard_pile_N = mkN pile_N "de descarte";

    -- VERBOS
    play_V = mkV2 (mkV "jugar") ;
    draw_V = mkV2 (mkV "robar") ;
    discard_V = mkV2 (mkV "descartar") ;

    -- ADJECTIVOS
    active_A = mkA "activo";
    inactive_A = mkA "inactivo";

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