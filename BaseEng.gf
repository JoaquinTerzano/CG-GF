concrete BaseEng of Base = BaseI with
		(Syntax = SyntaxEng), (LexBase = LexBaseEng) ** {

  -- TEST
  lincat
    TestBase = {s: Str; value: Str};

  lin
    TestNatExpr n = {s = mkNP (mkDet n.s) unit_N; value = {func = "natural"; args = n.value}; lock_NatExpr = <>};
    TestBoolExpr x = {s = (x.s).s; value = str x.value};
}