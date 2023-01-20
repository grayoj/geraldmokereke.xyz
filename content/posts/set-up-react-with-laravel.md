---
title: 'Set Up React With Laravel'
date: 2023-01-04T09:09:15+01:00
draft: false
tags: ['Laravel, React']
---

# How to set up Laravel with React JS.

### Introduction.

Just like I was roaming Stackoverflow, you’ve probably been wondering how to set up React JS with the Laravel framework. React is arguably one of the most powerful libraries for building user-interfaces. Yes, it’s a library, not really a framework. It forms the view component of web applications. Laravel on the other hand, is a powerful open-source PHP framework used for building small to robust web applications. It implements the model-view-controller (MVC) software architecture. Both tools, seem to go pretty well with certain tools, without having to stress at all.

[!Image alt](https://miro.medium.com/max/720/1*5zbjAY6BL_u-OXF0_ZAPtw.webp)

For example, React is used in the MERN stack. Which comprises of MongoDB as the database, Express server, React itself and Node JS (A runtime and server environment for JavaScript applications. Essentialy a browser engine bundled as a server that is based on Chromium's V8 Engine) Whereas, Laravel a PHP framework goes pretty well with the standard HTML code. Which is used with a powerful templating engine, known as Blade. So why use Laravel and React?

**It boils down to preferences**. Being on this page, you are obviously curious and interested in this.

### The Perquisites.

Before proceeding! I assume you have the following tools and languages installed, because sadly I won’t be walking you through installing Laravel, but bootstrapping it with react.

- Laravel 5+
- NPM (Node Package Manager) You can use Yarn
- Node JS
- A good browser
- An IDE.
- So let’s begin.

We will start off by creating a Laravel application. You should have composer installed.

> Note: I’m on a windows machine anyway. There's really no big difference as it applies to all operating systems.

### Installation.

```shell
composer create-project laravel/laravel your-app-here
```

with that, now we should have our Laravel-app successfully set up for us.

### Creating The React App.

Now we’re going to create a react app in our resources folder.

```shell
cd Resources
npx create-react-app your-name
```

> I named mine "boilerplate."

Like a charm we’ve installed react on our machine! Sighs. Open up the package.json in your react-app folder. Now we are going to copy these dependencies to our Laravel `package.json`. You see Laravel is pretty much an opinionated framework for the views. We can use Blade, React or even Vue it supports!

![React Packages](https://miro.medium.com/max/720/1*TXzOcxWX2fUVIFB5-Zr5kA.webp)

Copy the above, and then paste this into the `devDependencies` section of the root `package.json`.

```json
"devDependencies": {
  ....
}
```

Now this my sound crazy, but delete the `node_modules/` folder within the React app you created. We are trying
to let laravel handle the installations and management of dependencies for the views.

### Clearing Errors.

Your our IDE looks less of a mess with errors flying around now. Now run npm install in the Laravel app’s directory itself. Not in resources. This would bring our dependency gods back, fortunately.

```shell
cd your-app-here
npm run install
```

So we've cleaned up the mess.

### The Bootstrap.

So there's something called [Webpack](https://webpackjs.com). It is a powerful open-source bundler for JavaScript that handles our assets, such ass source CSS and JavaScript files if the proper loaders are included.
Here we are going to add a piece of code to our `webpack.min.js` to bundle and mix our assets from our React App with Laravel.

![Webpack Code](https://miro.medium.com/max/720/1*VYv9KXIVoasC3AflBCVOXA.webp)

Here we instruct webpack to copy our assets for 'mixing' otherwise bundling. Then we write `mix.js` to complile the source JavaScript bundles on triggering `npm run dev`.

Add this below. It’s very much needed to bootstrap and run our app with react. Navigate to your resources and dial in npm run dev Laravel should trigger a mix as below:

![Successful](https://miro.medium.com/max/4800/1*y1QhTO-9IW76PDF60uCkIQ.webp)

What we did there was:

```shell
cd resources/your-app-here
npm run dev
```

That compiles it all.

### Load React Now, not Blade.

In order to prevent loading up the standard Blade template in HTML and CSS, when we start our application, the next step we are going to take is to navigate to our `views/welcome.blade.php` folder. We will do some little configurations in there. You can clear the dump in between the body tags. Replace it with this:

```html
<div id="root">
 <noscript>No JavaScript, no Party</noscript>
</div>
```

### Starting Laravel

Now we have connected and integrated our react-app, let’s have fun and try running it. This time, we won’t be running npm start but now, since we’ve bootstrapped the framework, run:

```shell
php artisan serve!
```

Happy Hacking. If you enjoyed this type of content, do share. It helps out a lot!
