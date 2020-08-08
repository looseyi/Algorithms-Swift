//
//  BackTracking.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/8/8.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation
import Algorithms
import XCTest

class BackTrackingPermutation: BaseTest {

    func testCase1() {
        XCTAssertEqual(solution.permute([1, 2, 3]), [
            [1,2,3],
            [1,3,2],
            [2,1,3],
            [2,3,1],
            [3,1,2],
            [3,2,1]
            ])
    }

    func testCaseUnit1() {
        XCTAssertEqual(solution.permuteUnique([1,1,2]), [
            [1,1,2],
            [1,2,1],
            [2,1,1]
        ])
    }

    func testCaseUnit2() {
        XCTAssertEqual(solution.permuteUnique([1,1,0,0,1,-1,-1,1]), [
            [1,1,2],
            [1,2,1],
            [2,1,1]
        ])
    }

}
