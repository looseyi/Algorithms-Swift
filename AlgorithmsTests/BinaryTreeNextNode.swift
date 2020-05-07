//
//  BinaryTreeNextNode.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class BinaryTreeNextNode: BaseTest {
	
	//      8
	//   6    10
	//  5 7  9  11
	//  inOrder: 5,6,7,8,9,10,11
	func testCase1_7() {
		let node_8 = TreeNode(val: 8)
		let node_6 = TreeNode(val: 6, parent: node_8)
		let node_5 = TreeNode(val: 5, parent: node_6)
		let node_7 = TreeNode(val: 7, parent: node_6)
		node_6.left = node_5
		node_6.right = node_7
		let node_10 = TreeNode(val: 10, parent: node_8)
		let node_9 = TreeNode(val: 9, parent: node_10)
		let node_11 = TreeNode(val: 11, parent: node_10)
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
		let node_5 = TreeNode(val: 5)
		let node_4 = TreeNode(val: 4, parent: node_5)
		let node_3 = TreeNode(val: 3, parent: node_4)
		let node_2 = TreeNode(val: 2, parent: node_3)
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
		let node_2 = TreeNode(val: 2)
		let node_3 = TreeNode(val: 3, parent: node_2)
		let node_4 = TreeNode(val: 4, parent: node_3)
		let node_5 = TreeNode(val: 5, parent: node_4)
		node_2.right = node_3
		node_3.right = node_4
		node_4.right = node_5
		XCTAssertEqual(solution.next(node_5), nil)
		XCTAssertEqual(solution.next(node_4)!, node_5)
		XCTAssertEqual(solution.next(node_3)!, node_4)
		XCTAssertEqual(solution.next(node_2)!, node_3)
	}
	
	func testCase16() {
		let node_5 = TreeNode(val: 5)
		XCTAssertEqual(solution.next(node_5), nil)
	}
}

class BinaryTreeIsSubStructure: BaseTest {

    // 树中结点含有分叉，树B是树A的子结构
    //                8          8
    //              /   \       / \
    //             8     7     9   2
    //           /   \
    //          9     2
    //               / \
    //              4   7
    func testCase1(){
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 7, parent: node_1)
        let node_4 = TreeNode(val: 9, parent: node_2)
        let node_5 = TreeNode(val: 2, parent: node_2)
        let node_6 = TreeNode(val: 4, parent: node_5)
        let node_7 = TreeNode(val: 7, parent: node_5)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_5.left = node_6
        node_5.right = node_7

