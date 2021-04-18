---
Title: Data Serialization in Python, JSON
Description: Why do we need to serialize data
Date: 18 Apr 2021
Image: /assets/img/serialization_1.png
Template: single
---

# Introduction

Serialization refers to the process using which complex objects can be converted to byte streams so enable their storage and/or transfer. The reverse process, loading complex objects from bytes, is known as deserialization.

This is required invariably while developing applications in the real world. A good example is the response of web APIs.

# JSON

So, how does one go about performing this operation. Well, if the data types for the object in question are simple (native) enough, there is nothing wrong in simply dumping the object as JSON. JSON has the advantage of being human readable and editable.

Considering a Python [dataclass](/?dataclasses-python) like so:

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

...one can simple a `to_json()` method.

```python
def to_json(self) -> str:
    return json.dumps(asdict(self))
```

Initializing an object of the class:

```python
def main():
    holding = Holding(
        'HDFCBANK', 97.89, 5, 112.1, 95.4  
    )
    print(holding.to_json())
```

And adding some runner code:

```python
if __name__ == '__main__':
    main()
```

Produces the output:
```json
{"symbol": "HDFCBANK", "buy_price": 97.89, "quantity": 5, "target": 112.1, "stoploss": 95.4}
```

Not too shabby.

These can be nested as well.

```python
@dataclass
class Dataclass:
    def to_json(self) -> str:
        return json.dumps(asdict(self))

@dataclass
class Price(Dataclass):
    '''Class for storing any kind of price.'''
    name: str
    price: int

@dataclass
class Holding(Dataclass):
    '''Class for keeping track of a holding in Portfolio.'''
    symbol: str
    buy_price: Price
    quantity: int
    target: float
    stoploss: float

    def to_json(self) -> str:
        return json.dumps(asdict(self))

def main():
    holding = Holding(
        'HDFCBANK', Price('buy', 97.89), 5, 112.1, 95.4
    )
    print(holding.to_json())

if __name__ == '__main__':
    main()

```

Output:
```json
{"symbol": "HDFCBANK", "buy_price": {"name": "buy", "price": 97.89}, "quantity": 5, "target": 112.1, "stoploss": 95.4}
```

# Shortcomings

But the shortcomings of using JSON are soon evident. What happens if the data types are more complex, for example, other classes? Indeed adding a complex attribute to the class causes it to fail.

Suppose we have a dataclass which has only one attribute of the type of `featuretools`'s `EntitySet`:

```python
@dataclass
class CustomEntity(Dataclass):
    entity_set: EntitySet
```

Attempting `to_json()` an object of class `CustomEntity` throws an exception.

```bash
TypeError: Object of type EntitySet is not JSON serializable
```

Some objects simply can't be dumped to JSON. Fortunately for those objects we have other solutions. [Click here](?serialization_2) to go to the next post in this series where we explore them.

Code for this post can be found [here](https://github.com/rijumone/python/blob/master/serialization/serialization_1.py).