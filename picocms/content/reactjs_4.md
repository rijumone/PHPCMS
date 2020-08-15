---
Title: ReactJS, Volume 4
Description: Navigation
Date: 08 Aug 2020
Image: /assets/img/react_vs_code_first_edit.png
Template: single
---

In the [previous post](/?reactjs_3), we had added a header and footer using a CSS Framework called Tailwind.

This time, let's look at creating a navigation menu.

# The Navigation Component

- Create a new component under the `Components` directory.

`Navigation.js`

```js
import React from 'react'

function Navigation(){
    return (
        <nav>
            nav
        </nav>
    )
}

export default Navigation
```

The navigation component needs to render inside the header.

- Edit the `Header.js` file to include the newly created navigation component. Remember, the navigation component file lies in the same level as the header component (in the `Components` directory) hence the `./Components` prefix is not required.

```js
import Navigation from './Navigation'
```

And let's move the layout a bit and add some classes to help with the alignment.

```html
<header className='border-b p-3 flex justify-between items-center'>
    <span className='font-bold'>
        GalleryApp
    </span>
    <Navigation />
</header>
```

Pretty cool, huh?

[<img src="/assets/img/nav_aligned.png" class="img-fluid"/>](/assets/img/nav_aligned.png)


# Font Awesome

How about using an icon instead of the "nav" word?

We'll be using the awesome icon set provided by [Font Awesome](https://fontawesome.com/start). 

- Start by installing.

```bash
yarn add @fortawesome/fontawesome-svg-core \
         @fortawesome/free-solid-svg-icons \
         @fortawesome/react-fontawesome
```

[<img src="/assets/img/font_awesome_install.png" class="img-fluid"/>](/assets/img/font_awesome_install.png)

- Then to actually use the icons, in our case `fa-bars`. 

`Navigation.js`

```js
import React from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBars } from '@fortawesome/free-solid-svg-icons'

function Navigation(){
    return (
        <nav>
            <span className='text-xl'>
                <FontAwesomeIcon 
                    icon={faBars}
                />
            </span>
        </nav>
    )
}

export default Navigation
```

And we have:

[<img src="/assets/img/nav_fa.png" class="img-fluid"/>](/assets/img/nav_fa.png)
