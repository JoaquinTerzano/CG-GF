# Ejemplos

Este documento contiene ejemplos de descripciones que son aceptadas por la gramática. También se incluyen ejemplos de categorías individuales clasificadas por tipos. Los ejemplos contienen el texto en inglés, en español y su representación en formato JSON.

## Ejemplos de categorías individuales

### Natural

#### NatTerm

> **Eng:** 7 cards

> **Spa:** 7 cartas

```json
{
    "func": "natural",
    "args": "7"
}
```

---

> **Eng:** The size of your discard pile

> **Spa:** El tamaño de tu pila de descarte

```json
{
    "func": "location",
    "args": ["discard_pile", {
        "func": "player",
        "args": ["active"]
    }]
}
```

#### NatExpr

> **Eng:** 6 cards plus the size of your opponent's hand

> **Spa:** 6 cartas más el tamaño de la mano de tu oponente

```json
{
    "func": "add",
    "args": [{
        "func": "natural",
        "args": ["6"]
    }, {
        "func": "size",
        "args": [{
            "func": "location",
            "args": ["hand", {
                "func": "player",
                "args": ["inactive"]
            }]
        }]
    }]
}
```

---

> **Eng:** The size of your discard pile times 2 cards

> **Spa:** El tamaño de tu pila de descarte por 2 cartas

```json
{
    "func": "multiply",
    "args": [{
        "func": "size",
        "args": [{
            "func": "location",
            "args": ["discard_pile", {
                "func": "player",
                "args": ["active"]
            }]
        }]
    }, {
        "func": "natural",
        "args": ["2"]
    }]
}
```

### Boolean

#### BoolTerm

> **Eng:** Your opponent's discard pile is empty

> **Spa:** La pila de descarte de tu oponente está vacía

```json
{
    "func": "empty",
    "args": [{
        "func": "location",
        "args": ["discard_pile", {
            "func": "player",
            "args": ["inactive"]
        }]
    }]
}
```

---

> **Eng:** The size of your opponent's hand is more than the size of your discard pile

> **Spa:** El tamaño de la mano de tu oponente es mayor al tamaño de tu pila de descarte

```json
{
    "func": "more",
    "args": [{
        "func": "size",
        "args": [{
            "func": "location",
            "args": ["hand", {
                "func": "player",
                "args": ["inactive"]
            }]
        }]
    }, {
        "func": "size",
        "args": [{
            "func": "location",
            "args": ["discard_pile", {
                "func": "player",
                "args": ["active"]
            }]
        }]
    }]
}
```

#### BoolExpr

> **Eng:** 6 cards aren't distinct from 8 cards

> **Spa:** 6 cartas no son distintas de 8 cartas

```json
{
    "func": "not",
    "args": [{
        "func": "not_equal",
        "args": [{
            "func": "natural",
            "args": ["6"]
        }, {
            "func": "natural",
            "args": ["8"]
        }]
    }]
}
```

---

> **Eng:** Your opponent's deck is empty

> **Spa:** El mazo de tu oponente está vacío

```json
{
    "func": "pass",
    "args": [{
        "func": "empty",
        "args": [{
            "func": "location",
            "args": ["deck", {
                "func": "player",
                "args": ["inactive"]
            }]
        }]
    }]
}
```

#### Event

> **Eng:** You reveal this card

> **Spa:** Tú revelas esta carta

```json
{
    "func": "event",
    "args": [{
        "func": "reveal",
        "args": [{
            "func": "player",
            "args": ["active"]
        }, {
            "func": "this",
            "args": [""]
        }]
    }]
}
```

### Context

#### Player

> **Eng:** You

> **Spa:** Tú

```json
{
    "func": "player",
    "args": ["active"]
}
```

---

> **Eng:** Your opponent

> **Spa:** Tu oponente

```json
{
    "func": "player",
    "args": ["inactive"]
}
```

#### Location

> **Eng:** Your hand

> **Spa:** Tu mano

```json
{
    "func": "location",
    "args": ["hand", {
        "func": "player",
        "args": ["active"]
    }]
}
```

---

> **Eng:** Your opponent's discard pile

> **Spa:** La pila de descarte de tu oponente

```json
{
    "func": "location",
    "args": ["discard_pile", {
        "func": "player",
        "args": ["inactive"]
    }]
}
```

#### Set

> **Eng:** This card

> **Spa:** Esta carta

```json
{
    "func": "this",
    "args": [""]
}
```

---

> **Eng:** A card from your hand

> **Spa:** Una carta de tu mano

```json
{
    "func": "select",
    "args": [{
        "func": "location",
        "args": ["hand", {
            "func": "player",
            "args": ["active"]
        }]
    }, {
        "func": "natural",
        "args": ["1"]
    }]
}
```

