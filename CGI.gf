incomplete concrete CGI of CG =
  open Syntax, Extend, Func, LexCG, Prelude, CommonRomance in {

  -- NATURAL
  lincat
    Nat = {s : Digits ; value : Dict ; lock_Nat : {}} ; 
    NatTerm = {s : NP ; value : Dict ; lock_NatTerm : {}} ; 
    NatExpr = {s : NP ; value : Dict ; lock_NatExpr : {}} ;
    NatOper = {s : Prep ; value : Str ; lock_NatOper : {}} ;
    NatRel = {s : A2 ; value : Str ; lock_NatRel : {}} ;

  oper
    mkNat : Str -> Nat ;
    mkNat s = {s = mkDigits s ; value = val "natural" s ; lock_Nat = <>} ;

  lin
    -- tristemente hardcodeados
    n2 = mkNat "2" ; n3 = mkNat "3" ; n4 = mkNat "4" ; n5 = mkNat "5" ;   
    n6 = mkNat "6" ; n7 = mkNat "7" ; n8 = mkNat "8" ; n9 = mkNat "9" ;

    -- TERM
    -- <Nat> cards, <Nat> cartas
    -- Number : Nat -> NatTerm ;
    Number n = {s = mkNP (mkDet n.s) card_N ; value = n.value ; lock_NatTerm = <>} ;

    -- the size of <Location>, el tamaño de <Location>
    -- Size : Location -> NatTerm ;
    Size loc = {s = mkNP (mkNP the_Det size_N) (mkAdv possess_Prep loc.s) ; value = val "size" loc.value ; lock_NatTerm = <>} ;

    -- EXPRESSION
    -- <NatTerm>
    -- NatExpr1 : NatTerm -> NatExpr ;
    NatExpr1 n = {s = n.s ; value = n.value ; lock_NatExpr = <>} ;

    -- <NatTerm> <NatOper> <NatTerm>
    -- NatExpr2 : NatTerm -> NatOper -> NatTerm -> NatExpr ;
    NatExpr2 x op y = {s = mkNP x.s (mkAdv op.s y.s) ; value = val op.value x.value y.value ;
      lock_NatExpr = <>} ;

    -- FUNCTION
    -- plus, más
    -- NatAdd : NatOper ;
    NatAdd = {s = plus_Prep ; value = "add" ; lock_NatOper = <>} ;

    -- times, por
    -- NatMult : NatOper ;
    NatMult = {s = times_Prep ; value = "multiply" ; lock_NatOper = <>} ;

    -- less than, menor que
    -- NatLess : NatRel ;
    NatLess = {s = less_than_A2 ; value = "less" ; lock_NatRel = <>} ;

    -- more than, mayor que
    -- NatMore : NatRel ;
    NatMore = {s = more_than_A2 ; value = "more" ; lock_NatRel = <>} ;

    -- equal to, igual a
    -- NatEqual : NatRel ;
    NatEqual = {s = equal_to_A2 ; value = "equal" ; lock_NatRel = <>} ;

    -- not equal to, distinto de
    -- NatNotEqual : NatRel ;
    NatNotEqual = {s = not_equal_to_A2 ; value = "not_equal" ; lock_NatRel = <>} ;

    -- at most, como mucho
    -- NatLessEqual : NatRel ;
    NatLessEqual = {s = at_most_A2 ; value = "less_equal" ; lock_NatRel = <>} ;

    -- at least, como mínimo
    -- NatMoreEqual : NatRel ;
    NatMoreEqual = {s = at_least_A2 ; value = "more_equal" ; lock_NatRel = <>} ;


  -- BOOLEAN
  lincat
    BoolTerm = {s : Cl ; value : Dict ; lock_BoolTerm : {}} ; 
    BoolExpr = {s : S ; value : Dict ; lock_BoolExpr : {}} ;
    BoolOper = {s : Conj ; value : Str ; lock_BoolOper : {}} ;
    BoolPol = {s : Pol ; value : Str ; lock_BoolPol : {}} ;
    Event = {s : S ; value : Dict ; lock_Event : {}} ;

  lin
    -- TERM
    -- <NatExpr> is <NatRel> <NatExpr>, <NatExpr> es <NatRel> <NatExpr>
    -- Compare : NatExpr -> NatRel -> NatExpr -> BoolTerm ;
    Compare x rel y = {s = expr x.s rel.s y.s ; value = val rel.value x.value y.value ;
      lock_BoolTerm = <>} ;

    -- <Location> is empty, <Location> está vacío
    -- Empty : Location -> BoolTerm ;
    Empty loc = {s = mkCl loc.s empty_A ; value = val "empty" loc.value ;
      lock_BoolTerm = <>} ;

    -- you play this card | etc | tú juegas esta carta | etc
    -- Trigger : Action -> BoolExpr ;
    Trigger action = {s = expr positivePol (mkCl you_NP action.s (mkNP this_Det card_N)) ;
      value = val "event" (val action.value (val "player" "active") (val "this")) ;
      lock_Event = <>} ;

    -- EXPRESSION
    -- p (is | isn't) q, p (es | está | no es | no está) q
    -- BoolExpr1 : BoolPol -> BoolTerm -> BoolExpr ;
    BoolExpr1 pol p = {s = expr pol.s p.s ; value = val pol.value p.value ; lock_BoolExpr = <>} ;

    -- p (is | isn't) q <BoolOper> r (is | isn't) s
    -- p (es | está | no es | no está) q <BoolOper> r (es | está | no es | no está) s
    -- BoolExpr2 : BoolPol -> BoolTerm -> BoolOper -> BoolPol -> BoolTerm -> BoolExpr ;
    BoolExpr2 polp p op polq q = {
      s = expr polp.s p.s op.s polq.s q.s ;
      value = val op.value polp.value p.value polq.value q.value ;
      lock_BoolExpr = <>} ;

    -- FUNCTION
    -- or, o
    -- BoolOr : BoolOper ;
    BoolOr = {s = or_Conj ; value = "or" ; lock_BoolOper = <>} ;

    -- either ... or ..., o ... o ...
    -- BoolXor : BoolOper ;
    BoolXor = {s = either7or_DConj ; value = "xor" ; lock_BoolOper = <>} ;

    -- and, y
    -- BoolAnd : BoolOper ;
    BoolAnd = {s = and_Conj ; value = "and" ; lock_BoolOper = <>} ;

    -- negativePol
    -- BoolNot : BoolOper ;
    BoolNot = {s = negativePol ; value = "not" ; lock_BoolPol = <>} ;

    -- positivePol
    -- BoolPass : BoolOper ;
    BoolPass = {s = positivePol ; value = "pass" ; lock_BoolPol = <>} ;


  -- CONTEXT
  lincat
    Set = {s : NP ; ref : NP ; value : Dict ; lock_Set : {}} ;
    Player = {s : NP ; ref : NP ; role : Role ; value : Dict ; lock_Player : {}} ;
    Action = {s : V2 ; value : Str ; act : Act ; lock_Action : {}} ;
    Location = {s : NP ; value : Dict ; lock_Location : {}} ;

  param
    Role = Active | Inactive ;
    Domain = Hand | Deck | DiscardPile ;
    Act = Play | Draw | Discard | Reveal ;

  oper
    mkPlayer : Role -> Player ;
    mkPlayer role = case role of {
      -- you, tú
      Active => {s = you_NP ; ref = you_NP ; role = Active ; value = val "player" "active" ;
        lock_Player = <>} ;
      -- your opponent, tu oponente
      Inactive => {s = mkNP youSg_Pron opponent_N ; ref = they_NP ; role = Inactive ;
        value = val "player" "inactive" ;
        lock_Player = <>}
    } ;

    mkLocation : Role -> Domain -> Location ;
    mkLocation role domain = case role of {
      Active => let player = mkPlayer Active in case domain of {
        -- your hand, tu mano
        Hand => {s = mkNP youSg_Pron hand_N ; value = val "location" "hand" player.value ;
          lock_Location = <>} ;
        -- your deck, tu mazo
        Deck => {s = mkNP youSg_Pron deck_N ; value = val "location" "deck" player.value ;
          lock_Location = <>} ;
        -- your discard pile, tu pila de descarte
        DiscardPile => {s = mkNP youSg_Pron discard_pile_N ;
          value = val "location" "discard_pile" player.value ;
          lock_Location = <>}
      } ;
      Inactive => let player = mkPlayer Inactive in case domain of {
        -- your opponent's hand, la mano de tu oponente
        Hand => {s = possessive player.s hand_N ;
          value = val "location" "hand" player.value ; lock_Location = <>} ;
        -- your opponent's deck, el mazo de tu oponente
        Deck => {s = possessive player.s deck_N ;
          value = val "location" "deck" player.value ; lock_Location = <>} ;
        -- your opponent's discard pile, la pila de descarte de tu oponente
        DiscardPile => {s = possessive player.s discard_pile_N ;
          value = val "location" "discard_pile" player.value ; lock_Location = <>}
      }
    } ;

    mkAction : Act -> Action ;
    mkAction act = case act of {
      Play => {s = play_V2 ; value = "play" ; act = Play ; lock_Action = <>} ;
      Draw => {s = draw_V2 ; value = "draw" ; act = Draw ; lock_Action = <>} ;
      Discard => {s = discard_V2 ; value = "discard" ; act = Discard ; lock_Action = <>} ;
      Reveal => {s = reveal_V2 ; value = "reveal" ; act = Reveal ; lock_Action = <>}
    } ;

  lin
    -- PLAYER
    -- you, tú
    -- ActivePlayer : Player ;
    ActivePlayer = mkPlayer Active ;

    -- your opponent, tu oponente
    -- InactivePlayer : Player ;
    InactivePlayer = mkPlayer Inactive ;

    -- ACTION
    -- play, jugar
    -- PlayAction : Action ;
    PlayAction = mkAction Play ;
    -- draw, robar
    -- DrawAction : Action ;
    DrawAction = mkAction Draw ;
    -- discard, descartar
    -- DiscardAction : Action ;
    DiscardAction = mkAction Discard ;
    -- reveal, revelar
    -- RevealAction : Action ;
    RevealAction = mkAction Reveal ;

    -- LOCATION
    -- your hand | tu mano
    -- HandActiveLocation : Location ;
    HandActiveLocation = mkLocation Active Hand ;

    -- your opponent's hand | la mano de tu oponente
    -- HandInactiveLocation : Location ;
    HandInactiveLocation = mkLocation Inactive Hand ;

    -- your deck | tu mazo
    -- DeckActiveLocation : Location ;
    DeckActiveLocation = mkLocation Active Deck ;

    -- your opponent's deck | el mazo de tu oponente
    -- DeckInactiveLocation : Location ;
    DeckInactiveLocation = mkLocation Inactive Deck ;

    -- your discard pile | tu pila de descarte
    -- DiscardPileActiveLocation : Location ;
    DiscardPileActiveLocation = mkLocation Active DiscardPile ;

    -- your opponent's discard pile | la pila de descarte de tu oponente
    -- DiscardPileInactiveLocation : Location ;
    DiscardPileInactiveLocation = mkLocation Inactive DiscardPile ;

    -- SET
    -- this card, esta carta
    -- ThisCard : Set ;
    ThisCard = {s = mkNP this_Det card_N ; ref = card_ref_NP ; value = val "this" ;
      lock_Set = <>} ;

    -- a card from <Location>, una carta de <Location>
    -- CardLocation : Location -> Set ;
    CardLocation loc = {s = cards from_Prep loc.s ; ref = card_ref_NP ;
      value = val "select" loc.value (val "natural" "1") ;
      lock_Set = <>} ;

    -- all the cards from <Location>, todas las cartas de <Location>
    -- AllLocation : Location -> Set ;
    AllLocation loc = {s = cards all_Predet from_Prep loc.s ; ref = cards_ref_NP ;
      value = val "select" loc.value (val "natural" "1") ;
      lock_Set = <>} ;

    -- <Nat> cards from <Location>, <Nat> cartas de <Location>
    -- NatLocation : Nat -> Location -> Set ;
    NatLocation n loc = {s = cards n.s from_Prep loc.s ; ref = cards_ref_NP ;
      value = val "select" loc.value n.value ;
      lock_Set = <>} ;

    -- as many cards as <NatExpr> from <Location>
    -- tantas cartas como <NatExpr> de <Location>
    -- NatExprLocation : NatExpr -> Location -> Set ;
    NatExprLocation n loc = {s = cards n.s from_Prep loc.s ; ref = cards_ref_NP ;
      value = val "select" loc.value n.value ;
      lock_Set = <>} ;

    -- <Set> if <BoolExpr>, <Set> si <BoolExpr>
    -- ConditionalSet : Set -> BoolExpr -> Set ;
    ConditionalSet set con = {s = mkNP set.s (mkAdv if_Subj con.s) ; ref = set.ref ;
      value = val "conditional" con.value set.value ;
      lock_Set = <>} ;


  -- MORPHOLOGY
  lincat
    SimpleInst = {s : S ; ref : NP ; value : Dict ; lock_SimpleInst : {}} ;
    DependentInst = {s : ListS ; value : Dict ; lock_DependentInst : {}} ;
    IndependentInst = {s : ListS ; value : Dict ; lock_IndependentInst : {}} ;
    Instruction = {s : S ; value : Dict ; lock_Instruction : {}} ;
    Rule = {s : S ; value : Dict ; lock_Rule : {}} ;
    Description = {s : Text ; value : Str ; lock_Description : {}} ; 
    Begin = {s : Str ; value : Str ; lock_Begin : {}} ;

  lin
    -- INSTRUCTION
    -- your opponent draws 2 cards | etc
    -- tu oponente roba 2 cartas | etc
    -- UseSimpleInst : Player -> Action -> Set -> SimpleInst ;
    UseSimpleInst player action set = {s = inst player.s action.s set.s ;
      ref = set.ref ;
      value = val action.value player.value set.value ;
      lock_SimpleInst = <>} ;

    -- SimpleInstruction : SimpleInst -> Instruction ;
    SimpleInstruction i = {s = i.s ; value = i.value ; lock_Instruction = <>} ;

    -- your opponent draws 2 cards and they discard them | etc
    -- tu oponente roba 2 cartas y las descarta | etc
    -- UseDependentInst : Player -> Action -> SimpleInst -> DependentInst ;
    UseDependentInst player action i = {s = mkListS i.s (inst player.s action.s i.ref) ;
      value = val "and" i.value (val action.value player.value i.value) ;
      lock_DependentInst = <>} ;

    -- DependentInstruction : DependentInst -> Instruction ;
    DependentInstruction i = {s = mkS and_Conj i.s ; value = i.value ; lock_Instruction = <>} ;

    -- your opponent draws 2 cards and they discard a card | etc
    -- tu oponente roba 2 cartas y éste descarta una carta | etc
    -- UseIndependentInst : SimpleInst -> SimpleInst -> IndependentInst ;
    UseIndependentInst i j = {s = mkListS i.s j.s ; value = val "and" i.value j.value ;
      lock_IndependentInst = <>} ;

    -- IndependentInstruction : IndependentInst -> Instruction ;
    IndependentInstruction i = {s = mkS and_Conj i.s ; value = i.value ; lock_Instruction = <>} ;

    -- your opponent discards a card, they draw 2 cards and they reveal them | etc
    -- tu oponente descarta una carta, éste roba 2 cartas y éste las revela | etc
    -- TripleDependentInst : SimpleInst -> DependentInst -> Instruction ;
    TripleDependentInst i j = {s = mkS and_Conj (mkListS i.s j.s) ;
      value = val "and" i.value j.value ;
      lock_Instruction = <>} ;

    -- your opponent discards a card, they draw a card and they reveal a card | etc
    -- tu oponente descarta una carta, éste roba una carta y éste revela una carta | etc
    -- TripleIndependentInst : SimpleInst -> IndependentInst -> Instruction ;
    TripleIndependentInst i j = {s = mkS and_Conj (mkListS i.s j.s) ;
      value = val "and" i.value j.value ;
      lock_Instruction = <>} ;

    -- RULE
    -- you draw 2 cards | etc, tú robas 2 cartas | etc
    -- SimpleRule : Instruction -> Rule ;
    SimpleRule i = {s = i.s ;
      value = val "conditional" (val "event" (val "play" (
        val "player" "active") (val "this"))) i.value ;
      lock_Rule = <>} ;

    -- if <BoolExpr> then <Instruction>, si <BoolExpr> entonces <Instruction>
    -- ConditionRule : BoolExpr -> Instruction -> Rule ;
    ConditionRule con ins = {s = mkS condition_Conj con.s ins.s ;
      value = val "conditional" (val "event" (val "play" (val "player" "active")
        (val "this"))) (val "conditional" con.value ins.value) ;
      lock_Rule = <>} ;
    
    -- TriggerRule : Event -> Instruction -> Rule ;
    TriggerRule eve ins = {s = mkS trigger_Conj eve.s ins.s ;
      value = val "conditional" eve.value ins.value ;
      lock_Rule = <>} ;

    -- when <Trigger> : if <BoolExpr> then <Instruction>
    -- TriggerConditionRule : Event -> BoolExpr -> Instruction -> Rule ;
    TriggerConditionRule eve con ins = {s = mkS trigger_Conj eve.s (mkS condition_Conj con.s ins.s) ;
      value = val "conditional" eve.value (val "conditional" con.value ins.value) ;
      lock_Rule = <>} ;

    -- <Rule>. <Description>
    -- AddRule : Rule -> Description -> Description ;
    AddRule r d = {s = mkText (mkUtt r.s) fullStopPunct d.s ;
      value = (str r.value) ++ BIND ++ "," ++ d.value ;
      lock_Description = <>} ;

    -- <Rule>.
    -- UseRule : Rule -> Description ;
    UseRule rule = {s = mkText rule.s ;
      value = str rule.value ;
      lock_Description = <>};


  -- SYNTAX HELPERS
  oper
    cards = overload {
      -- a card
      cards : NP = mkNP a_Det card_N ;
      -- 2 cards | 3 cards | ...
      cards : Digits -> NP = \x -> mkNP (mkDet x) card_N ;
      -- as many cards as the size of your hand | etc
      cards : NP -> NP = \x -> mkNP (mkNP as_many_Det card_N) (mkAdv as_Prep x) ;
      -- a card from your hand | etc
      cards : Prep -> NP -> NP = \prep, mod ->
        mkNP (mkNP a_Det card_N) (mkAdv prep mod) ;
      -- all the cards from your hand | etc
      cards : Predet -> Prep -> NP -> NP = \predet, prep, mod ->
        mkNP (mkNP predet (mkNP thePl_Det card_N)) (mkAdv prep mod) ;
      -- 2 cards from your hand | etc
      cards : Digits -> Prep -> NP -> NP = \x, prep, mod ->
        mkNP (mkNP (mkDet x) card_N) (mkAdv prep mod) ;
      -- as many cards from your deck as the size of your hand | etc
      cards : NP -> Prep -> NP -> NP = \x, prep, mod -> mkNP (mkNP (mkNP as_many_Det card_N)
        (mkAdv prep mod)) (mkAdv as_Prep x)
    } ;

    expr = overload {
      -- the size of your hand is equal to the size of your deck, etc
      expr : NP -> A2 -> NP -> Cl = \p, rel, q -> mkCl p rel q ;
      -- you don't play a card, etc
      expr : Pol -> Cl -> S = \pol, p -> mkS presentTense simultaneousAnt pol p ;
      -- you play a card or the size of your deck isn't more than 5, etc
      expr : Pol -> Cl -> Conj -> Pol -> Cl -> S = \polp, p, op, polq, q ->
        mkS op (mkS presentTense simultaneousAnt polp p) (
          mkS presentTense simultaneousAnt polq q)
    } ;

    -- your opponent draws 2 cards | etc
    -- tu oponente roba 2 cartas | etc
    inst : NP -> V2 -> NP -> S ;
    inst player_np action_v2 set_np = mkS presentTense simultaneousAnt positivePol (
      mkCl player_np action_v2 set_np) ;
}
