# Introducción

El proyecto consiste en diseñar el sistema de un juego de cartas y crear una gramática formal para el lenguaje de las descripciones de las cartas, que describen reglas que afectan al juego.

Se definirá un lenguaje natural controlado, es decir, un lenguaje formal subconjunto de un lenguaje natural con restricciones de léxico y de sintaxis.

Se utilizará la herramienta [**Grammatical Framework (GL)**](https://www.grammaticalframework.org/) diseñada para generar lenguajes naturales junto con la [**Resource Grammar Library (RGL)**](https://github.com/GrammaticalFramework/gf-rgl), una librería extensa con constructores léxicos y sintácticos inteligentes que resuelven la concordancia de muchos idiomas, incluidos el inglés y el español.

Las cadenas generadas por el lenguaje serán convertidas, por medio de atributos que se definen en las reglas de producción de la gramática, a un archivo JSON con el siguiente formato:

```
[{ "func": ..., "args": ... }, ...]
```

utilizando los siguientes tipos:

- `str` es una palabra clave.
- `int` es un entero no negativo.
- `dict` es un registro con dos campos: `func: str` y `args: list`.
- `list` es una secuencia de elementos de cualquiera de los tipos mencionados.

Este formato está pensado para usarse como entrada de un intérprete que programa instrucciones utilizando un paradigma puramente funcional. Este enfoque viene dado por el estilo lingüístico que se adopta comúnmente en este tipo de lenguajes.

# Modelo general

Cuando *se activa* una carta, un programa controlador ejecuta su *descripción*. La descripción es una secuencia de *reglas* que tienen un impacto en el juego. Las reglas son declaraciones de *instrucciones* sujetas a *condiciones*. El siguiente grafo muestra la jerarquía general del lenguaje:

```mermaid
graph TD;
    A[Description] --> B[Rule];
    B --> D[Trigger];
    B --> E[Condition];
    B --> F[Instruction];
```

Las condiciones son funciones booleanas. Los *activadores* son condiciones que evalúan el *evento* que activó la carta.

Las *acciones* son funciones que modifican el estado del juego. Las instrucciones y eventos son llamadas a una acción con ciertos argumentos, que pueden incluir

- Constantes con un tipo determinado, como `str` o `int`.
- Otras funciones que retornar referencias a objetos del juego como *jugadores* y *conjuntos* de cartas.

Un ejemplo de una descripción es:

> Cuando tú descartas esta carta: tú robas una carta de tu mazo. Si tu mano está vacía, tú robas una carta de tu mazo.

Está compuesta por dos reglas independientes:

1. *Cuando tú descartas esta carta: tú robas una carta de tu mazo.* El sujeto *tú* es el jugador que activó la carta. La instrucción *tú robas una carta de tu mazo* se ejecuta si la carta fue descartada.
2. *Si tu mano está vacía, tú robas una carta de tu mazo.* En esta regla se omite el activador. Esto se interpreta de forma equivalente a decir *cuando tú juegas esta carta*. La condición *tu mano está vacía* se evalúa después de validar el activador.

# Funciones

En esta sección se definen todas las funciones contempladas en el lenguaje y sus argumentos. Los tipos retornados son los siguientes:

- `nat` es un término o expresión natural.
- `bool` es un término o expresión booleana.
- `context` es una referencia a una entidad del juego.

Las funciones son de tipo `dict` que contiene el nombre de una función y los argumentos entregados. 

## Naturales

Funciones que retornan un término o expresión natural.

### Términos

```
natural: A natural number.

    Args:
        x (int): a natural number.

    Returns (nat): x.


size: The cardinal of a set of cards.

    Args:
        set (context): a set of cards.

    Returns (nat): the cardinal of that set.
```

### Expresiones

```
add: Add two natural terms.

    Args:
        x (nat): a natural term.
        y (nat): a natural term.

    Returns (nat): x + y.


multiply: Multiply two natural terms.

    Args:
        x (nat): a natural term.
        y (nat): a natural term.

    Returns (nat): x * y.
```

## Booleanas

Funciones que retornan un término o expresión booleana.

### Términos

```
less: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x < y.


more: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x > y.


equal: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x == y.


not_equal: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x != y.


less_equal: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x <= y.


more_equal: Compare two natural terms or expressions.

    Args:
        x (nat): a natural term or expression.
        y (nat): a natural term or expression.

    Returns (bool): x >= y.


empty: Guess if a set is empty.

    Args:
        set (context): a set of cards.

    Returns (bool): that set is empty.


event: Guess the event that activated this card.

    Args:
        action (context): the action that activated this card.

    Returns (bool): that action activated this card.
```

### Expresiones

```
pass: Pass a boolean term.

    Args:
        p (bool): a boolean term.

    Returns (bool): x.


not: Negate a boolean term.

    Args:
        p (bool): a boolean term.

    Returns (bool): not x.


or: Add two boolean terms.

    Args:
        p (bool): a boolean term.
        q (bool): a boolean term.

    Returns (bool): p or q.


and: Multiply two boolean terms.

    Args:
        p (bool): a boolean term.
        q (bool): a boolean term.

    Returns (bool): p and q.


xor: Compare two boolean terms.

    Args:
        p (bool): a boolean term.
        q (bool): a boolean term.

    Returns (bool): p != q.
```

## De contexto

Funciones que retornan una referencia a una entidad del juego.

### Jugadores

Función que retorna un jugador.

```
player: A player.

    Args:
        role (str): active or inactive.

    Returns (context): the player with that role.
```

### Conjuntos

Funciones que retornan un conjunto de cartas.

```
this: This card.

    Returns (context): this card.


location: A set assigned to a player.

    Args:
        name (str): hand, deck or discard_pile.
        player (context): a player.

    Returns (context): the set with that name assigned to that player.


select: A subset with a fixed size.

    Args:
        set (context): a set of cards.
        size (nat): a natural term or expression.

    Returns (context): a subset of that set with that size.


conditional: A conditional set or action.

    Args:
        condition (bool): a boolean term or expression.
        set (context): a set of cards.

    Return (context): that set if the condition holds. Otherwise, the empty set.
```

### Acciones

Funciones que tienen un efecto en el juego.

```
play: A player activates one or more cards, then moves them to their discard pile.

    Args:
        player (context): a player.
        set (context): a set of cards.

    Returns (context): that set.


draw: A player moves one or more cards to their hand.

    Args:
        player (context): a player.
        set (context): a set of cards.

    Returns (context): that set.


discard: A player moves one or more cards to their discard pile.

    Args:
        player (context): a player.
        set (context): a set of cards.

    Returns (context): that set.


reveal: A player reveals one or more cards to their opponent.

    Args:
        player (context): a player.
        set (context): a set of cards.

    Returns (context): that set.
```

# Gramática

Para definir gramáticas en GL se recomienda partir de una **sintaxis abstracta** donde se declaran **categorías** que reflejan la semántica del lenguaje, y **funciones** que representan las reglas producción.

Posteriormente se define una **sintaxis concreta** de cada idioma, donde se termina de definir la sintaxis mediante la **linearización** de las funciones. Es recomendable crear las linearizaciones a partir de los constructores de la RGL, definidos [aquí](https://www.grammaticalframework.org/lib/doc/synopsis/).

Para mantener una estructura ordenada, se recomienda crear **módulos de recursos** que definen constructores personalizados, y **módulos léxicos** que declaran de las palabras. La sintaxis común a todos los idiomas se puede definir en un archivo de **sintaxis concreta incompleta**.

## Estructura de archivos

- `CG.gf` define la sintaxis abstracta.
- `CGI.gf`, `CGEng.gf` y `CGSpa.gf` definen la sintaxis concreta.
- `Lex.gf`, `LexEng.gf` y `LexSpa.gf` definen el léxico.
- `Func.gf` define constructores de atributos con el formato JSON propuesto.

## Restricciones

La gramática implementa todas las funciones definidas en la sección *Funciones* con ciertas restricciones:

- Los números naturales están hardcodeados de 2 a 9.
- Las funciones `size`, `empty` y `select` solo acepta ubicaciones (tu mano, etc) como conjunto.
- Las expresiones naturales y booleanas relacionan hasta dos términos.
- Los eventos están limitados a cualquier acción realizada por el jugador activo sobre la carta activada.
- El conjunto de una acción puede ser una acción cuyo conjunto no es una acción.
- Una regla puede contener un activador, una condición y hasta tres instrucciones.

# Guía de pruebas

Esta sección contiene contiene información de ayuda para probar la gramática, ya sea desde una terminal de GF o desde un cuaderno de Jupyter.

## Usar la terminal de GF

Para usar la terminal de GF, primero hay que instalar tanto **GF Core** como la **Resource Grammar Library (RGL)**. Los pasos a seguir se encuentran [aquí](https://www.grammaticalframework.org/download/index-3.12.html).

Luego de instalarlos, se puede probar la gramática desde una terminal de GF en el directorio raíz del proyecto usando los siguientes comandos:

El comando `i` compila una gramática de un archivo `.gf` y la importa para usarla en la terminal.

```bash
i CGEng.gf
i CGSpa.gf
```

El comando `gr` genera un árbol sintáctico aleatorio. El parámetro `-depth` limita la profundidad máxima del árbol. El comando `l` lineariza un árbol sintáctico. El parámetro `-unlextext` revierte la tokenización de la cadena, `-table` muestra el valor de la cadena en formato JSON y `-treebank` muestra el árbol sintáctico.

```
gr -depth=5 | l -unlextext -table -treebank
```

El comando `p` parsea una cadena de tokens.

```
input: p "you draw 2 cards from your deck ."

output: UseBegin (UseRule (SimpleRule (SimpleInstruction (UseSimpleInst ActivePlayer DrawAction (NatLocation n2 DeckActiveLocation)))))
```

Mientras se ingresa la cadena, se pueden ver todas las posibles derivaciones del siguiente token presionando la tecla `Tab`.

```
CG> p ""
if    when  you   your

CG> p "you "
discard  draw     play     reveal

CG> p "you draw "
2     3     4     5     6     7     8     9     a     all   an    as    this

CG> p "you draw 2 cards from your "
deck        discard     hand        opponent's

CG> p "you draw 2 cards from your deck "
,    .    and  if

CG> p "you draw 2 cards from your deck ."

UseBegin (UseRule (SimpleRule (SimpleInstruction (UseSimpleInst ActivePlayer DrawAction (NatLocation n2 DeckActiveLocation)))))
```

El comando `ps -lextext` convierte una cadena de texto en una cadena de tokens.

```
ps -lextext "Tu oponente roba 2 cartas de tu mazo y tu oponente las descarta." | p | l -unlextext -table -treebank
```

## Usar Jupyter

El [**binder**](https://github.com/GrammaticalFramework/gf-binder) de GF es una herramienta para usar GF desde un cuaderno de Jupyter sin instalarlo. Simplemente hay que acceder [aquí](https://mybinder.org/v2/gh/GrammaticalFramework/gf-binder/master) para crear una instancia del binder.

En éste repositorio se incluye el archivo de Jupyter `CG.ipynb` que se puede subir al binder para probar la gramática. Solo incluye la versión en inglés ya que el léxico en español utiliza módulos de la RGL que el binder no soporta.

Hay que ejecutar las celdas con los módulos de la gramática en el orden en que aparecen. Luego se puede escribir un comando de la terminal de GF en una celda y ejecutarla.
