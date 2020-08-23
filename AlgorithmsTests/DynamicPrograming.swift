//
//  DynamicPrograming.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/5/7.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest

class MincostTickets: BaseTest {

    func testCase1() {
        let days = [1,4,6,7,8,20], costs = [2,7,15]
        let result = solution.mincostTickets(days, costs)
        XCTAssertEqual(result, 11)
    }

    func testCase2() {
        let days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
        let result = solution.mincostTickets(days, costs)
        XCTAssertEqual(result, 11)
    }
}


class CoinChangeTest: BaseTest {
    func testCase1() {
        let coins = [1,2,5]
        let result = solution.coinChange(coins, 11)
        XCTAssertEqual(result, 3)
    }
}
