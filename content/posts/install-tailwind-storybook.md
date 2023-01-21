---
title: 'Set up Tailwind and Storybook with Next'
date: 2023-01-20T16:56:38+01:00
draft: false
tags: ['Storybook, Tailwind', 'React']
---

# Introduction.

In this article, you will learn how to install storybook and configure it with tailwindcss, in a Next JS project. I have used these tools to build several side projects of mine and even professional projects.
I hope you find it interesting.

### Why Tailwind and Storybook?

It boils down to your preference. Storybook is a pretty nice tool that could be used alongside several CSS in options. From utility first frameworks such as tailwindcss, to Chakra UI, CSS in JS (Styled Components) or plain styling in CSS.

### Requirements.

- Node.js.
- A package manager, preferably Yarn.
- ES Lint.

If you don’t have the above installed, kindly consult the [Your first node.js app.](https://grayoj.github.io/gnotes/)

### Creating the Nextjs Application.

You would need to create the Next JS scaffolding for the application, otherwise project. Next JS is a framework that was created and is stil maintained by [Vercel](https://vercel.com). We would be using TypeScript, a superset of JavaScript, that makes your code safe essentially.

> Please do not choose the experimental `app/` directory feature yet.

```bash
yarn create next-app
```

You will be asked for the name of your app, and then whether you want to create a TypeScript project:

```bash
Would you like to use TypeScript with this project? … No / Yes
```

Then run the following command to start the app in development mode:

```bash
yarn dev
```

That should start the app on port: `http://localhost:3000/`. Click on it and open it up in your browser.

### Installing a Linter.

Linters are cool. They check for errors and ensure we follow some proper ethics and rules. You can acheive this using [EsLint](https://eslint.org), a powerful tool for code Linting and extending the [Airbnb Style Guide](https://github.com/airbnb/javascript). It comes bundled with Next JS.

Then add the following code to your .eslintrc file to extend the airbnb-style guide.

```json
{
 "extends": "airbnb"
}
```

### Installing Tailwind.

Tailwind is a utility first CSS framework developed by Adam Wathan. It makes CSS fun, and replaces the standard ruleset naming conventions at the cost of polluting your JSX, since you'll be essentially writing your styles like bootstrap within the className method in JSX.

Installing and configuring Tailwind is quite simple, but most people make some errors in the process.
Below is the procedure for effectively installing Tailwind.

```bash
yarn add -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

In this case, we used yarn. The `-D` flag if I remember correctly basically tells Yarn to install as a dependency, as it is a shortcut for `--save-dev`.

The next step is very important. You have to configure your tailwind.config.js file.

```json
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
​
    // Or if using `src` directory:
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

This injects tailwindcss into jsx, tsx, js, ts files within components and pages, for now.

Open up the `./styles/global.css` file and append the following CSS to provide the classes globally throughout the application.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Then you can restart the application server, by running: `yarn dev`.

### React Storybook.

[React storybook](https://storybook.js.org/) is a client based workshop or environment used for building front-end components seperately from the application, to test and document them seamlessly. This tool is extremely helpful when building out a ton of components and keeping track of them. It's very much compatible with React, the Next JS framework as well. But for Tailwind, err ... _that's where it gets tricky_. But we would crack it!

### Setting up Storybook.

First we would need to initoalise Storybook using node-package-execute. (npx) You can do this by running the command below:

```bash
npx -y sb init --builder webpack5
```

Tailwind CSS requires "postcss" to be functional. Storybook also requires postcss, so we would have to install the postcss addon for storybook.

```bash
yarn add -D @storybook/addon-postcss
```

Then you need [Webpack](https://webpack.js.org/), as a resolution dependency in your project. To install it, open up your `package.json` and append the following code below:

```json
// In your package.json file
"resolutions": {
    "webpack": "^5"
}
```

Run `yarn` to update the dependencies, and install webpack as a [resoultion dependency.](https://medium.com/learnwithrahul/understanding-npm-dependency-resolution-84a24180901b)

Open up the `.storybook/preview.js` file and then you could go ahead to copy and paste in the below code:

```jsx
// Import the global.css with tailwind base classes.
import '../src/styles/globals.css';
import * as NextImage from 'next/image';

const OriginalNextImage = NextImage.default;

Object.defineProperty(NextImage, 'default', {
 configurable: true,
 value: (props) => <OriginalNextImage {...props} unoptimized />,
});

export const parameters = {
 actions: { argTypesRegex: '^on[A-Z].*' },
 controls: {
  matchers: {
   color: /(background|color)$/i,
   date: /Date$/,
  },
 },
 previewTabs: {
  'storybook/docs/panel': { index: -1 },
 },
};
```

In the `.storybook/main.js` you would need to update the code in there to support the postcss and tailwindcss.

```jsx
// .storybook/main.js

const path = require('path');

module.exports = {
 stories: ['../src/**/*.stories.mdx', '../src/**/*.stories.@(js|jsx|ts|tsx)'],
 /** Expose public folder to storybook as static */
 staticDirs: ['../public'],
 addons: [
  '@storybook/addon-links',
  '@storybook/addon-essentials',
  {
   /**
    * Fix Storybook issue with PostCSS@8
    * @see https://github.com/storybookjs/storybook/issues/12668#issuecomment-773958085
    */
   name: '@storybook/addon-postcss',
   options: {
    postcssLoaderOptions: {
     implementation: require('postcss'),
    },
   },
  },
 ],
 core: {
  builder: 'webpack5',
 },
 webpackFinal: (config) => {
  /**
   * Add support for alias-imports
   * @see https://github.com/storybookjs/storybook/issues/11989#issuecomment-715524391
   */
  config.resolve.alias = {
   ...config.resolve?.alias,
   '@': [path.resolve(__dirname, '../src/'), path.resolve(__dirname, '../')],
  };

  /**
   * Fixes font import with /
   * @see https://github.com/storybookjs/storybook/issues/12844#issuecomment-867544160
   */
  config.resolve.roots = [path.resolve(__dirname, '../public'), 'node_modules'];

  return config;
 },
};
```

### Final Touch.

The last change that would be necessary to make, otherwise resolve as it regards integrating Tailwind with Storybook is injecting Tailwindcss into the Stories! You could do that like this in your `tailwind.config.js`.

```json
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
   // Inject to stories
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./stories/**/*.{js,ts,jsx,tsx}",
​
    // Or if using `src` directory:
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### Conclusion.

That does the magic trick right there. You should have Tailwind fully integrated into Storybook - and fully functional. To get the code for this article, visit the repo: [nextstory](https://github.com/grayoj/nextstory) a public archive you can clone, replicate or utilize as a working prototype as a starter template for your projects. I hope you enjoyed the article. Contact me for any changes, updates, suggestions or corrections. Thank You.
