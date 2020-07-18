---
Title: Virtual Environments
Description: Self containment and self isolation
Date: 18 July 2020
Image: /assets/img/venv_header.png
Template: single
---

# Virtual Environments in Python

## Intro

If you have just started out learning Python then you have probably come across 3rd party packages and modules. These don't come part of the standard library and as such can be installed with the `pip` command.

However, applications will often need a specific version of a library to execute successfully or at times even import successfully.
I remember facing this issue with a verion of `sqlalchemy`. A version of it on kept throwing the dreaded "Segmentation Fault" error on my RaspberryPi.

Solution? Enter the virtual environment.

What is it? To quote Python's official documentation, it is "a self-contained directory tree that contains a Python installation for a particular version of Python, plus a number of additional packages."
So, a Python virtual environment actually enables you to have multiple versions of Python (e.g 3.6 and 3.7) on the same machine.

## Creating Virtual Environments

Python already comes with the `venv` module built-in.

First, create/navigate to your project directory.
```
mkdir MyPythonProject
cd MyPythonProject
```
Then, run the `venv` module as a script with the directory path.
```
python3 -m venv env
```
A new directory named `env` will be created. Note that `env` can be any name of your choice like `my_env` or `mac_env`. It can also be a path and the virtual environment directory will be created at that path.
The name `.venv` is commonly preferred. This way, the directory typically remains hidden and also prevents clashes with the `.env` environment variable.

```
tree -L 2
.
└── env
    ├── bin
    ├── include
    ├── lib
    ├── lib64 -> lib
    ├── pyvenv.cfg
    └── share

```

## Activating the Virtual Environment

As simple as:
```
source env/bin/activate
```
You will see that your shell prompt changes to reflect the virtual environment you are using.

[<img src="/assets/img/venv_body.png" class="img-fluid"/>](/assets/img/venv_body.png)

## Usage

That's pretty much it!
Any libraries you now install with pip will reside under `env/lib/pythonX.X/site-packages`.

## Tips

- You can use the `python` command with the virtual environment activated i.e. without the version suffix and it would pick the version of Python that was used to create the virtual environment.
- Deactivate the virtual environment in the shell when you are done:
```
deactivate
```