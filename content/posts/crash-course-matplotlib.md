---
title: "Crash Course: Matplotlib and Jupyter Notebook"
date: 2023-01-25T23:37:44+01:00
draft: true
tags: ['Crash Course, ML']
---

# Introduction to Matplotlib.

Matplotlib is a library used to create visualisations of data in the Python programming language. With matplotlib, you can create two-dimensional graphs using Python Scripts. It’s pretty cool and I will be showing you how you could use it for your subsequent projects, research and schoolwork alongside the Jupyter Notebook tool.

### Jupyter Notebooks.

A Jupyter Notebook is a locally hosted web application used for machine learning and data science tasks, which involves writing models, documenting models and visualising their implementation with tools such as Matplotlib or Seaborn (an alternative). It is relatively easy to set up and configure. You can easily install it by using the pip package manager, or [Anaconda](https://anaconda.org)

I have worked with anaconda primarily, to do cool stuff. But in this tutorial, we would be using pip and the general Python interpreter that works easily.

### Getting Started.

You should have Python installed on your machine. It is one of the most important perquisites. I usually recommend a Python 3 installation. To verify your version, simply run: `python --v`. That should print out the version you use, on your terminal. If you do not have Python, you can follow the [installation guide here for Ubuntu](https://docs.python-guide.org/starting/install3/linux/) or your local machine [here](https://python.org).

- I recommend you install [JupyterLab](https://jupyter.org) by running: `pip install jupyterlab`.
- Install Jupyter Notebook, via Pip. `pip install notebook`.
- To start the notebook, run the following command: `jupyter notebook`.

Viola. You should have a working notebook on your machine. It usually opens up for you in the browser. I am on chrome anyways.

![Notebook is working!](https://i.ibb.co/Jr5NpW6/Screencast-from-25-01-2023-17-49-10.gif)

Install matplotlib on your machine after satisfying the above requirements. Run `pip install matplotlib`.

### Using Matplotlib.

To use matplotlib, we are going to write a simple Python script in our jupyter notebook. Copy the code below:

```python
# Import the module
from matplotlib import pyplot as plt

# x-axis values
x = [7, 2,8, 1, 3]

# Y-axis values
y = [6, 9, 10, 4, 9]

# Function for plot scatter
plt.scatter(x, y)

# Function to display plot
plt.show()

```

Look at that nice plot. It worked!

![Matplotlib is working!](https://i.ibb.co/DGJ2LMB/Screencast-from-25-01-2023-17-59-49.gif)

### Exploring Chart Options.

In Matplotlib, we can effectively define our plots and how they appear by passing in a function after describing our $x$ and $y$ axis. I find this cool and useful. You could represent the data in the following:

- Line graph.
- Bar Plot
- Histogram
- Scattered Plot - (Above we used)

The only thing you have to do is specify which format the datasets should be represented on the graph.

### Labelling the Graph.

```python
# importing matplotlib module
from matplotlib import pyplot as plt
 
# x-axis values
x = [7, 2,8, 1, 3]

# Y-axis values
y = [6, 9, 10, 4, 9]

# Function to plot
plt.scatter(x, y)
 
# Adding Title
plt.title("Gray's graph.")
 
# Labeling the axes
plt.xlabel("Time (hr)")
plt.ylabel("Position (Km)")
 
# function to show the plot
plt.show()
```

### Conclusion.

Hope you ennjoyed the tutorial on matplotlib and jupyter notebook. Stay tuned in for more tutorials like these.