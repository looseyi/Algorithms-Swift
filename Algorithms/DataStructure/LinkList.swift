//
//  LinkList.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


open class ListNode: Equatable {
    public var next: ListNode?
    public var val: Int
    
	public init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }

    public static func==(lsh: ListNode, rsh: ListNode) -> Bool {
        return lsh.val == rsh.val
    }

    public var description: String {
        return "\(val) -> \(next?.description ?? "")"
    }
}


extension Solution {

    /**
     从尾到头打印链表，使用一个栈存储各个节点, 再反向打印
     - Parameters:
     - listnode: 头结点
     - Returns:
     */
    public func reverseListNode(_ node: ListNode?) -> [Int] {
        var nodes = [Int]()
        var currentNode:ListNode? = node
        while let node = currentNode {
            nodes.append(node.val)
            currentNode = node.next
        }
        return nodes.reversed()
    }

    /**
     从尾到头打印链表，递归
     - Parameters:
     - listnode: 头结点
     - Returns:
     */
    public func reverseListNodeRecursive(_ node: ListNode) {
        if let next = node.next {
            reverseListNodeRecursive(next)
        }
        return print("recursive: %@", node.val)
    }
}


extension Solution {

// 剑指Offer 面试题18（一）：在O(1)时间删除链表结点
// 题目：给定单向链表的头指针和一个结点指针，定义一个函数在O(1)时间删除该
// 结点。

    // 考虑 1.头节点为空；2. 删除节点为尾节点；3. 中间节点，通过 copy 方式；

    public func deleteNode(_ head: inout ListNode?, _ toBeDeleted: ListNode?) {
        if head == nil || toBeDeleted == nil { return }
        if head == toBeDeleted { head = nil; return }
        if toBeDeleted?.next == nil {
            var node = head
            while let next = node?.next, next != toBeDeleted {
                node = next
            }
            node?.next = nil
        } else {
            var node = toBeDeleted?.next
            toBeDeleted?.next = node?.next
            toBeDeleted?.val = node?.val as! Int
            node = nil
        }
    }

    // 面试题18（二）：删除链表中重复的结点 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
    // 题目：在一个排序的链表中，如何删除重复的结点？
    // 例如: 1->2->3->3->4->4->5 的重复节点删除之后只剩下 1->2->5

    public func deleteDuplicateNodeRecursive(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var head = head
        if let next = head?.next, next == head {
            while let next = head?.next, head == next {
                head = head?.next
            }
            return deleteDuplicateNodeRecursive(head?.next)
        } else {
            head?.next = deleteDuplicateNodeRecursive(head?.next)
        }
        return head
    }

    /// 定义三个结点 preN、cur、postN，分别表示前驱、当前和后继。 然后扫描整个链表：
    /// 如果 cur 不等于 postN，那么三个节点依次向后移动一位，(由于 postN = curN.next, 所以只需移动前两个节点就可以
    /// 否则，post不断后移，直到遇到val不相等的结点；
    public func deleteDuplicateNode(_ head: ListNode?) -> ListNode? {
        var preN = ListNode(val: -1, next: head)
        var cur: ListNode? = head, head = head

        while let curN = cur, var postN: ListNode? = curN.next {
            if curN != postN {
                preN = curN
            } else {
                while postN == curN {
                    postN = postN?.next
                }
                if preN.next == head {
                    head = postN // 注意，如果从头结点就开始重复，需要修改head
                }
                preN.next = postN
            }
            cur = postN
        }
        return head
    }
}
