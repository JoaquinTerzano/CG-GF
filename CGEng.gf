concrete CGEng of CG = CGI with
    (Syntax = SyntaxEng),
    (Extend = ExtendEng),
    (LexCG = LexCGEng) ** open (P = ParadigmsEng), Prelude in {

  oper
    possessive = overload {
      -- the owner's possession
      possessive : NP -> N -> NP = \owner, owned ->
        mkNP (GenNP owner) owned ;
      -- the owner's possession
      possessive : NP -> CN -> NP = \owner, owned ->
        mkNP (GenNP owner) owned ;
      -- the possession of the owner
      possessive : NP -> NP -> NP = \owner, owned ->
        mkNP owned (mkAdv possess_Prep owner) ;
    } ;

  lin
    -- <Description>.
    -- UseBegin : Description -> Begin ;
    UseBegin description = {s = description.s.s ;
      value = "[ " ++ BIND ++ description.value ++ BIND ++ "]";
      lock_Begin = <>};
}
