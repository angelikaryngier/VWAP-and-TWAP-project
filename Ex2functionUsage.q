/ Load table with currency data
fx_table: ("PJSFF"; enlist ",") 0: `:C:/q/joined_tables.csv

/ List of symbols (options to choose from: EURUSD, EURGBP, EURCHF)
symbolList: `EURUSD`EURGBP 
/ Start time
startTime: 2023.05.01D18:50:00.000000000 
/ End time
endTime: 2023.05.01D18:59:00.000000000 

/ Sample usage of the vwapFunction (Calculate VWAP for the given currency data, currency symbols and time range)
result_vwapTable: vwapFunction[fx_table; symbolList; startTime; endTime] 

/ Sample usage of the twapFunction (Calculate TWAP for the given currency data, currency symbols and time range)
result_twapTable: twapFunction[fx_table; symbolList; startTime; endTime] 

