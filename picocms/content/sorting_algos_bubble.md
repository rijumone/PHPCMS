---
Title: Algorithms, Volume 2, Bubble Sort
Description: Bubble Sorting Algorithm, Python
Date: 13 Feb 2021
Image: /assets/img/bubble_sort.png
Template: single
---

# Description

Bubble sort is a simple comparison sort. Long story short it will step through the list, compare adjacent item and if they are in the wrong order, simply swap them.

## Demonstration

Our input list:

```python
[1700, 1612, 500, 85, 1004, ]
```

### Step I:

Start from the beginning. Take the first item `1700` and compare it with the next `1612`.

`1700` is greater than `1612`, hence they are in the wrong order. 

Swap them.

Our list becomes:

```python
[1612, 1700, 500, 85, 1004, ]
```

We have to keep doing this. So the steps, in order are:

### Step II:

```python
[1612, 500, 1700, 85, 1004, ]
```

### Step III:


```python
[1612, 500, 85, 1700, 1004, ]
```

### Step IV:


```python
[1612, 500, 85, 1004, 1700, ]
```

Can you see how the smaller values are "bubbling" up the list?

### Step V:

We reached the end of the list, so we start again at the beginning. But this time, we don't need to compare till the end. Because the largest item will have already reached the end of the list.

```python
[500, 1612, 85, 1004, 1700, ]
```

### Step VI:

```python
[500, 85, 1612, 1004, 1700, ]
```

### Step VII:

No changes to be made here since `85` is already smaller than `1612`.

```python
[500, 85, 1612, 1004, 1700, ]
```

### Step VIII:

```python
[500, 85, 1004, 1612, 1700, ]
```

### Step IX:

Again, no changes.

```python
[500, 85, 1004, 1612, 1700, ]
```

### Step X:

We need to start from the beginning again, but this time we can skip comparing two of the last items. They are already in their proper places.

```python
[85, 500, 1004, 1612, 1700, ]
```

### Step XI:

No changes.

```python
[85, 500, 1004, 1612, 1700, ]
```
### Step XII:

No changes.

```python
[85, 500, 1004, 1612, 1700, ]
```

### Step XIII:

We start at the beginning. Note that we need to check only the first two items, we can skip the last three.

No changes.

```python
[85, 500, 1004, 1612, 1700, ]
```

Now, we know our list is sorted.

## Implementation

Let's see if we can't have a simple python implementation of this algorithm.

```python
lst = [1700, 1612, 500, 85, 1004, ]

# get the length of the list
len_lst = len(lst)

# the first loop
for i in range(len_lst):
    # the second loop skipping the i last items i each time
    # i starts from 0 so the first time, all the items will be checked
    # except that we need to run the loop only till the 2nd last item
    # since the 2nd last item will compare with the last item
    for j in range(len_lst - (i + 1)):
        # if the item which comes earlier is greater than the next adjacent item
        if lst[j] > lst[j + 1]:
            # swap them by judiciously using a temporary variable
            _tmp = lst[j + 1]
            lst[j + 1] = lst[j]
            lst[j] = _tmp
```

Easy-peasy! Okay, it might look a little intimidating for beginners, but it is not really. I encourage you to use the `print()` statement liberally and at each step to print the list and check exactly what comparisons and swaps are taking place.



[Click here](/?sorting_algos_selection) to go to the next post where we discuss and dissect another favorite of mine, the [Selection sort](/?sorting_algos_selection) algorithm.