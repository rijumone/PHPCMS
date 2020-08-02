---
Title: Flask, Volume 1: Introduction
Description: The lowest barrier-to-entry Python web framework
Date: 21 July 2020
Image: /assets/img/flask_1.png
Template: single
---

# The Flask Microframework

## The What

Flask is a micro web framework, written in Python.

## The Why

So what is a "micro" framework anyway? From my experience with Flask, I can tell that it means that Flask is the simplest to get started and up and running with.
It has the lowest "barrier-to-entry" so to speak.

## The How

For any web framework (rather any framework) to work, it ships with some paradigms as to how to achieve a particular goal. Database abstraction, for example, is handled via an ORM layer. 
There might be distinct classes for serialization, etc. 
All of this adds to the bulk of the framework. 

But Flask, you might remember is "micro" framework. It is light-weight.
Flask achieves this by shipping with just the bare essentials. It does not include a database abstraction layer, form validation, file upload handling or authentication technologies which some other frameworks pride themselves on. I am looking at you, Django.

Instead, Flask supports extensions to add such functionality as and when needed via seamless integration which is virtually indistinguishable from native support.

# The AWQLRunner project

What better way to walk through the nitty-gritty of it all than to create a quick and dirty web app with Flask!
I recently ran into a situation at work where my colleagues needed a quick and easy way to execute [(Google) AdWords Query Language](https://developers.google.com/adwords/api/docs/guides/awql) queries.
Let's get down and give them that.

## Installation

Create a working dir to hold your project.
```bash
$ mkdir FlaskAWQLRunner
$ cd FlaskAWQLRunner
```

Create and activate the [virtual environment](/?virtualenv). And install some basic setup tools.
```bash
$ python3 -m venv .venv
$ source .venv/bin/activate
$ pip install --upgrade pip wheel setuptools
```

Install Flask from PyPI
```bash
$ pip install flask
```

That's it. Flask has been installed in your virtual environment.

[Click here](/?flask_2) for the next volume where we set up our first route.