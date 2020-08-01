---
Title: Flask, Volume 2: Route
Description: The first route
Date: 21 July 2020
Image: /assets/img/flask_2.png
Template: single
---

In the [last](/?flask_1) post, we had set up a repository and installed the Flask library. Now, let's set up our first route.

### Routes

In a web application, routing is the process of using URLs to drive the user interface (UI) shown on the browser.
That is, when you are navigating within the website, notice that the URL at the top of the browser window keeps changing.

These URL "routes" are mapped to code in a web framework by implementing routing.

The most basic route is `/`.

### Entrypoint

Create a file and name it `app.py`. This will be the entry point of all our Flask routes.

`app.py`

```python
from flask import Flask
app = Flask(__name__)
```

Here, we have initialised our `app` by assigning it an instance of `Flask`.

### The `/` route

Add the `hello_world` function to `app.py`.
`app.py`

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

Notice we have added the `route` decorator to the function, specifying which route the function should work for.

### Running the route

To test the brand new route, simply:

```bash
flask run
```

You should see the following in the terminal window.

```bash
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

Click on the link (or copy-paste it to a browser) to view your application.

[<img src="/assets/img/flask_route.png" class="img-fluid"/>](/assets/img/flask_route.png)

There you have it, your first route!

### Tips

- If you are running this on a different machine on your local network (e.g. on a virtual machine or similar) and can't access the application on that machine, simply add the `-h` parameter to `flask run` to specify the host.

```bash
flask run -h 0.0.0.0
```

And then navigate to `{{ip.of.virtual.machine}}:5000`.

- Similarly, if port `5000` of your development machine is being used by another application, you can specify a different port with `-p`.

```bash
flask run -h 0.0.0.0 -p 7000
```

[Click here](/?flask_3) to go the next post where we look at adding an input form to the page and submitting its data to the server.
