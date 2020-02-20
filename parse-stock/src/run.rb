require 'rest-client'
require 'json'

# IO.write(
# 	'./out.json',
# 	RestClient.post(
# 		'https://scanner.tradingview.com/russia/scan',
# 		{
# 			"filter":[{"left":"Volatility.D","operation":"nempty"}],
# 			"options":{"lang":"ru","active_symbols_only":true},"symbols":{"query":{"types":[]},"tickers":[]},"columns":["name","change|1","change|5","change|15","change|60","change|240","change","Perf.W","Perf.1M","Perf.3M","Perf.6M","Perf.YTD","Perf.Y","beta_1_year","Volatility.D","description","name","type","subtype","update_mode"],"sort":{"sortBy":"Volatility.D","sortOrder":"desc"},"range":[0,100]
# 		}.to_json, 
# 		headers={}
# 	)
# )

Dir.mkdir('data') unless File.exists?('data')

IO.write(
	"./data/out-#{Time.now.strftime('%Y-%m-%d')}.json",
	RestClient.post(
		'https://scanner.tradingview.com/russia/scan',

		{
			"filter":[
				{"left":"market_cap_basic","operation":"nempty"},
				{"left":"type","operation":"in_range","right":["stock","dr","fund"]},
				{"left":"subtype","operation":"in_range","right":["common","","etf","unit","mutual","money","reit","trust"]}
			],
			"options":{"lang":"ru"},
			"symbols":{"query":{"types":[]},
			"tickers":[]},
			"columns":[
				"name","close","change","change_abs","Recommend.All","Value.Traded","volume","market_cap_basic","price_earnings_ttm",
				"earnings_per_share_basic_ttm","number_of_employees","sector","gross_profit","gross_margin","after_tax_margin",
				"net_debt","price_free_cash_flow_ttm","price_sales_ratio","price_revenue_ttm","price_book_fq","price_book_ratio",
				"enterprise_value_ebitda_ttm","enterprise_value_fq","average_volume_10d_calc","average_volume_90d_calc",
				"average_volume_30d_calc","average_volume_60d_calc","VWAP","goodwill","last_annual_eps","earnings_per_share_fq",
				"earnings_per_share_diluted_ttm","operating_margin","total_revenue","total_assets","total_debt","total_current_assets",
				"quick_ratio","current_ratio","change|5","change|240","change|60","change|1","change|15","debt_to_equity",
				"return_on_equity","pre_tax_margin","Perf.3M","Perf.6M","Perf.Y","Perf.1M","Perf.W","Perf.YTD","dividends_per_share_fq",
				"dps_common_stock_prim_issue_fy","dividend_yield_recent","MoneyFlow","ChaikinMoneyFlow","earnings_release_next_date",
				"earnings_release_date","premarket_gap","gap","revenue_per_employee","last_annual_revenue","dividends_paid",
				"total_shares_outstanding_fundamental","Volatility.W","Volatility.M","Volatility.D","gross_profit_fq","exchange",
				"basic_eps_net_income","float_shares_outstanding","ebitda","BBPower","change_abs|5","change_abs|240",
				"change_from_open_abs","change_abs|60","change_abs|1","change_abs|15","change_from_open","number_of_shareholders",
				"high","High.1M","High.3M","price_52_week_high","High.6M","High.All","low","Low.1M","Low.3M","price_52_week_low",
				"Low.6M","Low.All","relative_volume_10d_calc","industry","name","return_on_invested_capital","return_on_assets",
				"earnings_per_share_forecast_next_fq","country","postmarket_close","open","premarket_close","MACD.macd","net_income",
				"description","name","type","subtype","update_mode","pricescale","minmov","fractional","minmove2","Rec.BBPower",
				"Candle.AbandonedBaby.Bullish","Candle.AbandonedBaby.Bearish","Candle.Marubozu.White","Candle.SpinningTop.White",
				"Candle.Harami.Bullish","Candle.Kicking.Bullish","Candle.TriStar.Bullish","Candle.Engulfing.Bullish",
				"Candle.EveningStar","Candle.LongShadow.Upper","Candle.LongShadow.Lower","Candle.Doji","Candle.Doji.Gravestone",
				"Candle.Doji.Dragonfly","Candle.Harami.Bearish","Candle.Kicking.Bearish","Candle.TriStar.Bearish",
				"Candle.Engulfing.Bearish","Candle.Hammer","Candle.ShootingStar","Candle.HangingMan","Candle.3BlackCrows",
				"Candle.InvertedHammer","Candle.3WhiteSoldiers","Candle.MorningStar","Candle.Marubozu.Black","Candle.SpinningTop.Black",
				"MACD.macd","MACD.signal"
			],
			"sort":{"sortBy":"market_cap_basic","sortOrder":"desc"},
			"range":[0,400]
		
		}.to_json, 
		headers={}
	)
)

