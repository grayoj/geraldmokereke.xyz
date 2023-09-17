---
title: 'Optimising React Native Apps'
date: 2023-09-17T19:07:06+01:00
draft: false
showBreadCrumbs: true
tags: ['Programming', 'React']
showToc: true,
---

The performance of mobile applications is extremely important. Users want a seamless experience with almost no bugs or glitches — to save yourself the violent reviews your mobile app would get on the app stores. Or preferably reduce? Because haters will hate.

JavaScript is arguably a performant language naturally. It's the pinnacle of all web applications that run on the client. A modern day functioning app cannot exist without shipping JavaScript modules to the client. There are several [benchmarking tools to illustrate this](https://webtips.dev/webtips/javascript/benchmark-javascript).

React Native is built on top JavaScript, so it should be naturally fast — right? Unfortunately that's not the case in many scenarios. To understand why, we must first start off with understanding React Native's build process or architecture in a nutshell.

## React Native's architecture

> It's worthy to note that I would be using React Native CLI in this case to describe the architecture, as it gives one more control over the project and we can review the components ourselves.

I think the only downside to Expo — is well, me having to constantly export my application to [Expo's registry, otherwise EAS platform](https://expo.dev/signup) in order to build a simple, useful application file for example on Android for distribution that I would normally execute via Gradle's AssembleDebug or AssembleRelease toolchain on my local machine.

Nevermind that, the React Native architecture is composed of three components.

![React Native's architecture](https://i.ibb.co/Br9PQWr/architecture.png)

- The native core modules:
  - Swift, Cocoa native Modules for iOS.
  - Java, Kotlin native Modules for Android.
- The JavaScript VM:
  - The VM that runs all JavaScript code on the device.
  - Uses JavaScript core, the engine powering Safari.
- The Bridge:
  - A communication layer for React Native written in C++ and Java.
  - Uses a special protocol for communicating between both the JavaScript VM and Native Modules.

A whole lot of this is facilitated by a bundler known as [Metro](https://github.com/facebook/metro) which is essentially a JavaScript bundler like Webpack but for React Native applications. It performs a three step cycle which you can [read up on here](https://facebook.github.io/metro/docs/concepts/#:~:text=Metro%20is%20a%20JavaScript%20bundler,Resolution).

## What makes React Native slow?

A slow react native application can be attributed to so many factors. Many times, it could be as a result of the assets being included in the application, to excess pre-rendering. I have experimented and recorded a benchmark once between two React Native applications, practically the same but one with more assets - and I wasn't surprised with the huge contrast in performance due to the amount of images and assets bundled within one of the applications.

- Bloated third-party libraries: Bloated external third party libraries contribute to the slow performance of React Native applications. Ny work around for this is usually implementing a tool such as [react-native-bundle-visualizer](https://github.com/IjzerenHein/react-native-bundle-visualizer), to visualis bundle size, carrying out profiling and in many cases lazy loading the libraries so they do not start up on initial app load.
- Excessive Re-rendering of components. Common causes of re-rendering include Component State Changes, Inline functions and then functional components as well, which could be supressed via React's `useMemo` hook.
- Using in-line functions in React Native, which is passing in-line props can cause re-rendering of components and slow down performance.
  Here is an example:

```typescript
import React, { useState } from 'react';
import { View, Text, TouchableOpacity } from 'react-native';

const App = () => {
  const [count, setCount] = useState(0);

  const handleClick = () => {
    setCount(count + 1);
  };

  return (
    <View>
      <Text>Count: {count}</Text>
      <ChildComponent onClick={handleClick} />
    </View>
  );
};

const ChildComponent = ({ onClick }: { onClick: () => void }) => {
  // Log re-renders for demonstration
  console.log('ChildComponent is re-rendering');

  return (
    <TouchableOpacity onPress={onClick}>
      <Text>Increment Count</Text>
    </TouchableOpacity>
  );
};

export default App;
```

In the above exaple example, the ChildComponent will re-render every time the parent App component renders, even though its props haven't changed. This is because the onClick function is recreated on each render of the App component.

To prevent unnecessary re-renders in such cases, you can use the the React `useCallback` hook to memoize the onClick function, as below: (It's the same code)

```typescript
import React, { useState, useCallback } from 'react';

const App = () => {
  const [count, setCount] = useState(0);

  const handleClick = useCallback(() => {
    setCount(count + 1);
  }, [count]);

  return (
    <View>
      <Text>Count: {count}</Text>
      <ChildComponent onClick={handleClick} />
    </View>
  );
};
```

That's it. We sucessfully optimised the component via the React `useCallback` hook.

- The flatlist, a pretty useful component which I find myself using all the time. I end up migitating the effects of the flatlist component slowing down my application via the React `useMemo` hook as well.

The above are three key factors that slow down any general react native applications, even though there are other factors.

## Optimising your application.

These are the approaches I take towards optimising my react native application — hopefully you could attempt to implement these methods as well to speed up your performance.

- If your application makes API calls, implementing caching through the available standard [Asyncstorage, a persistent, key-value storage](https://reactnative.dev/docs/asyncstorage) in React native reduces the amount of calls you would need to make, therefore speeding it up.
- Optimising images
  - Compress the images.
  - Utilise a format such as .webp as a better approach to optimisation.
  - Avoid heavy image sizes, please — at the basic level.
- Implement code splitting as an approach to minify JavaScript bundle size. Like we disucussed the architecture previoulsy above — the less JavaScript bundle size shipped, the better for yout app.
- Evade complex layouts using the `Flex`.
- Update dependencies.
- Ensure device compatibility by testing the application on several devices. Sometimes — it's likely the device.

With these measures taken, you should see a performance bump in your application, but upwards. Don't forget to benchmark before optimsations and after to be sure.
