---
Title: List Comprehension
Description: Readability counts.
Date: 13 July 2020
Image: /assets/img/list-comprehension.png
Template: single
---

# List comprehension in Python

Just because you can write readable code does not mean you should (okay, mostly you should). But, nothing wrong in compressing 10 lines of code into 1 if it could mean nightmares for the person maintaining it.

Okay, kidding aside, what is it?

## Intro

List comprehension actually makes your code easier to comprehend and maintain.

How does on create a list in Python. You could:
1. Instantiate an empty list
2. Loop over an iterable
3. And keep appending elements to the list

Like so:
```python
>>> lst = []
>>> for i in [1, 2, 3]:
>>>     lst.append(i)

>>> print(lst)
[1, 2, 3]
```

List comprehension will bring this down to one single line.
```python
>>> lst = [i for i in [1, 2, 3]]
>>> print(lst)
[1, 2, 3]
```
Pretty cool, huh?

## Mods

Now let's say you need to add only even numbers to the list.

### Classic:
```python
>>> lst = []
>>> for i in [1, 2, 3]:
>>>     if i % 2 == 0:
>>>        lst.append(i)
```

### Using list comprehension:

```python
>>> lst = [i for i in [1, 2, 3] if i % 2 == 0]
>>> print(lst)
[2]
```

What's that? You also need an else condition you say? Fear not.
```python
>>> lst = [i  if i % 2 == 0 else 'a' for i in [1, 2, 3]]
>>> print(lst)
['a', 2, 'a']
```

There is also a dict comprehension in Python which works similarly for Dictionaries.