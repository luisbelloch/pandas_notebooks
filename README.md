# Time-Series Analysis using Pandas

This repository contains the materials for a course on time series analysis using [Pandas](https://pandas.pydata.org) library.

- [Getting started with Pandas](01_getting_started.ipynb)
- [Plotting](02_plotting.ipynb)
- [Asset and Portfolio Returns](03_returns.ipynb)
- [Volatility](04_volatility.ipynb)
- [Moving Averages (SMA, EMA, MACD)](05_moving_averages.ipynb)
- [Value at Risk (VaR)](06_value_at_risk.ipynb)
- [Forecasting - ARIMA](07_forecasting_arima.ipynb)
- [Forecasting - Facebook's Prophet](08_forecasting_fbprophet.ipynb)
- [Blaze](09_blaze.ipynb)
- [Queue Simulation](09_queue_simulation.ipynb)
- [Graphs, matrices and SVD](10_graphs_matrices_and_svd.ipynb)
- [Assignments](0A_assignments.ipynb) - in Spanish
- [Exercises and their solutions](0B_exercises_and_solutions.ipynb)

### Starting Jupyter Lab

_TL;DR Run `make up` and navigate to the URL displayed in the logs._

We recommend to use [pyenv](https://github.com/pyenv/pyenv) along with [direnv](https://github.com/direnv/direnv/wiki/Python#pyenv) to manage different versions of Python. There's a `.python-version` file indicating the version we have tested the notebooks with. Also, all required packages are defined in `requirements.txt`, you may want to run the usual `pip install -r requirements.txt` to install them.

In case you want to [run Jupyter Lab using Docker](https://jupyter-docker-stacks.readthedocs.io/en/latest), this is a good starting point:

```bash
docker run -it --rm -p 8888:8888 -v "${PWD}":/home/jovyan/work jupyter/scipy-notebook
```

There is more information about the different Jupyter stacks [here](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html). If you want to install packages inside, you could either access to the container and run `pip install` or [use a custom `Dockerfile` for this](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-mamba-install-or-pip-install-in-a-child-docker-image). We have done some work for you, running `make up` in this repository will bring JupyterLab up.
