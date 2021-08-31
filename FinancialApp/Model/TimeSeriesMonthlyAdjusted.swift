//
//  TimeSeriesMonthlyAdjusted.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/08/31.
//

import Foundation

struct TimeSeriesMonthlyAdjusted: Decodable {
    let meta: Meta
    let timeSeries: [String: OHLC]
}

struct Meta: Decodable {
    let symbol: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "2. Symbol"
    }
}

// Open, High, Low, Close
struct OHLC: Decodable {
    let open: String
    let close: String
    let adjustedClose: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case close = "4. close"
        case adjustedClose = "5. adjusted close"
    }
}
/*
 {
     "Meta Data": {
         "1. Information": "Monthly Adjusted Prices and Volumes",
         "2. Symbol": "IBM",
         "3. Last Refreshed": "2021-08-30",
         "4. Time Zone": "US/Eastern"
     },
     "Monthly Adjusted Time Series": {
         "2021-08-30": {
             "1. open": "141.4500",
             "2. high": "144.7000",
             "3. low": "137.2100",
             "4. close": "138.9700",
             "5. adjusted close": "138.9700",
             "6. volume": "65451955",
             "7. dividend amount": "1.6400"
         },
         "2021-07-30": {
             "1. open": "146.9600",
             "2. high": "147.5000",
 

 */
