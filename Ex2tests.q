/ Test data table
dataTable:([]Time:2023.08.08D10:00:00 2023.08.08D10:00:01 2023.08.08D10:00:02;
            Curr:`USD`EUR`USD;
            TP:100.0 150.0 105.0;
            AvgPrice: 100.0 151.0 106.0;
            Volume:500 300 200)

/ Test symList
symList: `USD`EUR

/ Test start and end time
startTime: 2023.08.08D10:00:00
endTime: 2023.08.08D10:00:02

/ TEST FOR VWAP FUNCTION
/ Expected result table
expected_vwapResult:`Curr xkey ([] Curr:`EUR`USD; vwap:(((150.0*300) % 300); ((100.0*500)%500; (((100*500) + (105.0*200)) % (500.0 + 200)))))

/ Call the vwapFunction with test data
vwapResult: vwapFunction[dataTable; symList; startTime; endTime]

/ Check if the result matches the expected result
expected_vwapResult[`EUR;`vwap] ~ vwapResult[`EUR;`vwap][0;0]
vwapResult[`USD;`vwap][0] ~ expected_vwapResult[`USD;`vwap]



/ TEST FOR TWAP FUNCTION
/ Expected result table
expected_twapResult:`Curr xkey ([] Curr:`EUR`USD; twap:((151.0%1); ((100.0+106.0)%2)))

/ Call the twapFunction with test data
twapResult: twapFunction[dataTable; symList; startTime; endTime]

/ Check if the result matches the expected result
expected_twapResult ~ twapResult
