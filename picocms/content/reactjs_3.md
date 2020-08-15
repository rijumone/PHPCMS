---
Title: ReactJS, Volume 3
Description: Styling
Date: 08 Aug 2020
Image: /assets/img/react_vs_code_first_edit.png
Template: single
---

# Conventional CSS

To add some CSS styles to the `Header` component we added in the [last post](/?reactjs_2), open up the `App.css` file and delete all of its content. It's okay, it pertains to the `App` component boilerplate code which we deleted already.

Let's add a new CSS class `.app-header` to the file.

```css
.app-header{
  font-weight: bold;
  border-bottom: 1px solid black;
  padding: 0.5rem;
}
```

Then we need to add this class to our JSX tag in the `Header` component.

Like so,

```js
function Header(){
    return (
        <header className='app-header'>
            GalleryApp
        </header>
    )
}
```

After the browser hot-reloads,

[<img src="/assets/img/header_styled.png" class="img-fluid"/>](/assets/img/header_styled.png)

That's a lot more palatable, yes?

# CSS Framework

Working with conventional CSS might become cumbersome after some time, which is why we will be using a CSS Framework.

Enter [Tailwindcss](https://tailwindcss.com/), a Javascript configurable CSS framework.

## Installation

```bash
yarn add tailwindcss
```

[<img src="/assets/img/yarn_add_tailwindcss.png" class="img-fluid"/>](/assets/img/yarn_add_tailwindcss.png)

## Add Tailwind

- Let's remove the `App.css` file, I will explain why later.
- In the `index.css`, replace the existing content with the following:

```css
@tailwind base;

@tailwind components;

@tailwind utilities;
```

Like so,

[<img src="/assets/img/index_css_tailwind.png" class="img-fluid"/>](/assets/img/index_css_tailwind.png)

Your app is probably failing to compile now, complaining about the missing `App.css`.

[<img src="/assets/img/fail_compile_tailwind.png" class="img-fluid"/>](/assets/img/fail_compile_tailwind.png)

[Don't panic.](https://en.wikipedia.org/wiki/Phrases_from_The_Hitchhiker%27s_Guide_to_the_Galaxy#Don't_Panic)

This is happening because we are still referencing the deleted file in our `App.js` file.
Just remove the following line from that file.

```js
import './App.css';
```

## Create Tailwind config file

```bash
npx tailwind init
```

[<img src="/assets/img/npx_tailwind_init.png" class="img-fluid"/>](/assets/img/npx_tailwind_init.png)


This will create a `tailwind.config.js` in the project root.

[<img src="/assets/img/tailwind_config.png" class="img-fluid"/>](/assets/img/tailwind_config.png)

## Process CSS with PostCSS

The browser needs to be served CSS files. To build the CSS that will be served we will be using PostCSS.

- Create a `postcss.config.js` in the project root and paste the following content.

```js
module.exports = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
  ]
}
```

The `package.json` file is a good way to check what packages we have installed and currently it is telling us that the `postcss` package is not installed.

- Remedy this by installing it with yarn.

```bash
yarn add postcss-cli
```

[<img src="/assets/img/yarn_add_postwindcss.png" class="img-fluid"/>](/assets/img/yarn_add_postwindcss.png)

- Finally let's install `autoprefixer` because it is mentioned as a dependency in the `postcss/config.js` file.

```bash
yarn add autoprefixer
```

[<img src="/assets/img/yarn_add_autoprefixer.png" class="img-fluid"/>](/assets/img/yarn_add_autoprefixer.png)


## Editing the build script

In the `package.json` file look for the `scripts` key. It houses the cli commands available to us.

Let's add two more to this list.

```json
"build:css": "postcss src/index.css -o src/tailwind.css",
"watch:css": "postcss src/index.css -o src/tailwind.css -w",
```

Your `package.json` should look like this.

[<img src="/assets/img/package_json_tailwind_scripts.png" class="img-fluid"/>](/assets/img/package_json_tailwind_scripts.png)


Let's try running the `build:css` command.

```bash
yarn build:css
```

[<img src="/assets/img/yarn_build_css.png" class="img-fluid"/>](/assets/img/yarn_build_css.png)


A `tailwind.css` file has been created under the `src` directory. Hurray!

Let's edit our `index.js` file to load CSS from the newly created CSS file.

Replace
```js
import './index.css';
```
with
```js
import './tailwind.css';
```

We would want the CSS to be built every time we start serving our project. Let's edit the `start` and `build` commands.

```bash
"start": "yarn build:css && react-scripts start",
"build": "yarn build:css && react-scripts build",
```

Now, if we start out app with `yarn start`, we can see that the CSS is also being built.

[<img src="/assets/img/yarn_start_css.png" class="img-fluid"/>](/assets/img/yarn_start_css.png)

## Tailwind's classes

Let's actually try using the classes provided by Tailwind now.

In our `Header.js` file, replace the `app-header` class with the following.

```html
<header className='border-b font-bold p-3'>
    GalleryApp
</header>
```

The browser will hot-reload, rendering:

[<img src="/assets/img/gray_border.png" class="img-fluid"/>](/assets/img/gray_border.png)

Note: Refer [tailwind's documentation](https://tailwindcss.com/docs/border-style#app) for more of what you can do.

# Footer.js

Now that we have a respectable header, let's move on to building a footer. A footer is of course just another component.

- Create a `Footer.js` file in the `Components` dir.

```js
import React from 'react'

function Footer(){
    return (
        <footer className='bg-grey-200 text-center text-xs p-3 absolute bottom-0 w-full'>
            &copy; Copyright 2020
        </footer>
    )
}

export default Footer
```

- Edit the `app.js` file to include the newly created footer.

```js
import Footer from './Components/Footer'
```

And

```html
<div>
    <Header />
    <Footer />
</div>
```

And you have:

[<img src="/assets/img/header_footer.png" class="img-fluid"/>](/assets/img/header_footer.png)

[Click here](/?reactjs_4) to go to the next post. We add a navigation menu there.