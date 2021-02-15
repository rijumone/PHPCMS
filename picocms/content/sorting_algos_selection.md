---
Title: Algorithms, Volume 3, Selection Sort
Description: Selection Sorting Algorithm, Python
Date: 14 Feb 2021
Image: /assets/img/selection_sort.png
Template: single
---

# Description

Selection sort is again another simple comparision sort.

In this, you "look" at the items one by one, "select" the smallest (in order) and then place them in their correct position incrementally.

Think of this as, looking at the list, selecting the smallest item and swap it with the item at the beginning of the list. Then looking for the smallest item in the remainder of the list (excluding the first position since you already placed the smallest item there) and swap it with the item in the second position of the list, and so on.

The remainder of the list is the "unsorted" portion of the list whilst the positions swapped in the beginning of the list constitute the "sorted" portion of the list.

## Demonstration

We will use the same list we used last time for [Bubble sort](/?sorting_algos_bubble).

Our input list:

```python
[1700, 1612, 500, 85, 1004, ]
```
### Step I:

We look for the smallest item in the list, in this case `85`. Swap it for `1700`, the first item.

Our list becomes:
```python
[85, 1612, 500, 1700, 1004, ]
```

### Step II:

Now we look for the smallest item in the rest of the list (leaving `85` in the first position since we just placed it in it's correct position).

That item is `500`. Swap it with the item in second position.

```python
[85, 500, 1612, 1700, 1004, ]
```

### Step III:

Rinse and repeat.
Smallest item in unsorted list (excluding first two items): `1004`
Swap with the item on third position.

```python
[85, 500, 1004, 1700, 1612, ]
```

### Step IV:

Finally the list becomes:

```python
[85, 500, 1004, 1612, 1700, ]
```

## Implementation:

Let's try our hand at a python implementation.

```python
lst = [1700, 1612, 500, 85, 1004, ]

# get the length of the list
len_lst = len(lst)

# the first loop, this will check set the
# correct item at it's correct position in the list
for i in range(len_lst):
    # we declare a variable to keep track of
    # the index of the smallest item encountered yet
    # we initialize it with the first item's index (0)
    # and amend it if we encounter a smaller item
    smallest_items_index = i
    # the second loop to find the smallest item
    # in the unsorted list
    # this will start by leaving i items from the
    # beginning (since the item in position i will
    # have already  been placed in its 
    # correct position), every time it runs
    # it will run till the end of the list always
    for j in range(i, len_lst):
        # if any item in the unsorted list is smaller
        # than the item at `smallest_items_index`, 
        # update `smallest_items_index` with that
        # item's index
        if lst[j] < lst[smallest_items_index]:
            smallest_items_index = j
    # now that we have the smallest item in the
    # unsorted list, we swap them judiciously using
    # a temporary variable
    _tmp = lst[smallest_items_index]
    lst[smallest_items_index] = lst[j]
    lst[j] = _tmp
```
    
Again, copious use of the `print()` statement is advocated to comprehend the various iterations, comparisons and swaps.

That's it for the Selection sort, catch me next time when we start discussing efficiency and complexity.

[Click here](/?efficient_sorting_algos) to go to the next post in the series.