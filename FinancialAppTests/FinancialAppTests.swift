//
//  FinancialAppTests.swift
//  FinancialAppTests
//
//  Created by 김정민 on 2021/09/06.
//

import XCTest
@testable import FinancialApp

class FinancialAppTests: XCTestCase {

    // system under test
    var sut: DCAService!
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = DCAService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }
    
    // test cases
    // 1. asset = winning | dca = true => positive gains
    // 2. asset = winning | dca = false => positive gains
    // 3. asset = losing | dca = true => negative gains
    // 4. asset = losing | dca = false => negative gains
    
    // Format for test function name
    // what
    // given
    // expectation

    // test case 이름 지을 때는 what, given, expectation 순으로 지어야 한다.
    func testResult_givenWinningAssetAndDCAIsUsed_expectPositiveGains() {
        // given
        let initialInvestmentAmount: Double = 5000
        let monthlyDollorCostAverageAmount: Double = 1500
        let initialDateOfInvestmentIndex: Int = 5
        let asset = buildWinningAsset()
        // when
        let result = sut.calculate(asset: asset,
                                   initialInvestmentAmount: initialInvestmentAmount,
                                   monthlyDollorCostAverageAmount: monthlyDollorCostAverageAmount,
                                   initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        // then
        // Initial investment: $5000
        // DCA: $1500 * 5 = $7500
        // total: $5000 + $7500 = $12500
        XCTAssertEqual(result.investmentAmount, 12500, "investment amount is incorrect")
    }
    
    func testResult_givenWinningAssetAndDCAIsNotUsed_expectPositiveGains() {
        
    }
    
    func testResult_givenLosingAssetAndDCAIsUsed_expectNegativeGains() {
        
    }
    
    func testResult_givenLosingAssetAndDCAIsNotUsed_expectNegativeGains() {
        
    }
    
    private func buildWinningAsset() -> Asset {
        let searchResult = buildSearchResult()
        let meta = buildMeta()
        let timeSeries: [String: OHLC] = ["2021-01-25":OHLC(open: "100", close: "0", adjustedClose: "110"),
                                          "2021-02-25":OHLC(open: "110", close: "0", adjustedClose: "120"),
                                          "2021-03-25":OHLC(open: "120", close: "0", adjustedClose: "130"),
                                          "2021-04-25":OHLC(open: "130", close: "0", adjustedClose: "140"),
                                          "2021-05-25":OHLC(open: "140", close: "0", adjustedClose: "150"),
                                          "2021-06-25":OHLC(open: "150", close: "0", adjustedClose: "160")]
        
        let timeSeriesMonthlyAdjusted = TimeSeriesMonthlyAdjusted(meta: meta,
                                                                  timeSeries: timeSeries)
        
        return Asset(searchResult: searchResult,
                     timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
    }
    
    private func buildSearchResult() -> SearchResult {
        return SearchResult(symbol: "XYZ", name: "XYZ Company", type: "ETF", currency: "USD")
    }
    
    private func buildMeta() -> Meta {
        return Meta(symbol: "XYZ")
    }
    
    func testInvestment_whenDCAIsUsed_expectResult() {
        // given
        let initialInvestAmount: Double = 500
        let monthlyDollarCostAveragingAmount: Double = 100
        let initialDateOfInvestmentIndex = 4 // 5 months ago
        // when
        let investmentAmount = sut.getInvestmentAmount(initialInvestmentAmount: initialInvestAmount,
                                             monthlyDollorCostAverageAmount: monthlyDollarCostAveragingAmount,
                                             initialDateOfInvestmentIndex: initialDateOfInvestmentIndex)
        // then
//        XCTAssertEqual(investmentAmount, 1000) // XCTAssertEqual failed: ("900.0") is not equal to ("1000.0")
        
        // Initial Amount: $500
        // DCA: 4 * $100 = $400
        // total: $400 + $500 = $900
    }
    
    func testInvestmentAmount_whenDCAIsNotUsed_expectResult() {
        
    }
}
