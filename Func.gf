resource Func = open Prelude in {

  oper
    Dict : Type ;
    Dict = {func : Str ; args : Str} ;

    bind : Str -> Str -> Str ;
    bind = \x, y -> x ++ BIND ++ y ;

    quote : Str -> Str ;
    quote = \s -> "\"" ++ BIND ++ s ++ BIND ++ "\"" ;

    key_value : Str -> Str -> Str ;
    key_value = \key, value -> quote key ++ bind ":" value ;

    -- Convertir un Dict en string
    str : Dict -> Str ;
    str = \dict -> 
      "{" ++ BIND ++ 
      key_value "func" (quote dict.func) ++ BIND ++ "," ++ BIND ++ 
      key_value "args" ("[" ++ BIND ++ dict.args ++ BIND ++ "]") ++ BIND ++ 
      "}" ;

    comma : Str -> Str -> Str ;
    comma = \x, y -> x ++ BIND ++ "," ++ BIND ++ y ;

    -- Construir un Dict a partir de distintos argumentos
    dict = overload {
      dict : Str -> Dict = \key -> {func = key ; args = "\"\""} ;

      dict : Str -> Str -> Dict = \key, value -> {func = key ; args = quote value} ;
      
      dict : Str -> Dict -> Dict = \key, dict -> {func = key ; args = str dict} ;

      dict : Str -> Str -> Str -> Dict = \key, value1, value2 -> {func = key ; args = comma (quote value1) (quote value2)} ;

      dict : Str -> Str -> Dict -> Dict = \key, id, dict -> {func = key ; args = comma (quote id) (str dict)} ;

      dict : Str -> Dict -> Dict -> Dict = \key, l, r -> {func = key; args = comma (str l) (str r)} ;

      dict : Str -> Str -> Dict -> Str -> Dict -> Dict = \key, _l, l, _r, r -> {func = key; args = comma (str {func = _l ; args = (str l)})
        (str {func = _r ; args = (str r)})}
    } ;
}
