//
//  StringPattern.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/25.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
@_exported import Algorithms

final class stringMatchPatternDP: XCTestCase {

    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    func testCase1(){
        XCTAssertTrue(solution.stringMatchPatternDP("", ""))
        XCTAssertFalse(solution.stringMatchPatternDP("", "."))
        XCTAssertTrue(solution.stringMatchPatternDP("", ".*"))
        XCTAssertTrue(solution.stringMatchPatternDP("", "c*"))
    }

    func testCase2() {
//        XCTAssertTrue(solution.stringMatchPatternDP("a", ".*"))
//        XCTAssertFalse(solution.stringMatchPatternDP("a", ""))
//        XCTAssertTrue(solution.stringMatchPatternDP("a", "."))
        XCTAssertTrue(solution.stringMatchPatternDP("a", "ab*"))
//        XCTAssertFalse(solution.stringMatchPatternDP("a", "a."))
//        XCTAssertFalse(solution.stringMatchPatternDP("a", "ab*a"))
    }

    func testCase3() {
        XCTAssertTrue(solution.stringMatchPatternDP("aa", "aa"))
        XCTAssertTrue(solution.stringMatchPatternDP("aa", "a*"))
        XCTAssertTrue(solution.stringMatchPatternDP("aa", ".*"))
        XCTAssertFalse(solution.stringMatchPatternDP("aa", "."))
        XCTAssertTrue(solution.stringMatchPatternDP("ab", ".*"))
    }

    func testCase4() {
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", "aa*"))
        XCTAssertFalse(solution.stringMatchPatternDP("aaa", "aa.a"))
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", "a.a"))
        XCTAssertFalse(solution.stringMatchPatternDP("aaa", ".a"))
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", "a*a"))
        XCTAssertFalse(solution.stringMatchPatternDP("aaa", "ab*a"))
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", "ab*ac*a"))
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", "ab*a*c*a"))
        XCTAssertTrue(solution.stringMatchPatternDP("aaa", ".*"))
        XCTAssertTrue(solution.stringMatchPatternDP("aab", "c*a*b"))
    }

    func testCase5() {
        XCTAssertTrue(solution.stringMatchPatternDP("aaca", "ab*a*c*a"))
        XCTAssertFalse(solution.stringMatchPatternDP("aaba", "ab*a*c*a"))
        XCTAssertTrue(solution.stringMatchPatternDP("bbbba", ".*a*a"))
        XCTAssertFalse(solution.stringMatchPatternDP("bcbbabab", ".*a*a"))
    }
}
