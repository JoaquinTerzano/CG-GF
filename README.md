# System

## Input

The grammar turns the description of a card into a JSON file with the following format:

```
[{ "func": ..., "args": ... }, ...]
```

using the following types:

- `str` is a keyword.
- `int` is a non negative integer.
- `dict` is a register with two fields: `func: str` and `args: list`.
- `list` is a sequence of elements of any type mentioned above.

## Functions

A `dict` contains the name of a function and the arguments given. This section defines all functions and their arguments. The types of the outputs of these functions are the following:

- `nat` is a natural term or expression.
- `bool` is boolean term or expression.
- `context` is a reference to an entity of the game.

### Natural

Functions that return a natural term or expression.

#### Terms

```
natural: A natural number.

    Args:
        x (int): a natural number.

    Returns (nat): x.


size: The cardinal of a set of cards.

    Args:
        domain (context): a set of cards.

    Returns (nat): the cardinal of that set.
```

#### Expressions

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

### Boolean

Functions that return `True` or `False`.

#### Terms

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
```

#### Expressions

```
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


xor: Compare of two boolean terms.

    Args:
        p (bool): a boolean term.
        q (bool): a boolean term.

    Returns (bool): p != q.
```

### Context

Functions that return a reference to an entity of the game.

#### Players

Function that returns a player.

```
player: A player.

    Args:
        role (str): active or inactive.

    Returns (context): the player with that role.
```

#### Domains

Functions that return a set of cards.

```
this: This card.

    Returns (context): this card.


location: A domain assigned to a player.

    Args:
        name (str): hand, deck or discard_pile.
        player (context): a player.

    Returns (context): the domain with that name assigned to that player.


selection: A subset with a fixed size.

    Args:
        domain (context): a set of cards.
        size (nat): a natural term or expression.

    Returns (context): a subset of that domain with that size.


conditional: A conditional domain or action.

    Args:
        condition (bool): a boolean term or expression.
        domain (context): a set of cards.

    Return (context): that domain if the condition holds. Otherwise, the empty set.
```

#### Actions

Functions that have an effect in the game.

```
play: A player activates one or more cards, then moves them to their discard pile.

    Args:
        player (context): a player.
        domain (context): a set of cards.

    Returns (context): that domain.


draw: A player moves one or more cards to their hand.

    Args:
        player (context): a player.
        domain (context): a set of cards.

    Returns (context): that domain.


discard: A player moves one or more cards to their discard pile.

    Args:
        player (context): a player.
        domain (context): a set of cards.

    Returns (context): that domain.


reveal: A player reveals one or more cards to their opponent.

    Args:
        player (context): a player.
        domain (context): a set of cards.

    Returns (context): that domain.
```
