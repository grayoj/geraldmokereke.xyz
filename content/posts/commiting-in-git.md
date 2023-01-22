---
title: 'Writing better Git Commits'
date: 2023-01-22T16:05:12+01:00
draft: false
tags: ['Git, Commits, Version Control']
---

### Introduction.

In this article you would learn how to properly structure and craft decent, intuitive and readable commit messages that summarise the context of the code you published to either a remote or local branch of a repository. This would be helpful if you work on collaborative projects, and would also save you the mental stress of trying to figure out a commit. I was once guilty of creating incredibly confusing and inappropriate commit messages, that did not capture the context of my code. I totally underestimated the concept of good commit messages, feeling "code readablity" was far more important to understand. That the code itself should tell, and not the messages. I was wrong, and I do not want you to be caught up in a similar situation.

### What is Git?

Git is a popular version control tool invented by Linus Torvalds. It is used to manage, maintain and version software efficiently. There is a possibility you have stumbled across the tool, or you have directly used this tool to maintain your projects.

### Why use Git?

Git is the most popular distributed version control tool in comparison to its other competitors. This is because of its proven efficiency and interoperability with code hosting platforms such as Github, Gitlab and Bitbucket. These platforms offer remote repository hosting for free and at a cost, for individuals and even enterprise organisations. Git also comes preinstalled with a lot of Linux based distributions, such as Ubuntu.

### Installing Git

Linux distributions usually come packaged with Git. The OS X system by Apple also in many cases comes with Git preinstalled, since it is Unix based. To verify a Git installation on any operating system, you should run the command `git` in your terminal for either Linux, Windows or MacOS.

If you receive a response showing options to use the Git command with, then you have it installed. If it returns a response saying the "command is not found," then you would need to go ahead and install git.

You could easily install git for windows by visiting their website [here](https://git-scm.com).

### Working with Git.

To illustrate the concept of proper commits in this article, we are going to create a new directory. Run:

```bash
mkdir git-commiting
cd git-commiting
vi
```

Now we have created a new directory, we would need to initialise git. We could do this by running the command:

```bash
git init
```

This would initialise an empty git repository locally, for our project. The next thing you should do, is to create a file which we are going to use to illustrate commiting.

```bash
touch example.py
vi example.py
```

This creates a file for us in the directory. Edit the file, and just add the following piece of code below:

```python
print("Testing commits in git.")
```

Then `:wq` out of the file into your directory once more.

> Note all examples and commands being used to edit, modify and create files are Linux-Unix based commands. I am also using Vim, a free open source editor available already for the aforementioned operating systems.

You can write in `:sh` to switch to a shell environment within your workspace. On your directory, you are going to run `git status` to see the status of your files within your local repository.

### Adding and Commiting

Now, you would need to add the file to save it within your local repository on your device. This could be done this way:

```shell
git add example.py
```

Ensure you are within the right directory to add the above file. It should be successful. It will not really return any response to validate the addition of the new file, but you can run `git status` once again to verify.

To add all files, instead of adding one by one—you should run the following command:

```shell
git add .
```

This adds all files and stages them for commiting within your local repository.

The next step is committing. A commit is used to capture the state of a project within the development timeline. This a helpful, powerful feature of git.

Through commits, we can track additions to a codebase, deletions and even roll back to a different state or version our application was in.

Commiting in git is quite simple. All you need to do is type in `git commit` and then pass in the `-m` flag, which represents "commit message."

Below is how to implement the above steps:

```bash
git commit -m "add new file."
```

Hit enter to successfully make a commit to the local repository. Now to see the commit, you could simply run:

```bash
git log
```

This would show you the commit log of the project.

### Commiting more characters.

You could commit over a 100 characters to be more descriptive. This helps other developers, especially when working in a team understand the purpose or context of your commit. In order to do this, create a new file like how we did above called `example2.py`. Then you could run the following command to get more space to write a longer commit:

```bash
git commit
```

In the shell, within that empty space—enter in your commit message like so, then just like in Vim, write out using `:wq`
That should commit your file.

So you have successfully committed a longer message. But how can you do this from the terminal on a line, without having to switch to that interface? This is where the `-m` tag comes into play.

To commit a longer message on the same line, you could do this:

```shell
git commit -m "This is the title." -m "This is the Body." "These are the points" -m "* Point 1" -m "* Point 2."
```

This would generate a proper format for a commit.

### Commit Formats

A popular commit format to use for your projects and in a professional setting whether open source, or not is the below format:

```
<Title>  ------- Commit Title.
<Body> ------- Commit Description.
<Footer> ----- Commit Footer.
```

The commit title should summarise or contain the context of the commit. The Body should contain the description of the commit. Why you made the commit, or the issue addressed. The Footer should contain a link to a bug, an addressed pull request or an issue made on a platform such as Github preferably.

Your company and coworkers would absolutely love you for structuring it this way.

### Commit Templates

A commit template is basically a format which you could use to construct your commit messages to make them better and more intuitive. In basic commit template, we have the following:

1. `init` - This stands for project initialisation. Take for example creating an initial Vue JS application scaffolding.

2. `feat` - This represents project feature. This should be used if you added a new feature to the codebase.

3. `fix` - Did you fix a bug in the codebase? Then you should use this for your commit.

4. `docs` - Let us assume you updated the readme.md or any other markdown documentation for the project, then you should use this.

5. `style` - Maybe you changed the font styles? Some colours? Or some designs? Then you should use this.

6. `test` - Did you write a unit test for a piece of code you are commiting? Then use this.

7. `build` - used for dependency related commits, so strapping it on those package.json files is absolutely good.

8. `chore` - This is best used for CI/CD commits. You would usually find this appended to a dockerfile or workflow.

9. `perf` - Does your commit feature a performance optimisation of some sort? Then this is best suited.

10. `refactor` - Did you change the formatting? Or make a change that does not really influence the functionality of the software? Then you should use this.

### Using commit templates.

Here, I will illustrate the application of a commit template to staging a git commit either to a local or remote repository. To do this, head over to the same directory you were in at the start of the project titled `git-commiting`

Now we would make a change.

In the directory run:

```shell
vi example.py
```

This would open up the file in a Vim environment for edits. Then run the modify the following piece of code:

```python
# refactoring
printf("Testing commits in git.")
```

Now follow the same procedure to add the file to the local repository, and commit.
Before commiting, we are going to implement the above template. To do this, we need to identify the context of the commit and make it as simple and readable as possible. This is a "refactor," hence we use the `refactor` template. We can use either of these conventions for the commit messages:

Convention one:

```
refactor(Title): Body (Footer if any)
```

Or

Convention two:

```
refactor: (Title) Body (Footer if any)
```

Any of the above conventions works fine. Let us apply the first to this example like so:

```bash
git commit -m "refactor(comment): added comment to code" -m "* testing out commiting." -m "* comments are good."
```

We have no Footer in this case, if you do—go ahead and apply it.

This would generate a nicely crafted commit for us. Run `git log` to see that beauty. Ah, yes.

### Conclusion

Thank you for reading. Feel free to share with your fellow programmers, students, engineers or collaborators.
