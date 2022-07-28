---
Title: ReactJS, Volume 1
Description: State of the modern frontend
Date: 23 July 2020
Image: /assets/img/react_vs_code_first_edit.png
Template: single
---

# The modern Frontend

I started out my career path as a software developer working with PHP and Javascript. And while I hated PHP, I was absolutely terrified of Javascript. The stuff hardly ever worked as I wanted it to. I had to work around the idiosyncrasies and quirks of the language. And while most of it can be written off as my obvious inexperience and programming skills (or lack thereof) at that time, the deep seated irrational fear of Javascript and all its forms, frameworks and libraries remained. I generally avoided the language where I could, be it on the Frontend or the Backend.

Up until now.

The modern Frontend landscape has come miles in terms of frameworks and now it is exceedingly simple to abstract out the lower level components of the DOM, leave out that kind of heavy lifting to the many libraries and frameworks and concentrate only on the core functionality of the frontend.

Or so I have heard.

I would not know for sure until I go in deep and get my hands dirty. So, I start this series with the agenda to break out ReactJS, attempt to develop a functional app and find out exactly what has changed on the Frontend scene in these past years.

## Why ReactJS

Its popular, for one. Substantially so, as per [Google Trends](https://trends.google.com/trends/explore?cat=31&q=Vue.js,React,Angular). Google's own Angular (previously known as AngularJS) used to hold the top spot for a long time until being dethroned by the new ruler of the Frontend: long enough to catch my eye.

I began exploring Angular(JS at that time) but soon found it either boring or not developer friendly enough. Or may be, not enough people were doing it then, for me to get the required support. And ReactJS is supposed to be easier to work with.

Two reasons are good enough to start with, yes?


## Prerequisites

Basic functional knowledge of Javascript, HTML and CSS is needed for embarking on this journey. Fortunately, these can be obtained in a day or two. Just take a crash course on YouTube if you need to.

## Dependencies

#### NodeJS
Required runtime for any Javascript application, this is easily installed from the [nodejs website](https://nodejs.org/en/download/).
Once you have it installed, you can type in `node -v` in the terminal to verify the installation.

```bash
$ node -v
```
[<img src="/assets/img/node_v.png" class="img-fluid"/>](/assets/img/node_v.png)

#### Yarn
A package manager. Similar to Python's PyPI.
A bit longer [installation](https://classic.yarnpkg.com/en/docs/install/#debian-stable) though.
```bash
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt update && sudo apt install yarn -y
$ yarn -v
```
[<img src="/assets/img/yarn_install.png" class="img-fluid"/>](/assets/img/yarn_install.png)

You should see the version of `yarn` installed.

#### React Developer Tools
This is a Google Chrome browser extension. This is supposed to make inspecting React components and debugging them easier. Let's give it a try.

Here's the [link](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)

That's pretty much it.

## Installation
We will be using the [Create React App](https://create-react-app.dev/) to get up and running. This will take care of Babel, webpack and ESLint setup  and configuration for us so we don't have to.

If you are like me and more often than not find yourself fighting off the urge to dive depth-first into whatever you just saw, heard, touched, felt or just in any way experienced, you are probably wondering what these three things are.

You are in good company.

- Babel: 
Since JS has grown by leaps and bounds since the time I last saw it, many new features have been introduced. Babel will compile your modern JS code down to what browsers in different environments will understand. Much like a compatibility layer.
- webpack: 
Described as a "static module bundler", this will generate "assets" bundles for your app. Think of the individual JS and CSS files you needed to add to the `<head>` element. Those days are past.
- ESLint: Just a linter. 

A'right!

```bash
$ npx create-react-app react-gallery-app
```
[`npx`](https://www.npmjs.com/package/npx) is described as a "npm package runner". It will execute commands either from a local `node_modules/bin` dir or from a central cache. Any packages needed in order for the command to run will be installed. 

So, we are actually executing the `create-react-app` module.

[<img src="/assets/img/npx_create_react_app.png" class="img-fluid"/>](/assets/img/npx_create_react_app.png)

It might take a couple of minutes, depending on your internet speed and whether you have a HDD or SSD, but this is what you will be greeted with.

Personally, I like the cheerful touch. Yes, we are creating a gallery app.

## Launch

```bash
$ cd react-gallery-app
$ yarn start
```

[<img src="/assets/img/yarn_start.png" class="img-fluid"/>](/assets/img/yarn_start.png)

Ah, lovely! A browser window must've launched as well.

[<img src="/assets/img/react_begin.png" class="img-fluid"/>](/assets/img/react_begin.png)

Let's take it up on the offer and "Edit src/App.js and save to reload."

We'll load up the `react-gallery-app` directory in Visual Studio Code which happens to be my code editor of choice.

[<img src="/assets/img/react_vs_code.png" class="img-fluid"/>](/assets/img/react_vs_code.png)

Let's add another `<p>` tag with some content and save the file. The server should hot-reload.

[<img src="/assets/img/react_first_edit.png" class="img-fluid"/>](/assets/img/react_first_edit.png)

If the page does not update, ensure that you didn't exit the server running in the terminal. Start it up again with `yarn start` if you did.

So far, so good.
We have discussed frontend frameworks, considered that they might have gotten better to use now, decided to try ReactJS, installed its dependencies, built a starter template app and run it successfully!

Take it all in.

When you are done, [click here](/?reactjs_2) to get to the next post in this series, where we discuss `Components` in ReactJS.