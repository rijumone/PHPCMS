---
Title: Algorithms, Volume 1, Sorting
Description: Sorting Algorithms, Python
Date: 13 Feb 2021
Image: /assets/img/sorting_algos.png
Template: single
---

# Sorting Algorithms

Often times while programming in general, the programmer eventually arrives upon a list that they want sorted. 

Why and how? Well apart from the fact that they seem to be one of the top "whiteboard" problems that all the shiny tech companies seem to prefer, they do come in quite handy in real world code.

Anecdote:

I had a list of "holdings" I needed to sell in the following format:


| id        | symbol           | price  |
| ----: |-------------| -----:|
| 7      | AXISBANK | 1700 |
| 8      | TESLA      |   1612 |
| 9 | MSFT      |    500 |
| 10 | HCLTECH      |    85 |
| 11 | GEPIL      |    1004 |

(indicative data, not to scale)

For reasons I will not go into here, I wanted the least expensive ones to be sold off first.

The list:

```python
[1700, 1612, 500, 85, 1004, ]
```

needed to be sorted in ascending order, like so:

```python
[85, 500, 1004, 1612, 1700, ]
```

Let's take a look at the different approaches one can follow to arrive at this final list.

[Click here](/?sorting_algos_bubble) to go to the next post where we discuss [Bubble sort](/?sorting_algos_bubble).