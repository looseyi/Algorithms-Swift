
//
//  minNumberInRotatedArray2.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/14.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class minNumberInRotatedArray2: XCTestCase {

	var solution: Solution!
	
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	
	// 典型输入，单调升序的数组的一个旋转
	func testCase1() {
		let nums = [3, 4, 5, 1, 2]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
	}
	// 有重复数字，并且重复的数字刚好的最小的数字
	func testCase2() {
		let nums = [3, 4, 5, 1, 1, 2]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
	}
	// 有重复数字，但重复的数字不是第一个数字和最后一个数字
	func testCase3() {
		let nums = [3, 4, 5, 1, 2, 2]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
	}
	// 有重复的数字，并且重复的数字刚好是第一个数字和最后一个数字
	func testCase4() {
		let nums = [1, 0, 1, 1, 1]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 0)
	}
	// 单调序数组，旋转0个元素，也就是单调升序数组本身
	func testCase5() {
		let nums = [3, 1]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
	}
	func testCase6() {
		let nums = [3, 1, 3]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
	}
	// 数组中只有一个数字
	func testCase7() {
		let nums = [2]
		XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 2)
	}
    func testCase8() {
        let nums = [2,0,1,1,1]
        XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 0)
    }
    func testCase9() {
        let nums = [1, 3, 5]
        XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
    }
    func testCase10() {
        let nums = [3, 1]
        XCTAssertEqual(solution.minNumberInRotatedArray2(nums), 1)
    }
}
