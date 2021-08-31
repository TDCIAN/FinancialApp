//
//  SearchResults.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/08/31.
//

import Foundation

struct SearchResults: Decodable {
    
    let items: [SearchResult]
    
    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }
}

struct SearchResult: Decodable {
    let symbol: String
    let name: String
    let type: String
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case currency = "8. currency"
    }
}

//{
//    "1. symbol": "APLE",
//    "2. name": "Apple Hospitality REIT Inc",
//    "3. type": "Equity",
//    "4. region": "United States",
//    "5. marketOpen": "09:30",
//    "6. marketClose": "16:00",
//    "7. timezone": "UTC-04",
//    "8. currency": "USD",
//    "9. matchScore": "0.8889"
//}
