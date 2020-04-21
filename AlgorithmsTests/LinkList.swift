//
//  LinkList.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class LinkList: XCTestCase {
	
	var solution: Solution!
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	
	/// 1->2->3->4->5
	func testCaseLinkNormal() {
		let node5 = ListNode(value: 5, next: nil)
		let node4 = ListNode(value: 4, next: node5)
		let node3 = ListNode(value: 3, next: node4)
		let node2 = ListNode(value: 2, next: node3)
		let node1 = ListNode(value: 1, next: node2)
		XCTAssertEqual(solution.reverseListNode(node1), [5,4,3,2,1])
	}
	
	/// single node
	func testCaseLinkListSingle() {
		let node1 = ListNode(value: 1, next: nil)
		XCTAssertEqual(solution.reverseListNode(node1), [1])
	}
}
