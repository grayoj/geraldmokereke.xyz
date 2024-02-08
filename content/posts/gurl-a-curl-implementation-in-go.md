---
title: "Gurl: A Curl Implementation in Go"
date: 2024-01-20T16:19:07+01:00
tags: []
draft: true
---

[cURL (client for url)](https://curl.se) is a command-line tool for transferring data using several network protocols. It's commonly used in the development community for sending HTTP requests (API based requests to a server)
It's a fascinating lightweight tool available on Linux/Unix based systems and is written in the C programming language.

## Features of Curl

- File uploads.
- Data Transfer.
- Support for authentication mechanisms.
- Support for cookies, etc.

## What is gURL?

Pronounced g-u-r-l, is a a command-line interface (CLI) tool written in Go for making HTTP requests. It provides a convenient way to send HTTP requests and view the responses from the command line.
This was inspired by Curl, and was an experiment basically.

> I plan to make a homebrew formula, hopefully.

## Functions of Gurl

Gurl unlike Curl isn't as elaborate and robust in terms of functionality. The purpose of gURL is to merely allow you make HTTP requests and test you APIs from the command line.

- Supports common HTTP methods: GET, POST, PUT, DELETE
- Customizable HTTP headers
- Ability to include a request body
- Easy-to-use command-line interface with flags

## Using gURL

gURL features some flags to help you make requests better.

- url: The URL for the HTTP request (required).
- method: HTTP method (default: GET).
- header: Headers for the request (comma-separated key:value pairs).
- body: Request body.

You can make a gURL request by running the command:

```bash
gurl -url "https://api.gurl.com/data" -method POST -header "Content-Type: application/json" -body '{"key": "value"}'
```

As you can see, you can make a request using gURL simply to an endpoint and get a data response!
