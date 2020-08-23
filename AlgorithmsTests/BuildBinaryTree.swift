//
//  BuildBinaryTree.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest


class BuildBinaryTree: BaseTest {
	
	// normal binary tree
	//             1
	//           /   \
	//          2      3
	//         /      / \
	//        4      5   6
	//         \        /
	//          7      8
	func testCaseBTNormal() {
		let preorder = [1, 2, 4, 7, 3, 5, 6, 8]
		let inorder = [4, 7, 2, 1, 5, 3, 8, 6]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertTrue(result?.preOrder() == preorder)
		XCTAssertTrue(result?.inOrder() == inorder)
	}
	
	// binary tree without right nodes
	//            1
	//           /
	//          2
	//         /
	//        3
	//       /
	//      4
	//     /
	//    5
	func testCaseBTWithoutRightNode() {
		let preorder = [1, 2, 3, 4, 5]
		let inorder = [5, 4, 3, 2, 1]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertTrue(result?.preOrder() == preorder)
		XCTAssertTrue(result?.inOrder() == inorder)
	}
	
	// binary tree without left nodes
	//            1
	//             \
	//              2
	//               \
	//                3
	//                 \
	//                  4
	//                   \
	//                    5
	func testCaseBTWithoutLeftNode() {
		let preorder = [1, 2, 3, 4, 5]
		let inorder = [1, 2, 3, 4, 5]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertTrue(result?.preOrder() == preorder)
		XCTAssertTrue(result?.inOrder() == inorder)
	}

	// binary tree with single node
	func testCaseBTSingleNode() {
		let preorder = [1]
		let inorder = [1]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertTrue(result?.preOrder() == preorder)
		XCTAssertTrue(result?.inOrder() == inorder)
	}

	// complete binary tree
	//              1
	//           /     \
	//          2       3
	//         / \     / \
	//        4   5   6   7
	func testCaseBTComplete() {
		let preorder = [1, 2, 4, 5, 3, 6, 7]
		let inorder = [4, 2, 5, 1, 6, 3, 7]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertTrue(result?.preOrder() == preorder)
		XCTAssertTrue(result?.inOrder() == inorder)
	}

	// mismatch two binary tree
	func testCaseBTDifference() {
		let preorder = [1, 2, 4, 5, 3, 6, 7]
		let inorder = [4, 2, 8, 1, 6, 3, 7]
		let result = solution.buildTree(preorder, inorder)
		XCTAssertFalse(result?.preOrder() == preorder)
		XCTAssertFalse(result?.inOrder() == inorder)
	}
}

class BinarSearchTree: BaseTest {

    func testIsValidBST1() {
        let preorder = [1,2,3]
        let inorder = [2,1,3]
        let result = solution.buildTree(preorder, inorder)
        XCTAssertTrue(solution.isValidBST(result))
    }

    func testIsValidBST2() {
        let preorder = [5,1,4,3,6]
        let inorder = [1,5,3,4,6]
        let result = solution.buildTree(preorder, inorder)
        XCTAssertFalse(solution.isValidBST(result))
    }
}

class BinarSearchTreeRecover: BaseTest {

    func testRecoverBST1() {
        let preorder = [1,3,2]
        let inorder = [3,2,1]
        let result = solution.buildTree(preorder, inorder)
        solution.recoverBST(result)
        XCTAssertEqual(result!.description, "1\n2\n3")
    }

    func testRecoverBST2() {
        let preorder = [2,1,4,3]
        let inorder = [1,2,4,3]
        let result = solution.buildTree(preorder, inorder)
        solution.recoverBST1(result)
        XCTAssertEqual(result!.description, "2\n1\n4\n3")
    }
}
