/ Function to calculate VWAP (Volume Weighted Average Price) for given table with data, currency symbols and time range
/ dataTable:    Table with data icluding columns: Time, Curr, TP and Volume
/ symList:   List of currency symbols
/ startTime: Start time of the time range
/ endTime:   End time of the time range
/ Returns a table with VWAP values for each currency symbol
vwapFunction:{[dataTable; symList; startTime; endTime]
    trades:([]Time:();Curr:();TP:();Volume:());
    / Select trades within the given time range and for the specified symbols
    trades:select Time, Curr, TP, Volume from dataTable where Time within(startTime; endTime), Curr in symList;
    
    / Calculate the sum of (TP * Volume) for each symbol
    sumPriceVolume:select sumPriceVolume:sums TP*Volume by Curr from trades;
    
    / Calculate the sum of volume for each symbol
    sumVolume:select sumVolume:sums Volume by Curr from trades;
    
    / Merge the two tables and calculate VWAP for each symbol
    vwapTable:sumPriceVolume lj `Curr xkey sumVolume;
    
    / Calculate VWAP by dividing sumPriceVolume by sumVolume for each symbol
    vwapTable:select vwap:sumPriceVolume%sumVolume by Curr from vwapTable;
    
    / Return the final table with VWAP for each symbol
    vwapTable
    }