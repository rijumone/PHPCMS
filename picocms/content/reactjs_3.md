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