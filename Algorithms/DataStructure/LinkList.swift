//
//  LinkList.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


open class ListNode {
    public var next: ListNode?
    public var val: Int
    
	public init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomDebugStringConvertible, CustomStringConvertible {
    public var description: String {
        if let next = next {
            return "\(val) -> \(next.description)"
        } else {
            return "\(val)"
        }
    }

    public var debugDescription: String {
        if let next = next {
            return "\(val) -> \(next.description)"
        } else {
            return "\(val)"
        }
    }
}

extension ListNode: Equatable {
    public static func==(lsh: ListNode, rsh: ListNode) -> Bool {
        return lsh.val == rsh.val
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

//    面试题24：反转链表
//    题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点。
//
//    双指针迭代
//    我们可以申请两个指针，第一个指针叫 pre，最初是指向 null 的。
//    第二个指针 cur 指向 head，然后不断遍历 cur。
//    每次迭代到 cur，都将 cur 的 next 指向 pre，然后 pre 和 cur 前进一位。
//    都迭代完了(cur 变成 null 了)，pre 就是最后一个节点了。

    public func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil, cur = head, tmp: ListNode? = nil
        while let c = cur {
            //记录当前节点的下一个节点
            tmp = c.next
            //然后将当前节点指向pre
            c.next = pre
            //pre和cur节点都前进一位
            pre = c
            cur = tmp
        }
        return pre
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
            if let node = node {
                toBeDeleted?.next = node.next
                toBeDeleted?.val = node.val
            }
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

        while let curN = cur, var postN = curN.next {
            if curN != postN {
                preN = curN
            } else {
                while postN == curN, let next = postN.next {
                    postN = next
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

extension Solution {

    // 剑指Offer 面试题22：链表中倒数第k个结点
    // https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof
    // 题目：输入一个链表，输出该链表中倒数第k个结点。为了符合大多数人的习惯，
    // 本题从1开始计数，即链表的尾结点是倒数第1个结点。例如一个链表有6个结点，
    // 从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是
    // 值为4的结点。

    // 通过用快慢指针，两指针间距为 k
    public func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head, fast: ListNode? = head, step = k
        while let node = fast, step > 1 {
            fast = node.next
            step -= 1
        }
        // 需要注意异常条件的判断，k 超过节点数，k 为 0
        if fast == nil || step <= 0 { return nil }
        while let next = fast?.next {
            slow = slow?.next
            fast = next
        }
        return slow
    }
}

extension Solution {

//    给定一个链表，判断链表中是否有环。
//    为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
//    https://leetcode-cn.com/problems/linked-list-cycle/description/?utm_source=LCUS&utm_medium=ip_redirect_q_uns&utm_campaign=transfer2china

    /// 通过两个移动速度不同的快慢指针
    public func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next?.next
        while let s = slow, let f = fast, s != f {
            slow = s.next
            fast = f.next?.next
        }
        return fast != nil
    }
}

extension Solution {

//    剑指Offer 面试题23：链表中环的入口结点
//    给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
//    为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
//    说明：不允许修改给定的链表。
//
//    输入：head = [3,2,0,-4], pos = 1
//    输出：tail connects to node index 1
//    解释：链表中有一个环，其尾部连接到第二个节点。

    /// swift 里面判断 class地址 是否相等要用到 ===， 因为这里我们要判断的是节点是否为同一个，而非节点的值是否相等



    public func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while let next = fast?.next {
            (slow, fast) = (slow?.next, next.next)
            if fast === slow {
                fast = head
                while fast !== slow {
                    (fast, slow) = (fast?.next, slow?.next)
                }
                return fast
            }
        }
        return nil
    }
}
