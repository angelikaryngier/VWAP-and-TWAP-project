# FX Pricing Data Analysis Project

This project focuses on analyzing foreign exchange (FX) pricing data using kdb+/q. It includes solutions to two exercises, the first involving time manipulation and vector operations, and the second concerning the calculation of VWAP and TWAP for FX pricing data.
#### Exercise 1: Time Manipulation
In this exercise, I create a vector of times, find the position of a given time within the vector, and adjust the vector based on the given time.

File:

    Exercise1.q: Solution to the time manipulation exercise.

#### Exercise 2: FX Pricing Data Analysis
This exercise involves the creation of a pricing data table for different FX currency pairs, along with the implementation of functions to calculate VWAP and TWAP for these currencies.

Files:

    EURCHF_M2.csv, EURUSD_M2.csv, EURGBP_M2.csv: Pricing data files for different FX currency pairs.
    joined_tables.csv: Data prepared and joined in q.
    Ex2prepareData.q: Preparation and joining of the pricing data.
    Ex2vwap.q: Implementation of the VWAP function.
    Ex2twap.q: Implementation of the TWAP function.
    Ex2functionUsage.q: Examples of how to call both the VWAP and TWAP functions.
    Ex2tests.q: Test cases to ensure the validity of the implemented functions.

To load the required functions:

    \l Ex2vwap.q
    \l Ex2twap.q  

    Call the functions with appropriate parameters as shown in Ex2functionUsage.q.

Example

For an example of how to use the functions and understand their output, refer to Ex2functionUsage.q.
Testing

To ensure the validity of the implemented functions, run the test cases in Ex2tests.q.
