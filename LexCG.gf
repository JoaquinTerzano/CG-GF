interface LexCG = open Syntax in {
  oper
    -- NOUNS
    card_N: N;
    deck_N: N;
    hand_N: N;
    pile_N: N;
    size_N: N;
    player_N: N;
    opponent_N: N;
    discard_pile_N: N;

    -- VERBS
    play_V: V2;
    draw_V: V2;
    discard_V: V2;

    -- ADJECTIVE
    active_A: A;
    inactive_A: A;

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