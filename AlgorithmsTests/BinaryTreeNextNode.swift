//
//  BinaryTreeNextNode.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class BinaryTreeNextNode: XCTestCase {

	var solution: Solution!
	override func setUp() {
		super.setUp()
		solution = Solution()
	}
	
	//      8
	//   6    10
	//  5 7  9  11
	//  inOrder: 5,6,7,8,9,10,11
	func testCase1_7() {
		let node_8 = BinaryTreeNode(val: 8)
		let node_6 = BinaryTreeNode(val: 6, parent: node_8)
		let node_5 = BinaryTreeNode(val: 5, parent: node_6)
		let node_7 = BinaryTreeNode(val: 7, parent: node_6)
		node_6.left = node_5
		node_6.right = node_7
		let node_10 = BinaryTreeNode(val: 10, parent: node_8)
		let node_9 = BinaryTreeNode(val: 9, parent: node_10)
		let node_11 = BinaryTreeNode(val: 11, parent: node_10)
		node_10.left = node_9
		node_10.right = node_11
		
		node_8.left = node_6
		node_8.right = node_10
		
		XCTAssertEqual(solution.next(node_5)!, node_6)
		XCTAssertEqual(solution.next(node_6)!, node_7)
		XCTAssertEqual(solution.next(node_7)!, node_8)
		XCTAssertEqual(solution.next(node_8)!, node_9)
		XCTAssertEqual(solution.next(node_9)!, node_10)
		XCTAssertEqual(solution.next(node_10)!, node_11)
		XCTAssertEqual(solution.next(node_11), nil)
	}
	//       5
	//     4
	//   3
	// 2
	func testCase8_11() {
		let node_5 = BinaryTreeNode(val: 5)
		let node_4 = BinaryTreeNode(val: 4, parent: node_5)
		let node_3 = BinaryTreeNode(val: 3, parent: node_4)
		let node_2 = BinaryTreeNode(val: 2, parent: node_3)
		node_5.left = node_4
		node_4.left = node_3
		node_3.left = node_2
		XCTAssertEqual(solution.next(node_5), nil)
		XCTAssertEqual(solution.next(node_4)!, node_5)
		XCTAssertEqual(solution.next(node_3)!, node_4)
		XCTAssertEqual(solution.next(node_2)!, node_3)
	}
	//   2
	//    3
	//     4
	//      5
	func testCase12_15() {
		let node_2 = BinaryTreeNode(val: 2)
		let node_3 = BinaryTreeNode(val: 3, parent: node_2)
		let node_4 = BinaryTreeNode(val: 4, parent: node_3)
		let node_5 = BinaryTreeNode(val: 5, parent: node_4)
		node_2.right = node_3
		node_3.right = node_4
		node_4.right = node_5
		XCTAssertEqual(solution.next(node_5), nil)
		XCTAssertEqual(solution.next(node_4)!, node_5)
		XCTAssertEqual(solution.next(node_3)!, node_4)
		XCTAssertEqual(solution.next(node_2)!, node_3)
	}
	
	func testCase16() {
		let node_5 = BinaryTreeNode(val: 5)
		XCTAssertEqual(solution.next(node_5), nil)
	}
}

class BinaryTreeIsSubStructure: XCTestCase {
    var solution: Solution!

    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    // 树中结点含有分叉，树B是树A的子结构
    //                8          8
    //              /   \       / \
    //             8     7     9   2
    //           /   \
    //          9     2
    //               / \
    //              4   7
    func testCase1(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 7, parent: node_1)
        let node_4 = BinaryTreeNode(val: 9, parent: node_2)
        let node_5 = BinaryTreeNode(val: 2, parent: node_2)
        let node_6 = BinaryTreeNode(val: 4, parent: node_5)
        let node_7 = BinaryTreeNode(val: 7, parent: node_5)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_5.left = node_6
        node_5.right = node_7

        let node_8 = BinaryTreeNode(val: 8, parent: nil)
        let node_9 = BinaryTreeNode(val: 9, parent: node_8)
        let node_10 = BinaryTreeNode(val: 2, parent: node_8)
        node_8.left = node_9
        node_8.right = node_10

