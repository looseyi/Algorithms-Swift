//
//  LinkList.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms

class LinkListTestCase: XCTestCase {
    var solution: Solution!
    var node8: ListNode!
    var node7: ListNode!
    var node6: ListNode!
    var node5: ListNode!
    var node4: ListNode!
    var node3: ListNode!
    var node2: ListNode!
    var node1: ListNode!

    override func setUp() {
        super.setUp()
        solution = Solution()
        node5 = ListNode(val: 5, next: nil)
        node4 = ListNode(val: 4, next: node5)
        node3 = ListNode(val: 3, next: node4)
        node2 = ListNode(val: 2, next: node3)
        node1 = ListNode(val: 1, next: node2)
    }
}

final class LinkListPrint: LinkListTestCase {

    /// 1->2->3->4->5
    func testCaseLinkNormal() {
        XCTAssertEqual(solution.reverseListNode(node1), [5,4,3,2,1])
    }

    /// single node
    func testCaseLinkListSingle() {
        let node1 = ListNode(val: 1, next: nil)
        XCTAssertEqual(solution.reverseListNode(node1), [1])
    }
}

final class LinkListDeleteNode : LinkListTestCase {

    //1->2->3->4->5 删除3
    func testCase1() {
        solution.deleteNode(&node1, node3)
        XCTAssertEqual(node1!.val, 1)
        XCTAssertEqual(node1!.next?.val, 2)
        XCTAssertEqual(node1!.next?.next?.val,4)
        XCTAssertEqual(node1!.next?.next?.next?.val,5)
    }
    //1->2->3->4->5 删除5
    func testCase2() {
        solution.deleteNode(&node1, node5)
        XCTAssertEqual(node1!.val, 1)
        XCTAssertEqual(node1!.next?.val, 2)
        XCTAssertEqual(node1!.next?.next?.val,3)
        XCTAssertEqual(node1!.next?.next?.next?.val,4)
        XCTAssertNil(node1!.next!.next!.next!.next)
    }

    //1->2->3->4->5 删除1
    func testCase3() {
        solution.deleteNode(&node1, node1)
        XCTAssertNil(node1)
    }

    //只有1个节点1 删除1
    func testCase4() {
        var node1: ListNode? = ListNode(val: 1, next: nil)
        solution.deleteNode(&node1, node1)
        XCTAssertNil(node1)
    }
}


final class LinkListDeleteDuplicateNode: LinkListTestCase {

    override func setUp() {
        super.setUp()
        node6 = ListNode(val: 6, next: nil)
        node7 = ListNode(val: 7, next: nil)
        node8 = ListNode(val: 8, next: nil)
        node5.next = node6
        node6.next = node7
    }

    //1->2->3->3->4->4->5 删除后 1->2-5
    func testCase1() {
        node1.val = 1
        node2.val = 2
        node3.val = 3
        node4.val = 3
        node5.val = 4
        node6.val = 4
        node7.val = 5

        print(node1.description)

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead?.val, node1.val)
        XCTAssertEqual(node1.next?.val, node2.val)
        XCTAssertEqual(node2.next?.val, node7.val)
        XCTAssertNil(node7.next)
    }
    //1->2->3->4->5->6->7 没有重复节点
    func testCase2() {
        node1.val = 1
        node2.val = 2
        node3.val = 3
        node4.val = 4
        node5.val = 5
        node6.val = 6
        node7.val = 7

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead?.val, node1.val)
        XCTAssertEqual(node1.next?.val, node2.val)
        XCTAssertEqual(node2.next?.val, node3.val)
        XCTAssertEqual(node3.next?.val , node4.val)
        XCTAssertEqual(node4.next?.val, node5.val)
        XCTAssertEqual(node5.next?.val, node6.val)
        XCTAssertEqual(node6.next?.val, node7.val)
    }
    //除了一个结点之外其他所有结点的值都相同
    func testCase3() {
        node1.val = 1
        node2.val = 1
        node3.val = 1
        node4.val = 1
        node5.val = 1
        node6.val = 1
        node7.val = 2

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead?.val, 2)
        XCTAssertNil(newHead?.next)
    }
    // 所有结点的值都相同
    func testCase4() {
        node1.val = 1
        node2.val = 1
        node3.val = 1
        node4.val = 1
        node5.val = 1
        node6.val = 1
        node7.val = 1

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertNil(newHead)
    }
    //所有节点都成对出现
    func testCase5() {
        node7.next = node8
        node1.val = 1
        node2.val = 1
        node3.val = 2
        node4.val = 2
        node5.val = 3
        node6.val = 3
        node7.val = 4
        node8.val = 4

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertNil(newHead)
    }
    // 除了两个结点之外其他结点都成对出现
    func testCase6() {
        node1.val = 1
        node2.val = 1
        node3.val = 2
        node4.val = 3
        node5.val = 3
        node6.val = 4
        node7.val = 5
        node8.val = 5

        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead!.val, 2)
        XCTAssertEqual(newHead?.next?.val, 4)
        XCTAssertNil(newHead?.next?.next?.next)
    }
    // 链表中只有两个不重复的结点
    func testCase7() {
        let node1:ListNode = ListNode(val: 1, next: nil)
        let node2:ListNode = ListNode(val: 2, next: nil)
        node1.next = node2
        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead!.val, 1)
        XCTAssertEqual(newHead?.next?.val, 2)
        XCTAssertNil(newHead?.next?.next)
    }
    // 结点中只有一个结点
    func testCase8() {
        let node1:ListNode = ListNode(val: 1, next: nil)
        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead!.val, 1)
        XCTAssertNil(newHead?.next)
    }
    // 结点中只有两个重复的结点
    func testCase9() {
        let node1:ListNode = ListNode(val: 1, next: nil)
        let node2:ListNode = ListNode(val: 1, next: nil)
        node1.next = node2
        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertNil(newHead)
    }

    func testCase10() {
        let node1:ListNode = ListNode(val: 1, next: nil)
        let node2:ListNode = ListNode(val: 2, next: nil)
        let node3:ListNode = ListNode(val: 2, next: nil)
        node1.next = node2
        node2.next = node3
        let newHead = solution.deleteDuplicateNode(node1)
        XCTAssertEqual(newHead!.val, 1)
    }
}
