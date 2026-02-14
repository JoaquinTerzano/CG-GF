interface LexCG = open Syntax in {
  oper
    card_N : N ;
    deck_N : N ;
    hand_N : N ;
    pile_N : N ;
    discard_pile_N : N ;
    player_N : N ;
    opponent_N : N ;
    turn_N : N ;
    size_N : N ;
    times_N : N ;

    play_V2 : V2 ;
    draw_V2 : V2 ;
    discard_V2 : V2 ;
    shuffle_V2 : V2 ;
    reveal_V2 : V2 ;

    active_A : A ;
    inactive_A : A ;
    empty_A : A ;
    discard_A : A ;

    equal_to_A2 : A2 ;
    not_equal_to_A2 : A2 ;
    less_than_A2 : A2 ;
    more_than_A2 : A2 ;
    at_most_A2 : A2 ;
    at_least_A2 : A2 ;

    than_Prep : Prep ;
    plus_Prep : Prep ;
    minus_Prep : Prep ;
    times_Prep : Prep ;
    as_Prep : Prep ;

    as_many_Det : Det ;

    card_ref_NP : NP ;
    cards_ref_NP : NP ;

    trigger_Conj : Conj ;
    condition_Conj : Conj ;
}
