//
//  Cutting.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/21.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class Cutting: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    //长度为1
    func testCase1() {
        XCTAssertEqual(solution.cuttingRope_dp(1), 0)
        XCTAssertEqual(solution.cuttingRope_greedy(1), 0)
    }
    //长度为2
    func testCase2() {
        XCTAssertEqual(solution.cuttingRope_dp(2), 1)
        XCTAssertEqual(solution.cuttingRope_greedy(2), 1)
    }
    //长度为3
    func testCase3() {
        XCTAssertEqual(solution.cuttingRope_dp(3), 2)
        XCTAssertEqual(solution.cuttingRope_greedy(3), 2)
    }
    //长度为4
    func testCase4() {
        XCTAssertEqual(solution.cuttingRope_dp(4), 4)
        XCTAssertEqual(solution.cuttingRope_greedy(4), 4)
    }
    //长度为5
    func testCase5() {
        XCTAssertEqual(solution.cuttingRope_dp(5), 6)
        XCTAssertEqual(solution.cuttingRope_greedy(5), 6)
    }
    //长度为6
    func testCase6() {
        XCTAssertEqual(solution.cuttingRope_dp(6), 9)
        XCTAssertEqual(solution.cuttingRope_greedy(6), 9)
    }
    //长度为7
    func testCase7() {
        XCTAssertEqual(solution.cuttingRope_dp(7), 12)
        XCTAssertEqual(solution.cuttingRope_greedy(7), 12)
    }
    //长度为8
    func testCase8() {
        XCTAssertEqual(solution.cuttingRope_dp(8), 18)
        XCTAssertEqual(solution.cuttingRope_greedy(8), 18)
    }
    //长度为9
    func testCase9() {
        XCTAssertEqual(solution.cuttingRope_dp(9), 27)
        XCTAssertEqual(solution.cuttingRope_greedy(9), 27)
    }
    //长度为10
    func testCase10() {
        XCTAssertEqual(solution.cuttingRope_dp(10), 36)
        XCTAssertEqual(solution.cuttingRope_greedy(10), 36)
    }
    //长度为50
    func testCase11() {
        XCTAssertEqual(solution.cuttingRope_dp(50), 86093442)
        XCTAssertEqual(solution.cuttingRope_greedy(50), 86093442)
    }
}
