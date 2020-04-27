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



class NumericStrings: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }

    func testCase1(){
        XCTAssertEqual(solution.isNumeric("100"), true)
        XCTAssertEqual(solution.isNumeric("123.45e+6"), true)
        XCTAssertEqual(solution.isNumeric("+500"), true)
        XCTAssertEqual(solution.isNumeric("5e2"), true)
        XCTAssertEqual(solution.isNumeric("3.1416"), true)
        XCTAssertEqual(solution.isNumeric("600."), true)
        XCTAssertEqual(solution.isNumeric("-.123"), true)
        XCTAssertEqual(solution.isNumeric("-1E-16"), true)
        XCTAssertEqual(solution.isNumeric("1.79769313486232E+308"), true)
        XCTAssertEqual(solution.isNumeric("12e"), false)
        XCTAssertEqual(solution.isNumeric("1a3.14"), false)
        XCTAssertEqual(solution.isNumeric("1+23"), false)
        XCTAssertEqual(solution.isNumeric("1.2.3"), false)
        XCTAssertEqual(solution.isNumeric("+-5"), false)
        XCTAssertEqual(solution.isNumeric("12e+5.4"), false)
        XCTAssertEqual(solution.isNumeric("."), false)
        XCTAssertEqual(solution.isNumeric(".e1"), false)
        XCTAssertEqual(solution.isNumeric("+."), false)
        XCTAssertEqual(solution.isNumeric(""), false)
    }
}
