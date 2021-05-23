---
Title: Algorithms, Volume 4, Complexity and Merge sort
Description: Merge Sorting Algorithm, Python
Date: 23 May 2021
Image: /assets/img/merge_sort.png
Template: single
---

So now that we are aware of two sorting algorithms, [Bubble sort](/?sorting_algos_bubble) and [Selection sort](/?sorting_algos_selection), we can begin benchmarking the performance of these algorithms.

## Benchmarking

Let's just encapsulate the algorithms in functions named `bubble_sort` and `selection_sort`.

### Bubble
<script src="https://gist.github.com/rijumone/f56f944b2d824f4e921b03a30581f4d9.js"></script>

### Selection
<script src="https://gist.github.com/rijumone/91710468e50e4e970e6cbf787de7712a.js"></script>

And add a few lines of code to gauge the time taken by our algorithm.

<script src="https://gist.github.com/rijumone/e1942f470bf652e62f4ea5a0c496f3c1.js"></script>


Running this gives us:

```bash
$ python mark-and-toys.py 
1000 0.06064232400058245
2000 0.5926482049999322
3000 2.651992236999831
4000 8.086329040999772
5000 19.809930846000498
6000 41.542322076000346
7000 78.75735444400016
8000 139.95363474100031
9000 234.71581850999974
10000 370.9408892299998
11000 563.266825148
12000 831.0794338410005
13000 1191.4193329890004
14000 1668.3487535350005
```

If it is not evident from the numbers above, the chart following will clear all doubts that we have an algorithm which is scaling logarithmically.

[<img src="/assets/img/bubble_sort_perf.svg" class="img-fluid"/>](/assets/img/bubble_sort_perf.svg)

This is a problem.

Selection sort isn't doing too well either.

Changing the function call on line number 8 from `bubble_sort(prices)` to `selection_sort(prices)` and then running yields the following.


```bash
$ python mark-and-toys.py 
1000 0.029143507000298996
2000 0.27527437300068414
3000 1.252070363000712
4000 3.9587338730007104
5000 10.110896805000266
6000 22.257460963000085
7000 43.42526271100087
8000 78.41588780100028
9000 134.56712310900002
10000 217.56263848600065
11000 337.2307002540001
12000 504.256976138
13000 728.0528675980004
14000 1027.3983194020002
```

Though it seems to be slightly better off than bubble sort.

[<img src="/assets/img/selection_sort_perf.svg" class="img-fluid"/>](/assets/img/selection_sort_perf.svg)


## Big O

Both our algorithms have a time complexity of O(n<sup>2</sup>). There is a `for` loop inside another `for` loop in both of them. These loops are iterating over the length of the list.

## A better algorithm: Merge sort

Attempting to reduce our time complexity, we encounter merge sort.

This is a recursive algorithm, wherein a list is passed to the function. And it splits itself up into two smaller lists: the left half and the right half. 

<script src="https://gist.github.com/rijumone/3f6c2904c59b93329393e67e9c4fb064.js"></script>

These lists are then passed on the same function and so on.

<script src="https://gist.github.com/rijumone/cc91396485ab58cfa87dd865b412cea5.js"></script>

The function returns a sorted list. In order to return a sorted list, we need to merge the two halves.

To merge the two lists, start by declaring variables pointing to indices of the left list, the right list and the main list. Initialize all three with `0`.

<script src="https://gist.github.com/rijumone/723d80e2ff60eb6ad430c91e9ad5d2c9.js"></script>

Now, while there are still items remaining in both lists for traversal, compare the items at the respective indices of both lists. Place them in the main list accordingly. Also, increment the respective indices.

<script src="https://gist.github.com/rijumone/15c3f013ee2a755281a4a2e4302e26be.js"></script>

Now, for the remaining items (if there are any), in the left list, we just need to append them in the original list.

<script src="https://gist.github.com/rijumone/d20836765a55606d565f095cb10eed64.js"></script>

We need to perform the same check and actions for the right list. It needs to be noted here that either of the two conditions above will match. There can't be items remaining in BOTH the left AND the right list.

<script src="https://gist.github.com/rijumone/c07ecd8b545812b9a0586c1f5485c53e.js"></script>

Finally just return the main list.

<script src="https://gist.github.com/rijumone/b17f35840685e691e7877414ec74889c.js"></script>

To put it all together:

<script src="https://gist.github.com/rijumone/a27f9ae9f84d622e895e7ba2006fa3c2.js"></script>


## Performance

Running the `merge_sort` function using our benchmark, we see massive improvements.

```bash
$ python mark-and-toys.py 
1000 0.004665078000016365
2000 0.014389100999778748
3000 0.03394077599978118
4000 0.06758291200003441
5000 0.11902409200001784
6000 0.19562871499965695
7000 0.2959037050000006
8000 0.4273172209996119
9000 0.5946747629996025
10000 0.791544925999915
11000 1.0327183009999317
12000 1.320119792999776
13000 1.655568375999792
14000 2.048176066999986
```

Already this seems much much better than our previous attempts. Here's the chart.

[<img src="/assets/img/merge_sort_perf.svg" class="img-fluid"/>](/assets/img/merge_sort_perf.svg)

As can be observed by the evidence, the `merge_sort` algorithm scales much better than our previous attempts. How much better?

The merge sort algorithm carries a time complexity of O(nlogn).