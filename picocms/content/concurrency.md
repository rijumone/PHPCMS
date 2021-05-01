---
Title: Multithreading v/s Multiprocessing in Python
Description: When to use which?
Date: 01 May 2021
Image: /assets/img/memory_management_python.png
Template: single
---

Your backend code will need to run asynchronously at times.

## Tasks description

Suppose we have two distinct tasks which both involve repeating some smaller task n number of times.

Given the letters of the English alphabet:

<script src="https://gist.github.com/rijumone/49e3417a3f109de74f895310f9f734bb.js"></script>

We have our first task:
<script src="https://gist.github.com/rijumone/a473822c22968a9733581178a32cfe57.js"></script>

What it does, in order, is; for each letter in the `alphabet` list:
1. Fetch some data from an endpoint.
2. Write the response to a local file with the filename format `{letter}.txt`.

The second task:
<script src="https://gist.github.com/rijumone/3d798e48f27fc46680f10e23c16bfeda.js"></script>

Given a list with the response loaded from the files, perform some (silly) numerical operations on the contents and print the result to `STDOUT`.

It should be noted here that though the `load_letters()` function will be called as part of the task, it is merely a prerequisite of the task. The actual task is processing the data.

## IO bound v/s CPU bound

In the above examples, it can be noted that we have two distinct types of tasks at hand.

The first one is IO bound, meaning the CPU is lying "idle" while Python "waits" on operations to finish. IO bound operations are tasks include but are not limited to writing to disks, network calls and database operations.

Let's try both multithreading and multiprocessing to each of these tasks and benchmark how they perform.

## Task 1 using Multithreading


Let's modify our `download_and_write()` function to take in the letter as an argument. Let's also return the filename just so we have some kind of return from the function.

<script src="https://gist.github.com/rijumone/6634af5550802b7bb0778d472360e60d.js"></script>

Adding the requisite imports, some driver code to execute and benchmark and the `run_task()` method.

<script src="https://gist.github.com/rijumone/8821116740cfb01efb9397753c5eb368.js"></script>


Running this gives us:
```bash
a.txt
b.txt
...
y.txt
z.txt
0.84325
```

The last line is our benchmark score, using `time.perf_counter()`.

Now let's try the same task but with multiprocessing instead of multithreading.

## Task 1 using Multiprocessing

Fortunately, using the `concurrent.futures` as we have, only minimal changes need to be made to the code. Replacing `ThreadPoolExecutor` with `ProcessPoolExecutor` is the only change we need to make.

<script src="https://gist.github.com/rijumone/f253702ad9dd3ccbbd98f52d4b04817c.js"></script>

Now, running the script gives us.
```bash
a.txt
b.txt
...
y.txt
z.txt
3.18596
```

That's a difference by a factor of almost 4x!

Onto task 2.

## Task 2 using Multithreading

Modifying the `process_letters()` function to take in the letter as an argument and return the result instead of printing it

<script src="https://gist.github.com/rijumone/0fb1d35168d5cbb864610cc88d2a2095.js"></script>

Modifying the driver code:
<script src="https://gist.github.com/rijumone/8ad3adf05824ae6b7fbc8cf44b3fc449.js"></script>

And running outputs:
```bash
1582.0594177064766
1582.0006313131312
...
1582.4486241727623
3065.616161616161
114.31489
```

Again, the last line in our output is the benchmark score. Let's try the same for multiprocessing now.

## Task 2 using Multiprocessing

Just replace `ThreadPoolExecutor()` with `ProcessPoolExecutor()`.

The output is a lot more promising.

```bash
1582.200505050505
1581.8578643578644
...
1582.4486241727623
3065.616161616161
33.35094
```

Factor of almost 3.5x.

Hence, we have witnessed that for CPU bound tasks, use multiprocessing and for IO bound operations, use multithreading.


## The Python Global Interpreter Lock (GIL)