        let node_8 = TreeNode(val: 8, parent: nil)
        let node_9 = TreeNode(val: 9, parent: node_8)
        let node_10 = TreeNode(val: 2, parent: node_8)
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
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 7, parent: node_1)
        let node_4 = TreeNode(val: 9, parent: node_2)
        let node_5 = TreeNode(val: 3, parent: node_2)
        let node_6 = TreeNode(val: 4, parent: node_5)
        let node_7 = TreeNode(val: 7, parent: node_5)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_5.left = node_6
        node_5.right = node_7

        let node_8 = TreeNode(val: 8, parent: nil)
        let node_9 = TreeNode(val: 9, parent: node_8)
        let node_10 = TreeNode(val: 2, parent: node_8)
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
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 9, parent: node_2)
        let node_4 = TreeNode(val: 2, parent: node_3)
        let node_5 = TreeNode(val: 5, parent: node_4)

        node_1.left = node_2
        node_2.left = node_3
        node_3.left = node_4
        node_4.left = node_5

        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 2, parent: node_7)
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
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 9, parent: node_2)
        let node_4 = TreeNode(val: 2, parent: node_3)
        let node_5 = TreeNode(val: 5, parent: node_4)

        node_1.left = node_2
        node_2.left = node_3
        node_3.left = node_4
        node_4.left = node_5

        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 3, parent: node_7)
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
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 9, parent: node_2)
        let node_4 = TreeNode(val: 2, parent: node_3)
        let node_5 = TreeNode(val: 5, parent: node_4)

        node_1.right = node_2
        node_2.right = node_3
        node_3.right = node_4
        node_4.right = node_5

        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 2, parent: node_7)
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
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 8, parent: node_1)
        let node_3 = TreeNode(val: 9, parent: node_2)
        let node_4 = TreeNode(val: 2, parent: node_3)
        let node_5 = TreeNode(val: 5, parent: node_4)

        node_1.right = node_2
        node_2.right = node_3
        node_3.right = node_4
        node_4.right = node_5

        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 9, parent: node_7)
        let node_9 = TreeNode(val: 2, parent: node_7)
        node_6.right = node_7
        node_7.left = node_8
        node_7.right = node_9

        XCTAssertFalse(solution.isSubStructure(node_1, node_6))
    }
    //树A为空
    func testCase7(){
        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 3, parent: node_7)
        let node_9 = TreeNode(val: 2, parent: node_8)
        node_6.right = node_7
        node_7.right = node_8
        node_8.right = node_9

        XCTAssertFalse(solution.isSubStructure(nil, node_6))
    }
    //树B为空
    func testCase8(){
        let node_6 = TreeNode(val: 8, parent: nil)
        let node_7 = TreeNode(val: 9, parent: node_6)
        let node_8 = TreeNode(val: 3, parent: node_7)
        let node_9 = TreeNode(val: 2, parent: node_8)
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


class BinaryTreeMirror: BaseTest {
    // 完全二叉树：除了叶子节点，其他节点都有2个子节点
    //       8
    //     /   \
    //    6     10
    //   / \   / \
    //  5   7  9  11
    func testCase1(){
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 6, parent: node_1)
        let node_3 = TreeNode(val: 10, parent: node_1)
        let node_4 = TreeNode(val: 5, parent: node_2)
        let node_5 = TreeNode(val: 7, parent: node_2)
        let node_6 = TreeNode(val: 9, parent: node_3)
        let node_7 = TreeNode(val: 11, parent: node_3)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_3.left = node_6
        node_3.right = node_7

        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.left, node_3)
        XCTAssertEqual(node_1.right, node_2)
        XCTAssertEqual(node_3.left, node_7)
        XCTAssertEqual(node_3.right, node_6)
        XCTAssertEqual(node_2.left, node_5)
        XCTAssertEqual(node_2.right, node_4)

        //镜像回去，测试循环的方法
        solution.mirrorTree(node_1)
        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.left, node_3)
        XCTAssertEqual(node_1.right, node_2)
        XCTAssertEqual(node_3.left, node_7)
        XCTAssertEqual(node_3.right, node_6)
        XCTAssertEqual(node_2.left, node_5)
        XCTAssertEqual(node_2.right, node_4)
    }
    // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
    //            8
    //          7
    //        6
    //      5
    //    4
    func testCase2(){
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 7, parent: node_1)
        let node_3 = TreeNode(val: 6, parent: node_2)
        let node_4 = TreeNode(val: 5, parent: node_3)
        let node_5 = TreeNode(val: 4, parent: node_4)
        node_1.left = node_2
        node_2.left = node_3
        node_3.left = node_4
        node_4.left = node_5

        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.right, node_2)
        XCTAssertEqual(node_2.right, node_3)
        XCTAssertEqual(node_3.right, node_4)
        XCTAssertEqual(node_4.right, node_5)

        //镜像回去
        solution.mirrorTree(node_1)
        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.right, node_2)
        XCTAssertEqual(node_2.right, node_3)
        XCTAssertEqual(node_3.right, node_4)
        XCTAssertEqual(node_4.right, node_5)

    }
    // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个右子结点
    //            8
    //             7
    //              6
    //               5
    //                4
    func testCase3(){
        let node_1 = TreeNode(val: 8, parent: nil)
        let node_2 = TreeNode(val: 7, parent: node_1)
        let node_3 = TreeNode(val: 6, parent: node_2)
        let node_4 = TreeNode(val: 5, parent: node_3)
        let node_5 = TreeNode(val: 4, parent: node_4)
        node_1.right = node_2
        node_2.right = node_3
        node_3.right = node_4
        node_4.right = node_5

        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.left, node_2)
        XCTAssertEqual(node_2.left, node_3)
        XCTAssertEqual(node_3.left, node_4)
        XCTAssertEqual(node_4.left, node_5)

        //镜像回去
        solution.mirrorTree(node_1)
        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
        XCTAssertEqual(node_1.left, node_2)
        XCTAssertEqual(node_2.left, node_3)
        XCTAssertEqual(node_3.left, node_4)
        XCTAssertEqual(node_4.left, node_5)
    }
    // 测试空二叉树：根结点为空指针
    func testCase4(){
        let node_1: TreeNode? = nil
        solution.mirrorTree(node_1)
        XCTAssertNil(node_1)

        //镜像回去，循环方法测试
        solution.mirrorTree(node_1)
        solution.mirrorTree(node_1)
        XCTAssertNil(node_1)
    }
    // 测试只有一个结点的二叉树
    func testCase5(){
        let node_1 = TreeNode(val: 8, parent: nil)
        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)

        //镜像回去
        solution.mirrorTree(node_1)
        solution.mirrorTree(node_1)
        XCTAssertEqual(node_1.val, 8)
    }
}


