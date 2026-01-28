concrete BaseSpa of Base = BaseI with
		(Syntax = SyntaxSpa), (LexBase = LexBaseSpa) ** {

  -- TEST
  lincat
    TestBase = {s: Str; value: Str};

  lin
    TestNatExpr n = {s = mkNP (mkDet n.s) unit_N; value = {func = "natural"; args = n.value}; lock_NatExpr = <>};
    TestBoolExpr x = {s = (x.s).s ! Indic; value = str x.value};
}