//
//  Queue.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class TwoStackQueueTest: XCTestCase {

	var queue: TwoStackQueue<Int>!
	
	override func setUp(){
		super.setUp()
		queue = TwoStackQueue<Int>()
	}
	
	func testCase1() {
		queue.appendTail(element: 1)
		queue.appendTail(element: 2)
		queue.appendTail(element: 3)
		XCTAssertEqual(1, queue.deleteHead()!)
		XCTAssertEqual(2, queue.deleteHead()!)
		
		queue.appendTail(element: 4)
		XCTAssertEqual(3, queue.deleteHead()!)
		
		queue.appendTail(element: 5)
		XCTAssertEqual(4, queue.deleteHead()!)
		
		XCTAssertEqual(5, queue.deleteHead()!)
	}
}

