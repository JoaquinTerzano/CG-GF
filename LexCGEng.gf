instance LexCGEng of LexCG = open SyntaxEng, ParadigmsEng in {
  oper
    -- NOUNS
    card_N = mkN "card";
    deck_N = mkN "deck";
    hand_N = mkN "hand";
    pile_N = mkN "pile";
    size_N = mkN "size";
    player_N = mkN "player";
    opponent_N = mkN "opponent";
    discard_pile_N = mkN "discard" pile_N;

    -- VERBS
    play_V = mkV2 (mkV "play") ;
    draw_V = mkV2 (mkV "draw" "drew" "drawn") ;
    discard_V = mkV2 (mkV "discard") ;

    -- ADJECTIVE
    active_A = mkA "active";
    inactive_A = mkA "inactive";

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