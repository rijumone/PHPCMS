---
Title: Dataclasses in Python
Description: Part of the remove-all-boilerplate movement.
Date: 09 July 2020
Image: /assets/img/dataclass.png
Template: single
---

# Dataclasses in Python

Dataclasses are new in Python 3.7 and I discovered them only recently.
These are classes that typically contain mainly data. Think (similar to) ORM models.

Import the module:
```python
from dataclasses import dataclass
```

And add the class decorator:
```python
@dataclass
class Holding:
    '''Class for keeping track of a holding in Portfolio.'''
    symbol: str
    buy_price: float
    quantity: int
    target: float
    stoploss: float
```
...to turn your boring and lengthy data class into a dataclass!

Dataclasses have a default `__init__()` method and a default `__repr__()` method. So you don't need to create these.

## Default values
As simple as:
```python
@dataclass
class Holding:
    '''Class for keeping track of a holding in Portfolio.'''
    symbol: str
    buy_price: float
    quantity: int
    target: float = 0.15
    stoploss: float = 0.85
```

## Instantiation
Just like a regular class:
```python
h = Holding(
    'ITC',
    280.41,
    4,
    0.18,
    0.82,
)

print(h)
```
Outputs:
```python
Holding(symbol='ITC', buy_price=280.41, quantity=4, target=0.18, stoploss=0.82)
```

## Modifications
Okay, you need some more isntant attributes but which won't be passed while instantiation.

The `__post_init__()` magic function exists for this.
```python
# importing user defined function
from utils import generate_t_and_sl

def __post_init__(self):
    self.targets_lst, self.stoplosses_lst = generate_t_and_sl(
        self.buy_price,
        self.target,
        self.stoploss,
        self.quantity,
    )
```

## Defaults
```python

@dataclass
class Holding:
    '''Class for keeping track of a holding in Portfolio.'''
    symbol: str
    buy_price: float
    quantity: int
    target_p: float
    stoploss_p: float
    targets: list = None
```