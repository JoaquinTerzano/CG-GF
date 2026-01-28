abstract Base = {
  flags startcat = TestBase;

  -- NATURAL NUMBERS
  cat
    Nat; -- natural number
    NatTerm; -- natural number term
    NatExpr; -- natural number expression

  fun
    -- Hardcodeados porque no queda otra
    n1,  n2,  n3,  n4,  n5,  n6,  n7,  n8,  n9,  n10,
    n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
    n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
    n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
    n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
    n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
    n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
    n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
    n91, n92, n93, n94, n95, n96, n97, n98, n99: Nat;

    -- EXPRESSION
    -- X plus Y, X más Y
    Add: NatTerm -> NatTerm -> NatExpr;
    -- X times Y, X por Y
    Multiply: NatTerm -> NatTerm -> NatExpr;

    -- RELATION
    -- less than / menor a
    Less: NatExpr -> NatExpr -> BoolTerm;
    -- more than / mayor a
    More: NatExpr -> NatExpr -> BoolTerm;
    -- equal to / igual a
    Equal: NatExpr -> NatExpr -> BoolTerm;
    -- not equal to / distinto a
    NotEq: NatExpr -> NatExpr -> BoolTerm;
    -- less than or equal to / menor o igual a
    LessEq: NatExpr -> NatExpr -> BoolTerm;
    -- more than or equal to / mayor o igual a
    MoreEq: NatExpr -> NatExpr -> BoolTerm;

  -- QUANTIFIER
  cat
    Quantifier;

  fun
    -- a, 2, 3, ... / un, 2, 3, ...
    NatQuant: Nat -> Quantifier;
    -- all / todos
    AllQuant: Quantifier;
    -- at least X / al menos X
    AtLeast: Nat -> Quantifier;
    -- at most X / a lo sumo X
    AtMost: Nat -> Quantifier;

  -- BOOLEAN
  cat
    BoolTerm; -- boolean term
    BoolExpr; -- boolean expression

  fun
    -- EXPRESSION
    -- P and Q / P y Q
    BoolAnd: BoolTerm -> BoolTerm -> BoolExpr;
    -- P or Q / P o Q
    BoolOr: BoolTerm -> BoolTerm -> BoolExpr;
    -- not P or not Q
    BoolNand: BoolTerm -> BoolTerm -> BoolExpr;
    -- not P and not Q
    BoolNor: BoolTerm -> BoolTerm -> BoolExpr;

  -- TEST
  cat
    TestBase;
  
  fun
    TestNatExpr: Nat -> NatExpr;
    TestBoolExpr: BoolExpr -> TestBase;
}