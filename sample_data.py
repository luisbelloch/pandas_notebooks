import pandas as pd

prices = pd.read_csv('./data/prices.csv', index_col=[0,1], parse_dates=True)

def stock_prices(symbol):
  data = prices[prices.index.get_level_values('Symbol').isin([symbol])]
  return prices.loc[symbol].copy()

# https://docs.python.org/3/library/warnings.html#warning-filter
# import warnings
# warnings.simplefilter(action='ignore')
# pd.set_option('mode.chained_assignment', None)
