Para probar desde la terminal de GF:

```
> i BaseEng.gf
> i BaseSpa.gf
```

Para generar cadenas aleatorias y su valor en formato JSON:

```
> gr | l -unlextext -table
```

### Ejemplos

#### Ejemplo 1

Inglés: The inactive player draws 82 cards from the deck of the inactive player

Español: El jugador inactivo roba 82 cartas del mazo del jugador inactivo

```json
{
  "func": "draw",
  "args": [
    {
      "func": "player",
      "args": ["inactive"]
    },
    {
      "func": "deck",
      "args": [
        {
          "func": "player",
          "args": ["inactive"]
        }
      ]
    },
    {
      "func": "natural",
      "args": [82]
    }
  ]
}
```

#### Ejemplo 2

Inglés: The active player draws every card from the deck of the active player

Español: El jugador activo roba cada carta del mazo del jugador activo

```json
{
  "func": "draw",
  "args": [
    {
      "func": "player",
      "args": ["active"]
    },
    {
      "func": "deck",
      "args": [
        {
          "func": "player",
          "args": ["active"]
        }
      ]
    },
    {
      "func": "logical",
      "args": ["all"]
    }
  ]
}
```

#### Ejemplo 3

p "if the size of the hand of the active player is equal to the size of the hand of the active player , the active player draws 2 cards from the deck of active player"
Inglés: 8 units aren't distinct from 77 units or 7 units aren't equal to 70 units

Español: 8 unidades no son distintas de 77 unidades o 7 unidades no son iguales a 70 unidades

```json
{
  "func": "not",
  "args": [
    {
      "func": "and",
      "args": [
        {
          "func": "!=",
          "args": [
            {
              "func": "natural",
              "args": [8]
            },
            {
              "func": "natural",
              "args": [77]
            }
          ]
        },
        {
          "func": "==",
          "args": [
            {
              "func": "natural",
              "args": [7]
            },
            {
              "func": "natural",
              "args": [70]
            }
          ]
        }
      ]
    }
  ]
}
```
