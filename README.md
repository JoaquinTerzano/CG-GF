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

Inglés: 15 units are equal to 17 units or 25 units are distinct from 60 units

Español: 15 unidades son iguales a 17 unidades o 25 unidades son distintas de 60 unidades

```json
{
  "func": "or",
  "args": [
    {
      "func": "==",
      "args": [
        {
          "func": "natural",
          "args": [15]
        },
        {
          "func": "natural",
          "args": [17]
        }
      ]
    },
    {
      "func": "!=",
      "args": [
        {
          "func": "natural",
          "args": [25]
        },
        {
          "func": "natural",
          "args": [60]
        }
      ]
    }
  ]
}
```

#### Ejemplo 2

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
