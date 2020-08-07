---
Title: ReactJS, Volume 2
Description: Components
Date: 07 Aug 2020
Image: /assets/img/react_vs_code_first_edit.png
Template: single
---

In the [last post](/?reactjs_1), we had set up our ReactJS development environment, installed the ReactJS dependencies and had a starter app ready.

Let's move forward.

# Components

React is made up of components. Remember the `app.js` file? That is the root component.

Components must return JSX. JSX gives us the ability to write HTML in React. Or, just think of HTML on steroids.

The last line of the file mentions an export.

```js
export default App;
```

Exporting the `App` component to where?

# Entry point

Note that there is an `index.js` file inside the `src` directory.

[<img src="/assets/img/index_js.png" class="img-fluid"/>](/assets/img/index_js.png)

```js
import App from './App';
```
This line is importing the `App` component.

What else is going on here?

```js
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
```
Our React app is rendering the `App` component.
And our React app is being bound to the element with id `root` on the webpage.

What webpage is that?

In the `public` directory, there is a file named `index.html`.

[<img src="/assets/img/index_html.png" class="img-fluid"/>](/assets/img/index_html.png)

And there we have the element with id `root`.

```html
<div id="root"></div>
```

In conclusion, the `App` component is the root component, all other components will be rendered inside the `App` component. Headers, footers, navbars, content, listings, all of these will be components.

# First Component

Let's get down to creating our very own component. We'll start with a header.

Create a new directory inside the `src` directory. Name it `Components`. Create a `Header.js` file inside this directory.

The first line needs to import the React library.
```js
import React from 'react'
```

Define the component function. Here, let's just return "GalleryApp" enclosed in `<header>` tags.
```js
function Header(){
    return (
        <header>
            GalleryApp
        </header>
    )
}
```

Finally export the component.
```js
export default Header
```

It should look like this.

[<img src="/assets/img/header_js.png" class="img-fluid"/>](/assets/img/header_js.png)

Now, to render this component.

In `app.js`, import the component.
```js
import Header from './Components/Header'
```
And edit the `App` component to render the `Header` component.
```js
function App() {
  return (
    <div>
      <Header />
    </div>
  );
}
```
Your browser should have hot-reloaded, showing you the header.

[<img src="/assets/img/header_render.png" class="img-fluid"/>](/assets/img/header_render.png)

It really is that simple.

But Riju, you say. Does it also have to be that ugly?

Of course not, [click here](/?reactjs_3) to get to the next post where we look at styling things up a bit.