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
		let node8 = TreeNode(val: 8)
		let node6 = TreeNode(val: 6, parent: node8)
		let node5 = TreeNode(val: 5, parent: node6)
		let node7 = TreeNode(val: 7, parent: node6)
		node6.left = node5
		node6.right = node7
		let node10 = TreeNode(val: 10, parent: node8)
		let node9 = TreeNode(val: 9, parent: node10)
		let node11 = TreeNode(val: 11, parent: node10)
		node10.left = node9
		node10.right = node11
		
		node8.left = node6
		node8.right = node10
		
		XCTAssertEqual(solution.next(node5)!, node6)
		XCTAssertEqual(solution.next(node6)!, node7)
		XCTAssertEqual(solution.next(node7)!, node8)
		XCTAssertEqual(solution.next(node8)!, node9)
		XCTAssertEqual(solution.next(node9)!, node10)
		XCTAssertEqual(solution.next(node10)!, node11)
		XCTAssertEqual(solution.next(node11), nil)
	}
	//       5
	//     4
	//   3
	// 2
	func testCase8_11() {
		let node5 = TreeNode(val: 5)
		let node4 = TreeNode(val: 4, parent: node5)
		let node3 = TreeNode(val: 3, parent: node4)
		let node2 = TreeNode(val: 2, parent: node3)
		node5.left = node4
		node4.left = node3
		node3.left = node2
		XCTAssertEqual(solution.next(node5), nil)
		XCTAssertEqual(solution.next(node4)!, node5)
		XCTAssertEqual(solution.next(node3)!, node4)
		XCTAssertEqual(solution.next(node2)!, node3)
	}
	//   2
	//    3
	//     4
	//      5
	func testCase12_15() {
		let node2 = TreeNode(val: 2)
		let node3 = TreeNode(val: 3, parent: node2)
		let node4 = TreeNode(val: 4, parent: node3)
		let node5 = TreeNode(val: 5, parent: node4)
		node2.right = node3
		node3.right = node4
		node4.right = node5
		XCTAssertEqual(solution.next(node5), nil)
		XCTAssertEqual(solution.next(node4)!, node5)
		XCTAssertEqual(solution.next(node3)!, node4)
		XCTAssertEqual(solution.next(node2)!, node3)
	}
	
	func testCase16() {
		let node5 = TreeNode(val: 5)
		XCTAssertEqual(solution.next(node5), nil)
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 7, parent: node1)
        let node4 = TreeNode(val: 9, parent: node2)
        let node5 = TreeNode(val: 2, parent: node2)
        let node6 = TreeNode(val: 4, parent: node5)
        let node7 = TreeNode(val: 7, parent: node5)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node5.left = node6
        node5.right = node7

        let node8 = TreeNode(val: 8)
        let node9 = TreeNode(val: 9, parent: node8)
        let node10 = TreeNode(val: 2, parent: node8)
        node8.left = node9
        node8.right = node10

        XCTAssertTrue(solution.isSubStructure(node1, node8))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 7, parent: node1)
        let node4 = TreeNode(val: 9, parent: node2)
        let node5 = TreeNode(val: 3, parent: node2)
        let node6 = TreeNode(val: 4, parent: node5)
        let node7 = TreeNode(val: 7, parent: node5)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node5.left = node6
        node5.right = node7

        let node8 = TreeNode(val: 8)
        let node9 = TreeNode(val: 9, parent: node8)
        let node10 = TreeNode(val: 2, parent: node8)
        node8.left = node9
        node8.right = node10

        XCTAssertFalse(solution.isSubStructure(node1, node8))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 9, parent: node2)
        let node4 = TreeNode(val: 2, parent: node3)
        let node5 = TreeNode(val: 5, parent: node4)

        node1.left = node2
        node2.left = node3
        node3.left = node4
        node4.left = node5

        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 2, parent: node7)
        node6.left = node7
        node7.left = node8

        XCTAssertTrue(solution.isSubStructure(node1, node6))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 9, parent: node2)
        let node4 = TreeNode(val: 2, parent: node3)
        let node5 = TreeNode(val: 5, parent: node4)

        node1.left = node2
        node2.left = node3
        node3.left = node4
        node4.left = node5

        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 3, parent: node7)
        node6.left = node7
        node7.left = node8

        XCTAssertFalse(solution.isSubStructure(node1, node6))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 9, parent: node2)
        let node4 = TreeNode(val: 2, parent: node3)
        let node5 = TreeNode(val: 5, parent: node4)

        node1.right = node2
        node2.right = node3
        node3.right = node4
        node4.right = node5

        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 2, parent: node7)
        node6.right = node7
        node7.right = node8

        XCTAssertTrue(solution.isSubStructure(node1, node6))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 8, parent: node1)
        let node3 = TreeNode(val: 9, parent: node2)
        let node4 = TreeNode(val: 2, parent: node3)
        let node5 = TreeNode(val: 5, parent: node4)

        node1.right = node2
        node2.right = node3
        node3.right = node4
        node4.right = node5

        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 9, parent: node7)
        let node9 = TreeNode(val: 2, parent: node7)
        node6.right = node7
        node7.left = node8
        node7.right = node9

        XCTAssertFalse(solution.isSubStructure(node1, node6))
    }
    //树A为空
    func testCase7(){
        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 3, parent: node7)
        let node9 = TreeNode(val: 2, parent: node8)
        node6.right = node7
        node7.right = node8
        node8.right = node9

        XCTAssertFalse(solution.isSubStructure(nil, node6))
    }
    //树B为空
    func testCase8(){
        let node6 = TreeNode(val: 8)
        let node7 = TreeNode(val: 9, parent: node6)
        let node8 = TreeNode(val: 3, parent: node7)
        let node9 = TreeNode(val: 2, parent: node8)
        node6.right = node7
        node7.right = node8
        node8.right = node9

        XCTAssertFalse(solution.isSubStructure(node6, nil))
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
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 6, parent: node1)
        let node3 = TreeNode(val: 10, parent: node1)
        let node4 = TreeNode(val: 5, parent: node2)
        let node5 = TreeNode(val: 7, parent: node2)
        let node6 = TreeNode(val: 9, parent: node3)
        let node7 = TreeNode(val: 11, parent: node3)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7

        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.left, node3)
        XCTAssertEqual(node1.right, node2)
        XCTAssertEqual(node3.left, node7)
        XCTAssertEqual(node3.right, node6)
        XCTAssertEqual(node2.left, node5)
        XCTAssertEqual(node2.right, node4)

        //镜像回去，测试循环的方法
        solution.mirrorTree(node1)
        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.left, node3)
        XCTAssertEqual(node1.right, node2)
        XCTAssertEqual(node3.left, node7)
        XCTAssertEqual(node3.right, node6)
        XCTAssertEqual(node2.left, node5)
        XCTAssertEqual(node2.right, node4)
    }
    // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
    //            8
    //          7
    //        6
    //      5
    //    4
    func testCase2(){
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 7, parent: node1)
        let node3 = TreeNode(val: 6, parent: node2)
        let node4 = TreeNode(val: 5, parent: node3)
        let node5 = TreeNode(val: 4, parent: node4)
        node1.left = node2
        node2.left = node3
        node3.left = node4
        node4.left = node5

        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.right, node2)
        XCTAssertEqual(node2.right, node3)
        XCTAssertEqual(node3.right, node4)
        XCTAssertEqual(node4.right, node5)

        //镜像回去
        solution.mirrorTree(node1)
        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.right, node2)
        XCTAssertEqual(node2.right, node3)
        XCTAssertEqual(node3.right, node4)
        XCTAssertEqual(node4.right, node5)

    }
    // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个右子结点
    //            8
    //             7
    //              6
    //               5
    //                4
    func testCase3(){
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 7, parent: node1)
        let node3 = TreeNode(val: 6, parent: node2)
        let node4 = TreeNode(val: 5, parent: node3)
        let node5 = TreeNode(val: 4, parent: node4)
        node1.right = node2
        node2.right = node3
        node3.right = node4
        node4.right = node5

        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.left, node2)
        XCTAssertEqual(node2.left, node3)
        XCTAssertEqual(node3.left, node4)
        XCTAssertEqual(node4.left, node5)

        //镜像回去
        solution.mirrorTree(node1)
        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
        XCTAssertEqual(node1.left, node2)
        XCTAssertEqual(node2.left, node3)
        XCTAssertEqual(node3.left, node4)
        XCTAssertEqual(node4.left, node5)
    }
    // 测试空二叉树：根结点为空指针
    func testCase4(){
        let node1: TreeNode? = nil
        solution.mirrorTree(node1)
        XCTAssertNil(node1)

        //镜像回去，循环方法测试
        solution.mirrorTree(node1)
        solution.mirrorTree(node1)
        XCTAssertNil(node1)
    }
    // 测试只有一个结点的二叉树
    func testCase5(){
        let node1 = TreeNode(val: 8)
        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)

        //镜像回去
        solution.mirrorTree(node1)
        solution.mirrorTree(node1)
        XCTAssertEqual(node1.val, 8)
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
        let node1 = TreeNode(val: 3)
        let node2 = TreeNode(val: 4, parent: node1)
        let node3 = TreeNode(val: 5, parent: node1)
        let node4 = TreeNode(val: 1, parent: node2)
        let node5 = TreeNode(val: 2, parent: node2)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5

        let nodet0 = TreeNode(val: 4)
        let nodet1 = TreeNode(val: 1, parent: nodet0)
        let nodet2 = TreeNode(val: 2, parent: nodet0)
        nodet0.left = nodet1
        nodet0.right = nodet2

        XCTAssertEqual(solution.isSubtree(node1, nodet0), true)
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
        let node1 = TreeNode(val: 3)
        let node2 = TreeNode(val: 4, parent: node1)
        let node3 = TreeNode(val: 5, parent: node1)
        let node4 = TreeNode(val: 1, parent: node2)
        let node5 = TreeNode(val: 2, parent: node2)
        let node6 = TreeNode(val: 0, parent: node4)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node4.left = node6

        let nodet0 = TreeNode(val: 4)
        let nodet1 = TreeNode(val: 1, parent: nodet0)
        let nodet2 = TreeNode(val: 2, parent: nodet0)
        nodet0.left = nodet1
        nodet0.right = nodet2

        XCTAssertEqual(solution.isSubtree(node1, nodet0), false)
    }

    //    示例 3: 给定的树 s：
    //         1
    //        /
    //       1
    //    给定的树 t： 1
    //    返回 true。

    func testCase3() {
        let node1 = TreeNode(val: 1)
        let node2 = TreeNode(val: 1, parent: node1)
        node1.left = node2

        let nodet0 = TreeNode(val: 1)
        XCTAssertEqual(solution.isSubtree(node1, nodet0), true)
    }
}