---

> **Eng:** 9 cards from your opponent's deck

> **Spa:** 9 cartas del mazo de tu oponente

```json
{
    "func": "select",
    "args": [{
        "func": "location",
        "args": ["deck", {
            "func": "player",
            "args": ["inactive"]
        }]
    }, {
        "func": "natural",
        "args": ["9"]
    }]
}
```

---

> **Eng:** All the cards from your hand

> **Spa:** Todas las cartas de tu mano

```json
{
    "func": "select",
    "args": [{
        "func": "location",
        "args": ["hand", {
            "func": "player",
            "args": ["active"]
        }]
    }, {
        "func": "natural",
        "args": ["1"]
    }]
}
```

---

> **Eng:** As many cards from your discard pile as the size of your opponent's hand times the size of your opponent's hand

> **Spa:** Tantas cartas de tu pila de descarte como el tamaño de la mano de tu oponente por el tamaño de la mano de tu oponente

```json
{
    "func": "select",
    "args": [{
        "func": "location",
        "args": ["discard_pile", {
            "func": "player",
            "args": ["active"]
        }]
    }, {
        "func": "multiply",
        "args": [{
            "func": "size",
            "args": [{
                "func": "location",
                "args": ["hand", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }]
        }, {
            "func": "size",
            "args": [{
                "func": "location",
                "args": ["hand", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }]
        }]
    }]
}
```

### Morphology

#### Instruction

> **Eng:** You play all the cards from your hand

> **Spa:** Tú juegas todas las cartas de tu mano

```json
{
    "func": "play",
    "args": [{
        "func": "player",
        "args": ["active"]
    }, {
        "func": "select",
        "args": [{
            "func": "location",
            "args": ["hand", {
                "func": "player",
                "args": ["active"]
            }]
        }, {
            "func": "natural",
            "args": ["1"]
        }]
    }]
}
```

---

> **Eng:** You discard a card from your opponent's hand and your opponent reveals a card from your opponent's deck

> **Spa:** Tú descartas una carta de la mano de tu oponente y tu oponente revela una carta del mazo de tu oponente

```json
{
    "func": "and",
    "args": [{
        "func": "discard",
        "args": [{
            "func": "player",
            "args": ["active"]
        }, {
            "func": "select",
            "args": [{
                "func": "location",
                "args": ["hand", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }, {
                "func": "natural",
                "args": ["1"]
            }]
        }]
    }, {
        "func": "reveal",
        "args": [{
            "func": "player",
            "args": ["inactive"]
        }, {
            "func": "select",
            "args": [{
                "func": "location",
                "args": ["deck", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }, {
                "func": "natural",
                "args": ["1"]
            }]
        }]
    }]
}
```

#### Rule

> **Eng:** If your deck isn't empty, your opponent plays a card from your opponent's discard pile

> **Spa:** Si tu mazo no está vacío, tu oponente juega una carta de la pila de descarte de tu oponente

```json
{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "not",
            "args": [{
                "func": "empty",
                "args": [{
                    "func": "location",
                    "args": ["deck", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }]
            }]
        }, {
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["inactive"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["discard_pile", {
                        "func": "player",
                        "args": ["inactive"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["1"]
                }]
            }]
        }]
    }]
}
```

---

> **Eng:** When you reveal this card: if your opponent's deck is empty or 5 cards aren't more than 7 cards plus 2 cards, you reveal all the cards from your opponent's hand

> **Spa:** Cuando revelas esta carta: si el mazo de tu oponente está vacío o 5 cartas no son mayores a 7 cartas más 2 cartas, tú revelas todas las cartas de la mano de tu oponente

```json
{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "or",
            "args": [{
                "func": "pass",
                "args": [{
                    "func": "empty",
                    "args": [{
                        "func": "location",
                        "args": ["deck", {
                            "func": "player",
                            "args": ["inactive"]
                        }]
                    }]
                }]
            }, {
                "func": "not",
                "args": [{
                    "func": "more",
                    "args": [{
                        "func": "natural",
                        "args": ["5"]
                    }, {
                        "func": "add",
                        "args": [{
                            "func": "natural",
                            "args": ["7"]
                        }, {
                            "func": "natural",
                            "args": ["2"]
                        }]
                    }]
                }]
            }]
        }, {
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["hand", {
                        "func": "player",
                        "args": ["inactive"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["1"]
                }]
            }]
        }]
    }]
}
```

## Ejemplos de descripciones completas

> **Eng:** If your hand is empty, you draw 2 cards from your deck.

