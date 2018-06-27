import pandas as pd
import pandas_datareader.data as web
from datetime import datetime
from sample_data import stock_prices

symbols = ["aapl", "msft", "goog", "tsla"]

data = web.DataReader(symbols, "morningstar", datetime(2010, 1, 1), datetime(2018, 12, 31))
data.to_msgpack('./data/prices.mp')
data.head()

for symbol in symbols:
    filename = './data/{}.mp'.format(symbol);
    stock_prices(symbol).to_msgpack(filename)
    print(symbol)
    print(pd.read_msgpack(filename).head())
    print()
