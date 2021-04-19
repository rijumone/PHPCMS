---
Title: Memory Management and Garbage Collection in Python
Description: What's happening behind the scenes?
Date: 20 Apr 2021
Image: /assets/img/memory_management_python.png
Template: single
---

# Introduction

It never struck me that being intimate on how memory is managed behind the scenes by high level languages such as Python was something crucial. But then, writing efficient code must necessarily translate to writing memory-efficient code. Worst case scenario: the user deletes my app because it performs "too slow".

This is going to be a long post. It took me time to understand, it should take you time to read through.

"Memory Allocation" primarily refers to allocating a "block" of space in the system's physical memory RAM for the program to perform operations in.

"Memory Management" is a superset of the above and also includes "Garbage Collection" which is freeing memory of objects no longer being referenced.

# CPython

CPython is the default Python implementation. There are others (e.g. Jython). CPython is written in C, the programming language. This implementation is responsible for "interpret"ing code written in Python into something called "bytecode".

## Python: An interpreted language

Python being an interpreted language, gets its application code translated to "bytecode" by CPython. The `__pycache__` directory and the occasional `.pyc` file are both the interpretations of CPython. They are bytecode!


CPython executes said bytecode against a virtual machine, thus taking care of the execution part.

Now, onto Memory Management.

You must have heard by now of how everything in Python is an object. It is so, literally. Even the native data types, they are all objects.

Specifically the:
## `PyObject`

Defined in the CPython implementation, `PyObject` is what is known as a `struct` in C. Think of `struct`s as similar to Python's [dataclasses](?dataclasses-python). They are classes which may have attributes but not methods.

The two attributes they have are:
- `ob_refcnt`
This is the reference count of the object
- `ob_type`
This is a `pointer`, it refers to the type of the object

For each object in memory, the reference counter may get either incremented:
- If the object is assigned to another variable
- If the object is passed as an argument
- If the object is used in a list

or decremented:
- If the reference to the object is reassigned
- If the reference goes "out of scope"
- If the object is `del`eted


> Tip: The `sys.getrefcount()` method can be used to check object references.
> E.g.

```python
>>> import sys
>>> _foo = 'bar'
>>> sys.getrefcount(_foo)
2
```
Here we are getting 2 because passing `_foo` as an argument increments the reference counter.

## Garbage Collection

Garbage Collection (GC) in Python is automatic and the developer need not concern themselves regarding the same. GC releases memory when the reference count for a particular object has reached 0.

Let's consider the example:

```python
>>> _foo = 'bar'
>>> _foo
'bar'
>>> del _foo
>>> _foo
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name '_foo' is not defined
>>>
```

Hence, it is evident that Python's GC is automated since the reference to `_foo` is no longer found once it is deleted.

An interesting point to note here is that Python's GC can be modded as per the dev's need (or whim?)

```python
>>> import gc
>>> gc.get_threshold()
(700, 10, 10)
```

The GC in Python work's on a concept called "generations". There are three.
As evident, defaults state a threshold of 700 for the youngest generation and 10 for each subsequent older generations.

But what _are_ "generations"?

When an object is new, it starts in the "first generation". If after GC runs, the object survives, it moves on to the next, second generation and so on.

The tuple printed above is the `threshold` of each generation (first, second, third). Once the number of objects in any particular generation exceeds the threshold, the GC will get triggered and a collection process will start.

Let's check the count of objects in each of the generations.

```python
>>> import gc
>>> gc.get_count()
(221, 1, 1)
```

We get quite a high number of first generation objects because Python had initialized these objects on its own.

One can manually trigger a GC by issuing `gc.collect()`.

```python
>>> import gc
>>> gc.collect()
0
>>> gc.get_count()
(20, 0, 0)
```

Furthermore, the threshold can be modified too.

```python
>>> gc.set_threshold(800, 12, 12)
>>> gc.get_threshold()
(800, 12, 12)
```

Why would we want to modify this behavior?

GC is a tradeoff between execution speed (collection uses CPU cycles) and memory (less frequent collections use up more space). So one might need to balance as per the specific circumstances.

# Heap and Stack Memory

Let's head down to a lower level.

Suppose we declare a variable.

```python
_foo = 'bar'
```

The CPython process has been given some memory by the OS to perform its operations.

This physical memory is divided into two portions, the Heap and the Stack.

## Heap
Heap memory holds the objects, like `'bar'`.

GC is invoked when objects in the Heap no longer have a reference in Stack.

## Stack
The Stack holds the references, like `_foo`.
This is where methods are executed from. The program begins its execution under the `__main__` method stack. 

The lowest "frame" in the stack is `__main__`. Supposing another method is called from `__main__`, another stack is added on top of it.

Additional method calls get "stacked" up the Stack.

It should be noted here that methods can have local variables with clashing names, since the names (references) are held in the individual "frame".