> **Spa:** Si tu mano está vacía, tú robas 2 cartas de tu mazo.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "pass",
            "args": [{
                "func": "empty",
                "args": [{
                    "func": "location",
                    "args": ["hand", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }]
            }]
        }, {
            "func": "draw",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["deck", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["2"]
                }]
            }]
        }]
    }]
}]
```

---

> **Eng:** When you reveal this card: your opponent reveals all the cards from your opponent's discard pile.

> **Spa:** Cuando tú revelas esta carta: tu oponente revela todas las cartas de la pila de descarte de tu oponente.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "reveal",
        "args": [{
            "func": "player",
            "args": ["inactive"]
        }, {
            "func": "select",
            "args": [{
                "func": "location",
                "args": ["discard_pile", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }, {
                "func": "natural",
                "args": ["1"]
            }]
        }]
    }]
}]
```

---

> **Eng:** If your opponent's hand isn't empty, your opponent plays a card from your deck. When you discard this card: your opponent draws this card. When you reveal this card: you draw this card.

> **Spa:** Si la mano de tu oponente no está vacía, tu oponente juega una carta de tu mazo. Cuando tú descartas esta carta: tu oponente roba esta carta. Cuando tú revelas esta carta: tú robas esta carta.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "not",
            "args": [{
                "func": "empty",
                "args": [{
                    "func": "location",
                    "args": ["hand", {
                        "func": "player",
                        "args": ["inactive"]
                    }]
                }]
            }]
        }, {
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["inactive"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["deck", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["1"]
                }]
            }]
        }]
    }]
}, {
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "discard",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "draw",
        "args": [{
            "func": "player",
            "args": ["inactive"]
        }, {
            "func": "this",
            "args": [""]
        }]
    }]
}, {
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "draw",
        "args": [{
            "func": "player",
            "args": ["active"]
        }, {
            "func": "this",
            "args": [""]
        }]
    }]
}]
```

---

> **Eng:** If either your opponent's hand is empty or your deck is empty, you discard as many cards from your opponent's hand as the size of your opponent's deck and your opponent draws as many cards from your hand as the size of your opponent's discard pile times 9 cards.

> **Spa:** Si o la mano de tu oponente está vacía o tu mazo está vacío, tú descartas tantas cartas de la mano de tu oponente como el tamaño del mazo de tu oponente y tu oponente roba tantas cartas de tu mano como el tamaño de la pila de descarte de tu oponente por 9 cartas.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "xor",
            "args": [{
                "func": "pass",
                "args": [{
                    "func": "empty",
                    "args": [{
                        "func": "location",
                        "args": ["hand", {
                            "func": "player",
                            "args": ["inactive"]
                        }]
                    }]
                }]
            }, {
                "func": "pass",
                "args": [{
                    "func": "empty",
                    "args": [{
                        "func": "location",
                        "args": ["deck", {
                            "func": "player",
                            "args": ["active"]
                        }]
                    }]
                }]
            }]
        }, {
            "func": "and",
            "args": [{
                "func": "discard",
                "args": [{
                    "func": "player",
                    "args": ["active"]
                }, {
                    "func": "select",
                    "args": [{
                        "func": "location",
                        "args": ["hand", {
                            "func": "player",
                            "args": ["inactive"]
                        }]
                    }, {
                        "func": "size",
                        "args": [{
                            "func": "location",
                            "args": ["deck", {
                                "func": "player",
                                "args": ["inactive"]
                            }]
                        }]
                    }]
                }]
            }, {
                "func": "draw",
                "args": [{
                    "func": "player",
                    "args": ["inactive"]
                }, {
                    "func": "select",
                    "args": [{
                        "func": "location",
                        "args": ["hand", {
                            "func": "player",
                            "args": ["active"]
                        }]
                    }, {
                        "func": "multiply",
                        "args": [{
                            "func": "size",
                            "args": [{
                                "func": "location",
                                "args": ["discard_pile", {
                                    "func": "player",
                                    "args": ["inactive"]
                                }]
                            }]
                        }, {
                            "func": "natural",
                            "args": ["9"]
                        }]
                    }]
                }]
            }]
        }]
    }]
}]
```

---

> **Eng:** Your opponent draws a card from your deck and your opponent reveals 2 cards from your opponent's discard pile. When you reveal this card: if your hand isn't empty, you play all the cards from your discard pile and your opponent plays them.

