//
//  Sort.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/8/12.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest

class MergedSort: BaseTest {

    func testCase1() {
        XCTAssertEqual(solution.mergeSorted([5,2,3,1]), [1,2,3,5])
    }

    func testCase2() {
        XCTAssertEqual(solution.mergeSorted([5,1,1,2,0,0]), [0,0,1,1,2,5])
    }
}

class QuickSort: BaseTest {

    func testCase1() {
        XCTAssertEqual(solution.quickSorted([5,2,3,1]), [1,2,3,5])
    }

    func testCase2() {
        XCTAssertEqual(solution.quickSorted([5,1,1,2,0,0]), [0,0,1,1,2,5])
    }
}

