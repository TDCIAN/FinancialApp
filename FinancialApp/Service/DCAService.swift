//
//  DCAService.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/09/06.
//

import Foundation

struct DCAService {
    func calculate(initialInvestmentAmount: Double, monthlyDollorCostAverageAmount: Double, initialDateOfInvestmentIndex: Int) -> DCAResult {
        
        let investmentAmount = getInvestmentAmount(initialInvestmentAmount: initialInvestmentAmount,
                                                   monthlyDollorCostAverageAmount: monthlyDollorCostAverageAmount,
                                                   initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        return .init(currentValue: 0,
                     investmentAmount: investmentAmount,
                     gain: 0,
                     yield: 0,
                     annualReturn: 0)
    }
    
    private func getInvestmentAmount(initialInvestmentAmount: Double,
                                     monthlyDollorCostAverageAmount: Double,
                                     initialDateOfInvestmentIndex: Int) -> Double {
        var totalAmount = Double()
        totalAmount += initialInvestmentAmount
        let dollarCostAveragingAmounts = initialDateOfInvestmentIndex.doubleValue * monthlyDollorCostAverageAmount
        totalAmount += dollarCostAveragingAmounts
        return totalAmount
    }
}

struct DCAResult {
    let currentValue: Double
    let investmentAmount: Double
    let gain: Double
    let yield: Double
    let annualReturn: Double
}
