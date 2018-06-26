import pandas as pd
prices = pd.read_msgpack('./data/prices.mp')

def stock_prices(symbol):
  data = prices[prices.index.get_level_values('Symbol').isin([symbol])]
  data.index = data.index.droplevel(0)
  return data
