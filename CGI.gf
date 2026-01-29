incomplete concrete CGI of CG =
    open Syntax, LexCG, Prelude, CommonRomance in {

  -- DATA
  oper
    -- BIND es un token especial en GF que evita el espacio entre tokens
    bind: Str -> Str -> Str = \x,y -> x ++ BIND ++ y;
    
    -- Función para poner comillas: "texto"
    quote: Str -> Str = \s -> "\"" ++ BIND ++ s ++ BIND ++ "\"";

    -- Función auxiliar para crear "clave":"valor"
    kv: Str -> Str -> Str = \k,v -> quote k ++ bind ":" v;

    -- Generador de JSON: {"func":"nombre", "args":[...]}
    str: {func: Str; args: Str} -> Str = \dict -> 
      "{" ++ BIND ++ 
      kv "func" (quote dict.func) ++ BIND ++ "," ++ BIND ++ 
      kv "args" ("[" ++ BIND ++ dict.args ++ BIND ++ "]") ++ BIND ++ 
      "}";

    -- Auxiliar para separar argumentos con coma sin espacios: arg1,arg2
    comma: Str -> Str -> Str = \x,y -> x ++ BIND ++ "," ++ BIND ++ y;

  -- NATURAL NUMBERS
  lincat
    Nat = {s: Digits; value: Str; lock_Nat: {}}; 
    NatTerm = {s: NP; value: {func: Str; args: Str}; lock_NatTerm: {}}; 
    NatExpr = {s: NP; value: {func: Str; args: Str}; lock_NatExpr: {}}; 

  oper
    -- 1, 2, ..., 99
    mkNat: Str -> Nat = \s -> {s = mkDigits s; value = s; lock_Nat = <>};

    -- X + Y, etc
    mkNatExpr: Str -> Prep -> NatTerm -> NatTerm -> NatExpr = 
      \symbol, prep, x, y -> {
        s = mkNP x.s (mkAdv prep y.s);
        value = {func = symbol; args = comma (str x.value) (str y.value)};
        lock_NatExpr = <>
      };

    -- X > Y, etc
    mkBoolTerm: Str -> A2 -> NatExpr -> NatExpr -> BoolTerm = 
      \symbol, adj, x, y -> {
        s = mkCl x.s adj y.s;
        value = {func = symbol; args = comma (str x.value) (str y.value)};
        pol = positivePol;
        lock_BoolTerm = <>
      };

  lin
    -- Hardcodeados porque no queda otra
    n1 = mkNat "1";   n2 = mkNat "2";   n3 = mkNat "3";   n4 = mkNat "4";   n5 = mkNat "5";   n6 = mkNat "6";   n7 = mkNat "7";   n8 = mkNat "8";   n9 = mkNat "9";   n10 = mkNat "10";
    n11 = mkNat "11"; n12 = mkNat "12"; n13 = mkNat "13"; n14 = mkNat "14"; n15 = mkNat "15"; n16 = mkNat "16"; n17 = mkNat "17"; n18 = mkNat "18"; n19 = mkNat "19"; n20 = mkNat "20";
    n21 = mkNat "21"; n22 = mkNat "22"; n23 = mkNat "23"; n24 = mkNat "24"; n25 = mkNat "25"; n26 = mkNat "26"; n27 = mkNat "27"; n28 = mkNat "28"; n29 = mkNat "29"; n30 = mkNat "30";
    n31 = mkNat "31"; n32 = mkNat "32"; n33 = mkNat "33"; n34 = mkNat "34"; n35 = mkNat "35"; n36 = mkNat "36"; n37 = mkNat "37"; n38 = mkNat "38"; n39 = mkNat "39"; n40 = mkNat "40";
    n41 = mkNat "41"; n42 = mkNat "42"; n43 = mkNat "43"; n44 = mkNat "44"; n45 = mkNat "45"; n46 = mkNat "46"; n47 = mkNat "47"; n48 = mkNat "48"; n49 = mkNat "49"; n50 = mkNat "50";
    n51 = mkNat "51"; n52 = mkNat "52"; n53 = mkNat "53"; n54 = mkNat "54"; n55 = mkNat "55"; n56 = mkNat "56"; n57 = mkNat "57"; n58 = mkNat "58"; n59 = mkNat "59"; n60 = mkNat "60";
    n61 = mkNat "61"; n62 = mkNat "62"; n63 = mkNat "63"; n64 = mkNat "64"; n65 = mkNat "65"; n66 = mkNat "66"; n67 = mkNat "67"; n68 = mkNat "68"; n69 = mkNat "69"; n70 = mkNat "70";
    n71 = mkNat "71"; n72 = mkNat "72"; n73 = mkNat "73"; n74 = mkNat "74"; n75 = mkNat "75"; n76 = mkNat "76"; n77 = mkNat "77"; n78 = mkNat "78"; n79 = mkNat "79"; n80 = mkNat "80";
    n81 = mkNat "81"; n82 = mkNat "82"; n83 = mkNat "83"; n84 = mkNat "84"; n85 = mkNat "85"; n86 = mkNat "86"; n87 = mkNat "87"; n88 = mkNat "88"; n89 = mkNat "89"; n90 = mkNat "90";
    n91 = mkNat "91"; n92 = mkNat "92"; n93 = mkNat "93"; n94 = mkNat "94"; n95 = mkNat "95"; n96 = mkNat "96"; n97 = mkNat "97"; n98 = mkNat "98"; n99 = mkNat "99";

    -- EXPRESSION
    NatNatTerm n = {s = mkNP (mkDet n.s) card_N; value = {func = "natural"; args = n.value}; lock_NatTerm = <>};
    NatTermExpr n = {s = n.s; value = n.value; lock_NatExpr = <>}; 
    Add = mkNatExpr "+" plus_Prep;
    Multiply = mkNatExpr "*" times_Prep;

    -- RELATION
    Less = mkBoolTerm "<" less_than_A2;
    More = mkBoolTerm ">" more_than_A2;
    Equal = mkBoolTerm "==" equal_to_A2;
    NotEq = mkBoolTerm "!=" not_equal_to_A2;
    LessEq = mkBoolTerm "<=" less_than_or_equal_to_A2;
    MoreEq = mkBoolTerm ">=" more_than_or_equal_to_A2;

  -- QUANTIFIER
  lincat
    Quantifier = {s: Det; value: {func: Str; args: Str}; lock_Quantifier: {}};

  lin
    NatQuant n = {
      s = mkDet n.s;
      value = {func = "natural"; args = n.value};
      lock_Quantifier = <>
    };

    AllQuant = {
      s = every_Det;
      value = {func = "logical"; args = quote "all"};
      lock_Quantifier = <>
    };

    AtLeast n = {
      s = mkDet (mkCard at_least_AdN (mkCard n.s));
      value = {func = "relational"; args = comma (quote ">=") n.value};
      lock_Quantifier = <>
    };

    AtMost n = {
      s = mkDet (mkCard at_most_AdN (mkCard n.s));
      value = {func = "relational"; args = comma (quote "<=") n.value};
      lock_Quantifier = <>
    };

  -- BOOLEAN
  lincat
    BoolTerm = {s: Cl; value: {func: Str; args: Str}; pol: Pol; lock_BoolTerm: {}}; 
    BoolExpr = {s: S; value: {func: Str; args: Str}; lock_BoolExpr: {}}; 

  oper
    -- Positive
    mkBoolExprPos = overload {
      -- P
      mkBoolExprPos: BoolTerm -> BoolExpr =
        \p -> {
          s = mkS presentTense simultaneousAnt positivePol p.s;
          value = p.value;
          lock_BoolExpr = <>
      };
      -- P or Q, P and Q
      mkBoolExprPos: Str -> Conj -> BoolTerm -> BoolTerm -> BoolExpr = 
        \symbol, conj, p, q -> {
          s = mkS conj (mkS presentTense simultaneousAnt positivePol p.s) 
              (mkS presentTense simultaneousAnt positivePol q.s);
          value = {func = symbol; args = comma (str p.value) (str q.value)};
          lock_BoolExpr = <>
      }
    };

    -- Negative
    mkBoolExprNeg = overload {
      -- not P
      mkBoolExprNeg: BoolTerm -> BoolExpr =
        \p -> {
          s = mkS presentTense simultaneousAnt negativePol p.s;
          value = {func = "not"; args = str p.value};
          lock_BoolExpr = <>
      };
      -- not P or not Q, not P and not Q
      mkBoolExprNeg: Str -> Conj -> BoolTerm -> BoolTerm -> BoolExpr = 
        \symbol, conj, p, q -> {
          s = mkS conj (mkS presentTense simultaneousAnt negativePol p.s) 
              (mkS presentTense simultaneousAnt negativePol q.s);
          value = {
            func = "not";
            args = str {func = symbol; args = comma (str p.value) (str q.value)}};
          lock_BoolExpr = <>
        }
    };

  lin
    Bool = mkBoolExprPos;
    BoolNot = mkBoolExprNeg;
    BoolAnd = mkBoolExprPos "and" and_Conj;
    BoolOr = mkBoolExprPos "or" or_Conj;
    BoolNand = mkBoolExprNeg "and" or_Conj;
    BoolNor = mkBoolExprNeg "or" and_Conj;

  lincat
    Rule = {s: S; value: {func: Str; args: Str}; lock_Rule: {}};
    Action = {s: S; value: {func: Str; args: Str}; lock_Action: {}};
    Player = {s: NP; value: {func: Str; args: Str}; lock_Player: {}};
    Location = {s: NP; value: {func: Str; args: Str}; lock_Location: {}};
    Hand = {s: NP; value: {func: Str; args: Str}; lock_Hand: {}};
    Pile = {s: NP; value: {func: Str; args: Str}; lock_Pile: {}};
    Desc = {s: Str; value: Str};

  oper
    mkCardCN: Location -> CN = \loc ->
      mkCN (mkCN card_N) (mkAdv from_Prep loc.s);
    
    mkCardNP: Location -> Quantifier -> NP = \loc, quant ->
      mkNP quant.s (mkCardCN loc);
    
    mkLocation = overload {
      mkLocation: Hand -> Location = \hand ->
        {s = hand.s; value = hand.value; lock_Location = <>};
      mkLocation: Pile -> Location = \pile ->
        {s = pile.s; value = pile.value; lock_Location = <>};
    };

  lin
    ActivePlayer = {
      s = mkNP the_Det (mkCN active_A player_N);
      value = {func = "player"; args = quote "active"};  -- quote disponible
      lock_Player = <>
    };
    
    InactivePlayer = {
      s = mkNP the_Det (mkCN inactive_A player_N);
      value = {func = "player"; args = quote "inactive"};
      lock_Player = <>
    };

    PlayerHand player = {
      s = mkNP (mkNP the_Det hand_N) (mkAdv possess_Prep player.s);
      value = {func = "hand"; args = str player.value};  -- str disponible
      lock_Hand = <>
    };
    
    PlayerDeck player = {
      s = mkNP (mkNP the_Det deck_N) (mkAdv possess_Prep player.s);
      value = {func = "deck"; args = str player.value};
      lock_Pile = <>
    };
    
    PlayerDiscardPile player = {
      s = mkNP (mkNP the_Det discard_pile_N) (mkAdv possess_Prep player.s);
      value = {func = "discard_pile"; args = str player.value};
      lock_Pile = <>
    };

    HandLocation = mkLocation;
    PileLocation = mkLocation;

    LocationSize loc = {
      s = mkNP (mkNP the_Det size_N) (mkAdv possess_Prep loc.s);
      value = {func = "size"; args = str loc.value};
      lock_NatTerm = <>
    };

    DrawAction player pile n = {
      s = mkS presentTense simultaneousAnt positivePol (
        mkCl player.s draw_V (mkCardNP (mkLocation pile) n));
      value = {
        func = "draw";
        args = comma (str player.value) (comma (str pile.value) (str n.value))  -- comma y str disponibles
      };
      lock_Action = <>
    };
    
    DiscardAction player hand n = {
      s = mkS presentTense simultaneousAnt positivePol (
        mkCl player.s discard_V (mkCardNP (mkLocation hand) n));
      value = {
        func = "discard";
        args = comma (str player.value) (comma (str hand.value) (str n.value))
      };
      lock_Action = <>
    };

    SimpleRule eff = {s = eff.s; value = eff.value; lock_Rule = <>};
    TestBoolExpr con = {s = con.s; value = con.value; lock_Rule = <>};
    ConditionalRule con eff = {
      s = mkS (mkAdv if_Subj con.s) eff.s;
      value = {func = "if"; args = comma (str con.value) (str eff.value)};
      lock_Rule = <>
    };
}