---
Title: Hostname
Description: Get hostname in Python
Date: 15 July 2020
Image: /assets/img/hostname.png
Template: single
---

# Hostname in Python

At a certain point of time, one finds themselves needing the hostname of the machine their python code is running on. Why, you ask? But more importantly...


## What is a hostname?

According to `man hostname`, it is:
```
DESCRIPTION
    Hostname is used to display the system's DNS name, and to display or set its hostname or NIS domain name.
```
So while it is helpful to identify the system, it is by no means enforceable and can be set to any string.

And identification of the machine is what was important to me when I needed a way to log which load-balanced machine any particular job could be running on.


## Bash

You can get the current hostname by simply typing in the terminal:
```
hostname
```

## Python

There are (at least) a couple of approaches to get the hostname of the machine with python.

#### 1. The platform-independent way

```
>>> import os
>>> os.uname()
```

This returns a `posix.uname_result` object.

```
posix.uname_result(sysname='Linux', nodename='pop-os', release='5.4.0-7634-generic', version='#38~1592497129~20.04~9a1ea2e-Ubuntu SMP Fri Jun 19 22:43:37 UTC ', machine='x86_64')
```

Now you can simply get the hostname by the index.

```
>>> os.uname()[1]
'pop-os'
```

Yes, it is a bit ugly, which is why we have:

#### 2. The not-ugly way

```
>>> import socket
>>> socket.gethostname()
'pop-os'
```

According to python's [socket documentation](https://docs.python.org/3/library/socket.html#socket.gethostname), `gethostname()`'s docstring is 
```
Return a string containing the hostname of the machine where the Python interpreter is currently executing.
```
The documentation also mentions:

```
Note: gethostname() doesn’t always return the fully qualified domain name; use getfqdn() for that.
```

Ah, okay.
```
>>> import socket
>>> socket.getfqdn()
'pop-os.localdomain'
```

#### 3. (Bonus) the uglier way

This one is to let you know what not to do.

```
>>> import subprocess
>>> subprocess.check_output(['hostname']).decode("utf-8").strip('\n')
'pop-os'
```

P.S. fqdn stands for fully qualified domain name.