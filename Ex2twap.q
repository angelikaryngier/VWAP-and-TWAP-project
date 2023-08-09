/ Function to calculate TWAP (Time Weighted Average Price) for given table with data, currency symbols and time range
/ dataTable:    Table with data icluding Time, Curr and AvgPrice
/ symList:   List of currency symbols
/ startTime: Start time of the time range
/ endTime:   End time of the time range
/ Returns a table with TWAP values for each currency symbol
twapFunction:{[dataTable; symList; startTime; endTime]
    prices:([]Time:();Curr:();AvgPrice:());
    / Select prices within the given time range and for the specified symbols
    prices:select Time, Curr, AvgPrice from dataTable where Time within(startTime; endTime), Curr in symList;
    
    / Calculate the average of AvgPrice for each symbol
    twapTable:select twap:avg AvgPrice by Curr from prices;
    
    / Return the final table with VWAP for each symbol
    twapTable    
    }