class BinaryTreeSubtree: BaseTest {
//    给定的树 s:
//        3
//       / \
//      4   5
//     / \
//    1   2
//    给定的树 t：
//      4
//     / \
//    1   2
//    返回 true，因为 t 与 s 的一个子树拥有相同的结构和节点值。

    func testCase1() {
        let node_1 = TreeNode(val: 3, parent: nil)
        let node_2 = TreeNode(val: 4, parent: node_1)
        let node_3 = TreeNode(val: 5, parent: node_1)
        let node_4 = TreeNode(val: 1, parent: node_2)
        let node_5 = TreeNode(val: 2, parent: node_2)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5

        let node_t0 = TreeNode(val: 4, parent: nil)
        let node_t1 = TreeNode(val: 1, parent: node_t0)
        let node_t2 = TreeNode(val: 2, parent: node_t0)
        node_t0.left = node_t1
        node_t0.right = node_t2

        XCTAssertEqual(solution.isSubtree(node_1, node_t0), true)
    }

//    示例 2: 给定的树 s：
//         3
//        / \
//       4   5
//      / \
//     1   2
//    /
//    0
//    给定的树 t：
//        4
//       / \
//      1   2
//    返回 false。
    func testCase2() {
        let node_1 = TreeNode(val: 3, parent: nil)
        let node_2 = TreeNode(val: 4, parent: node_1)
        let node_3 = TreeNode(val: 5, parent: node_1)
        let node_4 = TreeNode(val: 1, parent: node_2)
        let node_5 = TreeNode(val: 2, parent: node_2)
        let node_6 = TreeNode(val: 0, parent: node_4)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_4.left = node_6

        let node_t0 = TreeNode(val: 4, parent: nil)
        let node_t1 = TreeNode(val: 1, parent: node_t0)
        let node_t2 = TreeNode(val: 2, parent: node_t0)
        node_t0.left = node_t1
        node_t0.right = node_t2

        XCTAssertEqual(solution.isSubtree(node_1, node_t0), false)
    }

    //    示例 3: 给定的树 s：
    //         1
    //        /
    //       1
    //    给定的树 t： 1
    //    返回 true。

    func testCase3() {
        let node_1 = TreeNode(val: 1, parent: nil)
        let node_2 = TreeNode(val: 1, parent: node_1)
        node_1.left = node_2

        let node_t0 = TreeNode(val: 1, parent: nil)
        XCTAssertEqual(solution.isSubtree(node_1, node_t0), true)
    }
}