> **Spa:** Tu oponente roba una carta de tu mazo y tu oponente revela 2 cartas de la pila de descarte de tu oponente. Cuando tú revelas esta carta: si tu mano no está vacía, tú juegas todas las cartas de tu pila de descarte y tu oponente las juega.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "and",
        "args": [{
            "func": "draw",
            "args": [{
                "func": "player",
                "args": ["inactive"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["deck", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["1"]
                }]
            }]
        }, {
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["inactive"]
            }, {
                "func": "select",
                "args": [{
                    "func": "location",
                    "args": ["discard_pile", {
                        "func": "player",
                        "args": ["inactive"]
                    }]
                }, {
                    "func": "natural",
                    "args": ["2"]
                }]
            }]
        }]
    }]
}, {
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "not",
            "args": [{
                "func": "empty",
                "args": [{
                    "func": "location",
                    "args": ["hand", {
                        "func": "player",
                        "args": ["active"]
                    }]
                }]
            }]
        }, {
            "func": "and",
            "args": [{
                "func": "play",
                "args": [{
                    "func": "player",
                    "args": ["active"]
                }, {
                    "func": "select",
                    "args": [{
                        "func": "location",
                        "args": ["discard_pile", {
                            "func": "player",
                            "args": ["active"]
                        }]
                    }, {
                        "func": "natural",
                        "args": ["1"]
                    }]
                }]
            }, {
                "func": "play",
                "args": [{
                    "func": "player",
                    "args": ["inactive"]
                }, {
                    "func": "play",
                    "args": [{
                        "func": "player",
                        "args": ["active"]
                    }, {
                        "func": "select",
                        "args": [{
                            "func": "location",
                            "args": ["discard_pile", {
                                "func": "player",
                                "args": ["active"]
                            }]
                        }, {
                            "func": "natural",
                            "args": ["1"]
                        }]
                    }]
                }]
            }]
        }]
    }]
}]
```

---

> **Eng:** If your opponent's discard pile isn't empty or 3 cards aren't distinct from the size of your hand, you discard 9 cards from your discard pile and you reveal them. When you play this card: you play a card from your opponent's discard pile. You reveal this card and your opponent discards this card.

> **Spa:** Si la pila de descarte de tu oponente no está vacía o 3 cartas no son distintas del tamaño de tu mano, tú descartas 9 cartas de tu pila de descarte y tú las revelas. Cuando tú juegas esta carta: tú juegas una carta de la pila de descarte de tu oponente. Tú revelas esta carta y tu oponente descarta esta carta.

```json
[{
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "conditional",
        "args": [{
            "func": "or",
            "args": [{
                "func": "not",
                "args": [{
                    "func": "empty",
                    "args": [{
                        "func": "location",
                        "args": ["discard_pile", {
                            "func": "player",
                            "args": ["inactive"]
                        }]
                    }]
                }]
            }, {
                "func": "not",
                "args": [{
                    "func": "not_equal",
                    "args": [{
                        "func": "natural",
                        "args": ["3"]
                    }, {
                        "func": "size",
                        "args": [{
                            "func": "location",
                            "args": ["hand", {
                                "func": "player",
                                "args": ["active"]
                            }]
                        }]
                    }]
                }]
            }]
        }, {
            "func": "and",
            "args": [{
                "func": "discard",
                "args": [{
                    "func": "player",
                    "args": ["active"]
                }, {
                    "func": "select",
                    "args": [{
                        "func": "location",
                        "args": ["discard_pile", {
                            "func": "player",
                            "args": ["active"]
                        }]
                    }, {
                        "func": "natural",
                        "args": ["9"]
                    }]
                }]
            }, {
                "func": "reveal",
                "args": [{
                    "func": "player",
                    "args": ["active"]
                }, {
                    "func": "discard",
                    "args": [{
                        "func": "player",
                        "args": ["active"]
                    }, {
                        "func": "select",
                        "args": [{
                            "func": "location",
                            "args": ["discard_pile", {
                                "func": "player",
                                "args": ["active"]
                            }]
                        }, {
                            "func": "natural",
                            "args": ["9"]
                        }]
                    }]
                }]
            }]
        }]
    }]
}, {
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "play",
        "args": [{
            "func": "player",
            "args": ["active"]
        }, {
            "func": "select",
            "args": [{
                "func": "location",
                "args": ["discard_pile", {
                    "func": "player",
                    "args": ["inactive"]
                }]
            }, {
                "func": "natural",
                "args": ["1"]
            }]
        }]
    }]
}, {
    "func": "conditional",
    "args": [{
        "func": "event",
        "args": [{
            "func": "play",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }, {
        "func": "and",
        "args": [{
            "func": "reveal",
            "args": [{
                "func": "player",
                "args": ["active"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }, {
            "func": "discard",
            "args": [{
                "func": "player",
                "args": ["inactive"]
            }, {
                "func": "this",
                "args": [""]
            }]
        }]
    }]
}]
```
