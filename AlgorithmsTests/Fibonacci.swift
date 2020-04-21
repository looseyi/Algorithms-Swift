//
//  Fibonacci.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class FibonacciTest: XCTestCase {

	var solution: Solution!
	
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	private func test(_ n: Int, expected: Int) {
		XCTAssertEqual(solution.fibonacciLoop(n), expected)
		XCTAssertEqual(solution.fibonacciRecursive(n), expected)
	}
	
	func testCase1() {
		test(0, expected: 0)
		test(1, expected: 1)
		test(2, expected: 1)
		test(3, expected: 2)
		test(4, expected: 3)
		test(5, expected: 5)
		test(6, expected: 8)
		test(7, expected: 13)
		test(8, expected: 21)
		test(9, expected: 34)
		test(10, expected: 55)
		test(20, expected: 6765)
		//再往上测试，通过递归的方式，CPU就得💥💥💥
	}

}
