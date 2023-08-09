/ Prepare table which holds a timeseries of pricing data with prices and sizes for different fx (foreign exchange) currencies
/ Load data for different fx currencies
EURGBP: ("PFFFFJS"; enlist ",") 0:`EURGBP_M2.csv
EURUSD: ("PFFFFJS"; enlist ",") 0:`EURUSD_M2.csv
EURCHF: ("PFFFFJS"; enlist ",") 0:`EURCHF_M2.csv

/ Join currency tables
joined_tables: raze (EURGBP; EURUSD; EURCHF)

/ Calculate typical price as a mean of High, Low and Close prices
joined_tables: update TP: (High + Low + Close) % 3 from joined_tables

/ Calculate average price as a mean of Open, High, Low and Close prices
joined_tables: update AvgPrice: (Open + High + Low + Close) % 4 from joined_tables

/ Delete unnecessary columns
joined_tables: delete Open, High, Low, Close from joined_tables

/ Save table to joined_tables.csv file
save `:C:/q/joined_tables.csv