class BinaryTreeisSymmetric: BaseTest {

    //       8
    //     /   \
    //    6     6
    //   / \   / \
    //  5   7  7  5
    func testCase1(){
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 6, parent: node1)
        let node3 = TreeNode(val: 6, parent: node1)
        let node4 = TreeNode(val: 5, parent: node2)
        let node5 = TreeNode(val: 7, parent: node2)
        let node6 = TreeNode(val: 7, parent: node3)
        let node7 = TreeNode(val: 5, parent: node3)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        XCTAssertTrue(solution.isSymmetric(node1))
    }
    //       8
    //     /   \
    //    6     9
    //   / \   / \
    //  5   7  7  5
    func testCase2(){
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 6, parent: node1)
        let node3 = TreeNode(val: 9, parent: node1)
        let node4 = TreeNode(val: 5, parent: node2)
        let node5 = TreeNode(val: 7, parent: node2)
        let node6 = TreeNode(val: 7, parent: node3)
        let node7 = TreeNode(val: 5, parent: node3)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        XCTAssertFalse(solution.isSymmetric(node1))
    }
    //            8
    //        6      6
    //       5 7    7
    func testCase3(){
        let node1 = TreeNode(val: 8)
        let node2 = TreeNode(val: 6, parent: node1)
        let node3 = TreeNode(val: 6, parent: node1)
        let node4 = TreeNode(val: 5, parent: node2)
        let node5 = TreeNode(val: 7, parent: node2)
        let node6 = TreeNode(val: 7, parent: node3)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        XCTAssertFalse(solution.isSymmetric(node1))
    }
    //               5
    //              / \
    //             3   3
    //            /     \
    //           4       4
    //          /         \
    //         2           2
    //        /             \
    //       1               1
    func testCase4(){
        let node1 = TreeNode(val: 5)
        let node2 = TreeNode(val: 3, parent: node1)
        let node3 = TreeNode(val: 3, parent: node1)
        let node4 = TreeNode(val: 4, parent: node2)
        let node5 = TreeNode(val: 4, parent: node3)
        let node6 = TreeNode(val: 2, parent: node4)
        let node7 = TreeNode(val: 2, parent: node5)
        let node8 = TreeNode(val: 1, parent: node6)
        let node9 = TreeNode(val: 1, parent: node7)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node3.right = node5
        node4.left = node6
        node5.right = node7
        node6.left = node8
        node7.right = node9
        XCTAssertTrue(solution.isSymmetric(node1))
    }
    //               5
    //              / \
    //             3   3
    //            /     \
    //           4       4
    //          /         \
    //         6           2
    //        /             \
    //       1               1
    func testCase5(){
        let node1 = TreeNode(val: 5)
        let node2 = TreeNode(val: 3, parent: node1)
        let node3 = TreeNode(val: 3, parent: node1)
        let node4 = TreeNode(val: 4, parent: node2)
        let node5 = TreeNode(val: 4, parent: node3)
        let node6 = TreeNode(val: 6, parent: node4)
        let node7 = TreeNode(val: 2, parent: node5)
        let node8 = TreeNode(val: 1, parent: node6)
        let node9 = TreeNode(val: 1, parent: node7)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node3.right = node5
        node4.left = node6
        node5.right = node7
        node6.left = node8
        node7.right = node9
        XCTAssertFalse(solution.isSymmetric(node1))
    }
    //               5
    //              / \
    //             3   3
    //            /     \
    //           4       4
    //          /         \
    //         2           2
    //                      \
    //                       1
    func testCase6(){
        let node1 = TreeNode(val: 5)
        let node2 = TreeNode(val: 3, parent: node1)
        let node3 = TreeNode(val: 3, parent: node1)
        let node4 = TreeNode(val: 4, parent: node2)
        let node5 = TreeNode(val: 4, parent: node3)
        let node6 = TreeNode(val: 2, parent: node4)
        let node7 = TreeNode(val: 2, parent: node5)
        let node9 = TreeNode(val: 1, parent: node7)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node3.right = node5
        node4.left = node6
        node5.right = node7
        node7.right = node9
        XCTAssertFalse(solution.isSymmetric(node1))
    }
    // 只有一个结点
    func testCase7(){
        let node1 = TreeNode(val: 5)
        XCTAssertTrue(solution.isSymmetric(node1))
    }
    //没有节点
    func testCase8(){
        XCTAssertTrue(solution.isSymmetric(nil))
    }

}
