from datetime import datetime

import pandas as pd
import pandas_datareader.data as web

symbols = ["aapl", "msft", "goog", "tsla", "^GSPC"]
data = web.DataReader(symbols, "yahoo", datetime(2010, 1, 1), datetime.now())
data.stack().swaplevel().to_csv('./data/prices.csv')
