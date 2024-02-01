---
title: "Developing Console"
date: 2024-01-15T14:13:34+01:00
tags: []
draft: false
---

![Console](https://i.ibb.co/WxycM1G/console.png)

I love Go. For many reasons, at the same time I hate the language. It's the regular toxic love-hate relationship to have for a programming language.
Nothing new. Firstly Go is so much like C. Being a C programmer, it has been an enjoyable experience. The simplicty is fantastic for me.

The only problem with Go is the error handling and, as a matter of fact, the stupid compiler. Though I have some other "icks," the aforementioned are the most significant. Anyways, I'm not here to rant about Go. Rather, I want to walk you through how I developed a project called "Console" that you can use to view your system processes, memory, system usage, and system information from a decent GUI.

The project is written in Go, on the Fiber framework. Initially, for the closed-sourced version, it started off on the Echo framework.

But I wasn't liking it so much, then again this is down to my personal preference so I tried out fiber, and it's safe to say that I may not come back. I love the Express-ish (Node) feel to the framework. I fancy that.

## What is Console?

Console is an open-sourced dashboard panel used to view and manage resources on a Linux/MacOS system, using a browser. Console helps you perform functions such as:

> Note: [Console](https://github.com/grayoj/console) may be updated and I may not be able to factor all latest additions into this article.

- [x] View processes running and their number, just like on the activty monitor.
- [x] View disk usage via a Graph.
- [x] View Memory and CPU usage via a Graph.
- [x] View your system's network information.
- [x] View your system's disk volume (Planning to make it extensible)
- [ ] Explore your file system better.
- [ ] Include more stats and memory cleaning features.
- [ ] Available on more Linux distributions (asides Ubuntu) and Windows (hopefully)

## Console Stack

I built console using Go, on the fiber framework, Vite with React and Typescript. I also used Tailwind as per-usual for styling the project's interface.
Console starts on port `9595` by default. It relies on the [Go Embed](https://pkg.go.dev/embed) package, which makes embedding static assets (HTML, CSS, JavaScript, Images) into a Go binary possible.

The embed api is simplistic by nature and easy to call. Once we have a built vite app within the `/dist`, we call embed and point to the directory of the build from our go application like below:

```go
//go:embed client/dist/*
```

To give you better context of the project structure so you understand the embedding further, [here](https://github.com/grayoj/console).
The client folder contains the Vite application which is built into the static assets embedded to the binary.

The Go binary is extremely light as well.

I used [recharts](https://recharts.org) an open-source react-library for the charts as an alternative to Airbnb's visio I planned on going with, as so not to overcomplicate things.

## Interesting Bottlenecks faced

- **Routing Issues**: I kept experiencing 404 - Not found pages when trying to explore with the client due to many reasons. One of which, was because Go servers the static index.html page in the root, on routing to another page say `/monitor`
  which doesn't exist as a html page either, it results to a 404. To solve this issue, I had to implement a catch all routes function. That way, Console routes seamlessly with no issues.

  ```go
  app.Static("/", "client/dist")

  app.Get("*", func(c *fiber.Ctx) error {
  	return c.SendFile("client/dist/index.html")
  })
  ```

- **Processes overflowing on the client side**: The solution here was to use a pagination on the Go backend for the records, then append parameters to query per page. This way I was able to fit it into the UI and include steps.

## How can I setup Console?

While I intend to make a [homebrew formula](https://formulae.brew.sh) for the project, you can download the project binaries from the releases page. You can also compile from the soure-code. You can build the project using Docker on your local machine, on your Virtual Machine or server.
