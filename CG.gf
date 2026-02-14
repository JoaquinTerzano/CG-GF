abstract CG = open Syntax in {
  flags
    startcat = Begin ;
    coding = utf8 ;


  -- NATURAL
  cat
    Nat ; -- Digits
    NatTerm ; -- NP
    NatExpr ; -- NP
    NatOper ; -- Prep
    NatRel ; -- A2

  fun
    -- Hay que hardcodear los números
    -- 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
    n2, n3, n4, n5, n6, n7, n8, n9 : Nat ;

    -- TERM
    -- <Nat> cards, <Nat> cartas
    Number : Nat -> NatTerm ;
    -- the size of <Location>, el tamaño de <Location>
    Size : Location -> NatTerm ;

    -- EXPRESSION
    -- <NatTerm>
    NatExpr1 : NatTerm -> NatExpr ;
    -- <NatTerm> <NatOper> <NatTerm>
    NatExpr2 : NatTerm -> NatOper -> NatTerm -> NatExpr ;

    -- FUNCTION
    -- plus, más
    NatAdd : NatOper ;
    -- times, por
    NatMult : NatOper ;
    -- less than, menor que
    NatLess : NatRel ;
    -- more than, mayor que
    NatMore : NatRel ;
    -- equal to, igual a
    NatEqual : NatRel ;
    -- not equal to, distinto de
    NatNotEqual : NatRel ;
    -- at most, como mucho
    NatLessEqual : NatRel ;
    -- at least, como mínimo
    NatMoreEqual : NatRel ;


  -- BOOLEAN
  cat
    BoolTerm ; -- Cl
    BoolExpr ; -- S
    BoolOper ; -- Conj
    BoolPol ; -- Pol
    Event ; -- S

  fun
    -- TERM
    -- <NatExpr> is <NatRel> <NatExpr>, <NatExpr> es <NatRel> <NatExpr>
    Compare : NatExpr -> NatRel -> NatExpr -> BoolTerm ;
    -- <Location> (is | isn't) empty, <Location> (está | no está) (vacío | vacía)
    Empty : Location -> BoolTerm ;
    -- you play this card | etc, tú juegas esta carta | etc
    Trigger : Action -> Event ;

    -- EXPRESSION
    -- p (is | isn't) q, p (es | está | no es | no está) q
    BoolExpr1 : BoolPol -> BoolTerm -> BoolExpr ;
    -- p (is | isn't) q <BoolOper> r (is | isn't) s
    -- p (es | está | no es | no está) q <BoolOper> r (es | está | no es | no está) s
    BoolExpr2 : BoolPol -> BoolTerm -> BoolOper -> BoolPol -> BoolTerm -> BoolExpr ;

    -- FUNCTION
    -- or, o
    BoolOr : BoolOper ;
    -- either ... or ..., o ... o ...
    BoolXor : BoolOper ;
    -- and, y
    BoolAnd : BoolOper ;
    -- negativePol
    BoolNot : BoolPol ;
    -- positivePol
    BoolPass : BoolPol ;


  -- CONTEXT
  cat
    Set ; -- NP
    Player ; -- NP
    Action ; -- V2
    Location ; -- NP

  fun
    -- PLAYER
    -- you, tú
    ActivePlayer : Player ;
    -- your opponent, tu oponente
    InactivePlayer : Player ;

    -- ACTION
    -- play, jugar
    PlayAction : Action ;
    -- draw, robar
    DrawAction : Action ;
    -- discard, descartar
    DiscardAction : Action ;
    -- reveal, revelar
    RevealAction : Action ;

    -- LOCATION
    -- (your | your opponent's) hand, tu mano | la mano de tu oponente
    HandLocation : Player -> Location ;
    -- (your | your opponent's) deck, tu mazo | el mazo de tu oponente
    DeckLocation : Player -> Location ;
    -- (your | your opponent's) discard pile, tu pila de descarte | la pila de descarte de tu oponente
    -- tu pila de descarte | la pila de descarte de tu oponente
    DiscardPileLocation : Player -> Location ;

    -- SET
    -- this card, esta carta
    ThisCard : Set ;
    -- a card from <Location>, una carta de <Location>
    CardLocation : Location -> Set ;
    -- all the cards from <Location>, todas las cartas de <Location>
    AllLocation : Location -> Set ;
    -- <Nat> cards from <Location>, <Nat> cartas de <Location>
    NatLocation : Nat -> Location -> Set ;
    -- as many cards as <NatExpr> from <Location>
    -- tantas cartas como <NatExpr> de <Location>
    NatExprLocation : NatExpr -> Location -> Set ;
    -- <Set> if <BoolExpr>, <Set> si <BoolExpr>
    ConditionalSet : Set -> BoolExpr -> Set ;


  -- MORPHOLOGY
  cat
    SimpleInst ; -- S
    DependentInst ; -- [S] {2}
    IndependentInst ; -- [S] {2}
    Instruction ; -- S
    Rule ; -- S
    Description ; -- Text
    Begin ; -- Str

  fun
    -- INSTRUCTION
    -- your opponent draws 2 cards | etc
    -- tu oponente roba 2 cartas | etc
    UseSimpleInst : Player -> Action -> Set -> SimpleInst ;
    SimpleInstruction : SimpleInst -> Instruction ;
    -- your opponent draws 2 cards and they discard them | etc
    -- tu oponente roba 2 cartas y las descarta | etc
    UseDependentInst : Player -> Action -> SimpleInst -> DependentInst ;
    DependentInstruction : DependentInst -> Instruction ;
    -- your opponent draws 2 cards and they discard a card | etc
    -- tu oponente roba 2 cartas y éste descarta una carta | etc
    UseIndependentInst : SimpleInst -> SimpleInst -> IndependentInst ;
    IndependentInstruction : IndependentInst -> Instruction ;
    -- your opponent discards a card, they draw 2 cards and they reveal them | etc
    -- tu oponente descarta una carta, éste roba 2 cartas y éste las revela | etc
    TripleDependentInst : SimpleInst -> DependentInst -> Instruction ;
    -- your opponent discards a card, they draw a card and they reveal a card | etc
    -- tu oponente descarta una carta, éste roba una carta y éste revela una carta | etc
    TripleIndependentInst : SimpleInst -> IndependentInst -> Instruction ;

    -- RULE
    -- draw 2 cards | etc, roba 2 cartas | etc
    SimpleRule : Instruction -> Rule ;
    -- if <BoolExpr> then <Instruction> | si <BoolExpr> entonces <Instruction>
    ConditionRule : BoolExpr -> Instruction -> Rule ;
    -- when <Trigger> : <Instruction>
    TriggerRule : Event -> Instruction -> Rule ;
    -- when <Trigger> : if <BoolExpr> then <Instruction>
    TriggerConditionRule : Event -> BoolExpr -> Instruction -> Rule ;
    -- <Rule>. <Description>
    AddRule : Rule -> Description -> Description ;
    -- <Rule>.
    UseRule : Rule -> Description ;
    -- <Description>.
    UseBegin : Description -> Begin ;
}
