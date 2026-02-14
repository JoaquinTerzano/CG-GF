--# -coding=utf-8

instance LexCGSpa of LexCG = open SyntaxSpa, ParadigmsSpa, (M = MorphoSpa), Prelude in {
  oper
    card_N = mkN "carta" ;
    deck_N = mkN "mazo" ;
    hand_N = mkN "mano" feminine ;
    pile_N = mkN "pila" ;
    discard_pile_N = mkN pile_N "de descarte" ;
    player_N = mkN "jugador" ;
    opponent_N = mkN "oponente" ;
    turn_N = mkN "turno" ;
    size_N = mkN "tamaño" ;
    times_N = mkN "vez" ;

    play_V2 = mkV2 (mkV "jugar" "juego") ;
    draw_V2 = mkV2 (mkV "robar") ;
    discard_V2 = mkV2 (mkV "descartar") ;
    shuffle_V2 = mkV2 (mkV "barajar") ;
    reveal_V2 = mkV2 (mkV "revelar") ;

    active_A = mkA "activo" ;
    inactive_A = mkA "inactivo" ;
    empty_A = mkA (mkA "vacío") estarCopula ;
    discard_A = mkA "descarte" ;

    equal_to_A2 = mkA2 (mkA "igual") dative ;
    not_equal_to_A2 = mkA2 (mkA "distinto" "distinta" "distintos" "distintas" "distinto") genitive ;
    less_than_A2 = mkA2 (mkA "menor") dative ;
    more_than_A2 = mkA2 (mkA "mayor") dative ;
    at_most_A2 = mkA2 (invarA "a lo") (mkPrep "sumo") ;
    at_least_A2 = mkA2 (invarA "al") (mkPrep "menos") ;

    than_Prep = mkPrep "que" ;
    plus_Prep = mkPrep "más" ;
    minus_Prep = mkPrep "menos" ;
    times_Prep = mkPrep "por" ;
    as_Prep = mkPrep "como" ;

    -- Det = {
    --  s : Gender => Case => Str ;
    --  n : Number ;
    --  s2 : Gender => Str ;            -- -ci
    --  sp : Gender => Case => Str ;   -- substantival: mien, mienne
    --  spn: Case => Str ;
    --  isNeg : Bool -- negative element, e.g. aucun
    --  } ;
    as_many_Det = M.mkDeterminer "tantos" "tantas" plural False ;

    card_ref_NP = she_NP ;
    cards_ref_NP = mkNP (M.agr2pron ! {g=M.Fem ; n=M.Pl ; p=M.P3}) ;

    trigger_Conj = {s1 = "cuando" ; s2 = BIND ++ ":" ; n = M.Sg ; lock_Conj = <>} ;
    condition_Conj = {s1 = "si" ; s2 = BIND ++ "," ; n = M.Sg ; lock_Conj = <>} ;
}
