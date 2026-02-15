instance LexCGEng of LexCG = open SyntaxEng, ParadigmsEng, (M = MorphoEng), Prelude in {
  oper
    card_N = mkN "card" ;
    deck_N = mkN "deck" ;
    hand_N = mkN "hand" ;
    pile_N = mkN "pile" ;
    discard_pile_N = mkN "discard" pile_N ;
    player_N = mkN "player" ;
    opponent_N = mkN "opponent" ;
    turn_N = mkN "turn" ;
    size_N = mkN "size" ;
    times_N = mkN "time" ;

    play_V2 = mkV2 (mkV "play") ;
    draw_V2 = mkV2 (mkV "draw" "drew" "drawn") ;
    discard_V2 = mkV2 (mkV "discard") ;
    shuffle_V2 = mkV2 (mkV "shuffle") ;
    reveal_V2 = mkV2 (mkV "reveal") ;

    active_A = mkA "active" ;
    inactive_A = mkA "inactive" ;
    empty_A = mkA "empty" ;
    discard_A = mkA "discard" ;

    equal_to_A2 = mkA2 "equal" to_Prep ;
    not_equal_to_A2 = mkA2 "distinct" from_Prep ;
    less_than_A2 = mkA2 "less" than_Prep ;
    more_than_A2 = mkA2 "more" than_Prep ;
    at_most_A2 = mkA2 "at most" noPrep ;
    at_least_A2 = mkA2 "at least" noPrep ;

    than_Prep = mkPrep "than" ;
    plus_Prep = mkPrep "plus" ;
    minus_Prep = mkPrep "minus" ;
    times_Prep = mkPrep "times" ;
    as_Prep = mkPrep "as" ;

    -- Det = {s : Str ; sp : Gender => Bool => NPCase => Str ; n : Number ; hasNum : Bool} ;
    as_many_Det = lin Det {
      s = "as many" ;
      sp = \\g, b, c => "as many" ;
      n = plural ;
      hasNum = True
    } ;

    card_ref_NP = it_NP ;
    cards_ref_NP = they_NP ;

    trigger_Conj = mkConj "when" ":" singular ;
    condition_Conj = mkConj "if" "," singular ;
}
