//
//  DuplicationInArray.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class DuplicationInArrayEditDisable: XCTestCase {
	
	var solution: Solution!
	
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	
	///数组中存在多个重复的数字
	func testCase1() {
		let nums = [2, 3, 5, 4, 3, 2, 6, 7]
		let duplications = [2,3]
		XCTAssertTrue(duplications.contains(solution.duplicateEditDisable(nums)!))
	}
	///数组中存在一个重复的数字
	func testCase2() {
		let nums = [3, 2, 1, 4, 4, 5, 6, 7]
		XCTAssertEqual(solution.duplicateEditDisable(nums)!, 4)
	}
	///重复数字是数组中最小的数字
	func testCase3() {
		let nums = [1, 2, 3, 4, 5, 6, 7, 1, 8]
		XCTAssertEqual(solution.duplicateEditDisable(nums)!, 1)
	}
	///重复数字是数组中最大的数字
	func testCase4() {
		let nums = [1, 7, 3, 4, 5, 6, 8, 2, 8]
		XCTAssertEqual(solution.duplicateEditDisable(nums)!, 8)
	}
	///数组中只有两个数字
	func testCase5() {
		let nums = [1, 1]
		XCTAssertEqual(solution.duplicateEditDisable(nums)!, 1)
	}
	///一个数字重复三次
	func testCase6() {
		let nums = [1, 2, 2, 6, 4, 5, 2]
		XCTAssertEqual(solution.duplicateEditDisable(nums)!, 2)
	}
	///数组中不存在重复的数字
	func testCase7() {
		let nums = [1, 2, 6, 4, 5, 3]
		XCTAssertNil(solution.duplicateEditDisable(nums))
	}
	///无效输入
	func testCase8() {
		let nums:[Int] = []
		XCTAssertNil(solution.duplicateEditDisable(nums))
	}
}


class DuplicationInArrayEditEnable: XCTestCase {
	var solution: Solution!
	
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	///重复数字是数组中最小的数字
	func testCase1() {
		let nums = [2, 1, 3, 1, 4]
		XCTAssertEqual(solution.duplicateEditEnable(nums)!.num, 1)
	}
	///重复数字是数组中最大的数字
	func testCase2() {
		let nums = [2, 4, 3, 1, 4]
		XCTAssertEqual(solution.duplicateEditEnable(nums)!.num, 4)
	}
	///数组中存在多个重复的数字
	func testCase3() {
		let nums = [2, 4, 2, 1, 4]
		let duplications = [2,4]
		XCTAssertTrue(duplications.contains(solution.duplicateEditEnable(nums)!.num))
	}
	///数组中不存在重复的数字
	func testCase4() {
		let nums = [2, 1, 3, 0, 4]
		XCTAssertNil(solution.duplicateEditEnable(nums))
	}
	///无效输入
	func testCase5() {
		let nums:[Int] = []
		XCTAssertNil(solution.duplicateEditEnable(nums))
	}
}
