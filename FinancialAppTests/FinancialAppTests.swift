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

}
