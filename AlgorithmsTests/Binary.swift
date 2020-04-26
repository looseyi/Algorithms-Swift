//
//  Binary.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/22.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms


class BinaryHammingWeight: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }

    //输入0
    func testCase1() {
        XCTAssertEqual(solution.hammingWeight(0), 0)
        XCTAssertEqual(solution.hammingWeight2(0), 0)
    }

    //输入1
    func testCase2() {
        XCTAssertEqual(solution.hammingWeight(1), 1)
        XCTAssertEqual(solution.hammingWeight2(1), 1)
    }

    //输入10
    func testCase3() {
        XCTAssertEqual(solution.hammingWeight(10), 2)
        XCTAssertEqual(solution.hammingWeight2(10), 2)
    }

    //输入0x7FFFFFFF
    func testCase4() {
        XCTAssertEqual(solution.hammingWeight(Int("7FFFFFFF", radix: 16)!), 31)
        XCTAssertEqual(solution.hammingWeight2(Int("7FFFFFFF", radix: 16)!), 31)
    }

    //输入0xFFFFFFFF 负数
    func testCase5() {
        XCTAssertEqual(solution.hammingWeight(Int("FFFFFFFF", radix: 16)!), 32)
        XCTAssertEqual(solution.hammingWeight2(Int("FFFFFFFF", radix: 16)!), 32)
    }

    //输入0x80000000（负数），期待的输出是1
    func testCase6() {
        XCTAssertEqual(solution.hammingWeight(Int("80000000", radix: 16)!), 1)
        XCTAssertEqual(solution.hammingWeight2(Int("80000000", radix: 16)!), 1)
    }
}
