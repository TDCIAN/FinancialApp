//
//  APIService.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/08/31.
//

import Foundation
import Combine

struct APIService {
    static var key: String {
        let keys: [String] = ["PX40A1II4YND2OGE", "5GIMV9VKZDVHLJTQ", "9ENLS3NPR86NE79F"]
        return keys.randomElement() ?? "PX40A1II4YND2OGE"
    }
    
    // use combine
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(APIService.key)"
        
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