        XCTAssertTrue(solution.isSubStructure(node_1, node_8))
    }
    // 树中结点含有分叉，树B不是树A的子结构
    //        8              8
    //      /   \           / \
    //     8     7         9   2
    //   /   \
    //  9     3
    //       / \
    //      4   7
    func testCase2(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 7, parent: node_1)
        let node_4 = BinaryTreeNode(val: 9, parent: node_2)
        let node_5 = BinaryTreeNode(val: 3, parent: node_2)
        let node_6 = BinaryTreeNode(val: 4, parent: node_5)
        let node_7 = BinaryTreeNode(val: 7, parent: node_5)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_5.left = node_6
        node_5.right = node_7

        let node_8 = BinaryTreeNode(val: 8, parent: nil)
        let node_9 = BinaryTreeNode(val: 9, parent: node_8)
        let node_10 = BinaryTreeNode(val: 2, parent: node_8)
        node_8.left = node_9
        node_8.right = node_10

        XCTAssertFalse(solution.isSubStructure(node_1, node_8))
    }
    // 树中结点只有左子结点，树B是树A的子结构
    //              8           8
    //             /           /
    //            8           9
    //           /           /
    //          9           2
    //         /
    //        2
    //       /
    //      5
    func testCase3(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 9, parent: node_2)
        let node_4 = BinaryTreeNode(val: 2, parent: node_3)
        let node_5 = BinaryTreeNode(val: 5, parent: node_4)

        node_1.left = node_2
        node_2.left = node_3
        node_3.left = node_4
        node_4.left = node_5

        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 2, parent: node_7)
        node_6.left = node_7
        node_7.left = node_8

        XCTAssertTrue(solution.isSubStructure(node_1, node_6))
    }
    // 树中结点只有左子结点，树B不是树A的子结构
    //              8           8
    //             /           /
    //            8           9
    //           /           /
    //          9           3
    //         /
    //        2
    //       /
    //      5
    func testCase4(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 9, parent: node_2)
        let node_4 = BinaryTreeNode(val: 2, parent: node_3)
        let node_5 = BinaryTreeNode(val: 5, parent: node_4)

        node_1.left = node_2
        node_2.left = node_3
        node_3.left = node_4
        node_4.left = node_5

        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 3, parent: node_7)
        node_6.left = node_7
        node_7.left = node_8

        XCTAssertFalse(solution.isSubStructure(node_1, node_6))
    }
    // 树中结点只有右子结点，树B是树A的子结构
    //       8                   8
    //        \                   \
    //         8                   9
    //          \                   \
    //           9                   2
    //            \
    //             2
    //              \
    //               5
    func testCase5(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 9, parent: node_2)
        let node_4 = BinaryTreeNode(val: 2, parent: node_3)
        let node_5 = BinaryTreeNode(val: 5, parent: node_4)

        node_1.right = node_2
        node_2.right = node_3
        node_3.right = node_4
        node_4.right = node_5

        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 2, parent: node_7)
        node_6.right = node_7
        node_7.right = node_8

        XCTAssertTrue(solution.isSubStructure(node_1, node_6))
    }
    // 树A中结点只有右子结点，树B不是树A的子结构
    //       8                   8
    //        \    val          \
    //         8                   9
    //          \                 / \
    //           9               3   2
    //            \
    //             2
    //              \
    //               5
    func testCase6(){
        let node_1 = BinaryTreeNode(val: 8, parent: nil)
        let node_2 = BinaryTreeNode(val: 8, parent: node_1)
        let node_3 = BinaryTreeNode(val: 9, parent: node_2)
        let node_4 = BinaryTreeNode(val: 2, parent: node_3)
        let node_5 = BinaryTreeNode(val: 5, parent: node_4)

        node_1.right = node_2
        node_2.right = node_3
        node_3.right = node_4
        node_4.right = node_5

        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 9, parent: node_7)
        let node_9 = BinaryTreeNode(val: 2, parent: node_7)
        node_6.right = node_7
        node_7.left = node_8
        node_7.right = node_9

        XCTAssertFalse(solution.isSubStructure(node_1, node_6))
    }
    //树A为空
    func testCase7(){
        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 3, parent: node_7)
        let node_9 = BinaryTreeNode(val: 2, parent: node_8)
        node_6.right = node_7
        node_7.right = node_8
        node_8.right = node_9

        XCTAssertFalse(solution.isSubStructure(nil, node_6))
    }
    //树B为空
    func testCase8(){
        let node_6 = BinaryTreeNode(val: 8, parent: nil)
        let node_7 = BinaryTreeNode(val: 9, parent: node_6)
        let node_8 = BinaryTreeNode(val: 3, parent: node_7)
        let node_9 = BinaryTreeNode(val: 2, parent: node_8)
        node_6.right = node_7
        node_7.right = node_8
        node_8.right = node_9

        XCTAssertFalse(solution.isSubStructure(node_6, nil))
    }
    //树A和B都为空
    func testCase9(){
        XCTAssertFalse(solution.isSubStructure(nil, nil))
    }
}
