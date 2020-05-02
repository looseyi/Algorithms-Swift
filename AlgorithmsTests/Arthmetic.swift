//
//  Arthmetic.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/22.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest


class ArthmeticPow: BaseTest {
   
    //底数2，指数3，结果8
    func testCase1() {
        XCTAssertEqual(solution.myPow(2.0, 10), 1024.0000)
    }
    //底数-2，指数3，结果-8
    func testCase2() {
        XCTAssertEqual(solution.myPow(-2, 3), -8)
    }
    //底数2，指数-3，结果0.125
    func testCase3() {
        XCTAssertEqual(solution.myPow(2, -3), 1/8)
    }
    //底数2，指数0，结果1
    func testCase4() {
        XCTAssertEqual(solution.myPow(2, 0), 1)
    }
    //底数0，指数0，结果1
    func testCase5() {
        XCTAssertEqual(solution.myPow(0, 0), 1)
    }
    //底数0，指数4，结果0
    func testCase6() {
        XCTAssertEqual(solution.myPow(0, 4), 0)
    }
    //底数0，指数-4，结果nil
    func testCase7() {
        XCTAssertEqual(solution.myPow(0, -4), 0)
    }
}
