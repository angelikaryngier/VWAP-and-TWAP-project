/ Command to start a q process which will load vwapFunction
\l Ex2vwap.q

/ Command to start a q process which will load twapFunction
\l Ex2twap.q

/ Test data table
dataTable:([]Time:2023.08.08D10:00:00 2023.08.08D10:00:01 2023.08.08D10:00:02;
            Curr:`EURGBP`EURUSD`EURGBP;
            TP:100.0 150.0 105.0;
            AvgPrice: 100.0 151.0 106.0;
            Volume:500 300 200)

/ Test symList
symList: `EURGBP`EURUSD

/ Test start and end time
startTime: 2023.08.08D10:00:00
endTime: 2023.08.08D10:00:02

/ TEST FOR VWAP FUNCTION
/ Expected result table
expected_vwapResult:`Curr xkey ([] Curr:`EURUSD`EURGBP; vwap:(((150.0*300) % 300); ((100.0*500)%500; (((100*500) + (105.0*200)) % (500.0 + 200)))))

/ Call the vwapFunction with test data
vwapResult: vwapFunction[dataTable; symList; startTime; endTime]

/ Check if the result matches the expected result
expected_vwapResult[`EURUSD;`vwap] ~ vwapResult[`EURUSD;`vwap][0;0]
vwapResult[`EURGBP;`vwap][0] ~ expected_vwapResult[`EURGBP;`vwap]



/ TEST FOR TWAP FUNCTION
/ Expected result table
expected_twapResult:`Curr xkey ([] Curr:`EURGBP`EURUSD; twap:(((100.0+106.0)%2); (151.0%1)))

/ Call the twapFunction with test data
twapResult: twapFunction[dataTable; symList; startTime; endTime]

/ Check if the result matches the expected result
expected_twapResult ~ twapResult
