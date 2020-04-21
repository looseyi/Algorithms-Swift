//
//  LinkListCase.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


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
            nodes.append(node.value)
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
        return print("recursive: %@", node.value)
    }
}
