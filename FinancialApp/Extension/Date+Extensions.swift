//
//  Date+Extensions.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/09/03.
//

import Foundation

extension Date {
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
