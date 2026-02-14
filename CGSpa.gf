concrete CGSpa of CG = CGI with
    (Syntax = SyntaxSpa), (Extend = ExtendSpa), (LexCG = LexCGSpa) ** {

  oper
    possessive = overload {
      -- la posesión del dueño
      possessive : NP -> N -> NP = \owner, owned ->
        mkNP (mkNP the_Det owned) (mkAdv possess_Prep owner) ;
      -- la posesión del dueño
      possessive : NP -> CN -> NP = \owner, owned ->
        mkNP (mkNP the_Det owned) (mkAdv possess_Prep owner) ;
      -- la posesión del dueño
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
