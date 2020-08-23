//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Edmond on 2020/8/8.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {

//    [给定一个二叉树，判断其是否是一个有效的二叉搜索树。](https://leetcode-cn.com/problems/validate-binary-search-tree)
//    假设一个二叉搜索树具有如下特征：
//
//    节点的左子树只包含小于当前节点的数。
//    节点的右子树只包含大于当前节点的数。
//    所有左子树和右子树自身必须也是二叉搜索树。
//    示例 1:   输入:
//         2
//        / \
//       1   3
//    输出: true
//    示例 2: 输入:
//         5
//        / \
//       1   4
//          / \
//         3   6
//    输出: false
//    解释: 输入为: [5,1,4,null,null,3,6]。
//    根节点的值为 5 ，但是其右子节点值为 4 。

    public func isValidBST(_ root: TreeNode?) -> Bool {
        func isValidBST(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
            guard let root = root else {
                return true
            }

            if let min = min, root.val <= min {
                return false
            }
            if let max = max, root.val >= max {
                return false
            }

            return isValidBST(root.left, min, root.val) &&
                isValidBST(root.right, root.val, max)
        }

        return isValidBST(root, nil, nil)
    }
}


extension Solution {

    /// 【BST 查找](https://leetcode-cn.com/problems/search-in-a-binary-search-tree)
//    给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。
//    例如，给定二叉搜索树:
//
//        4
//       / \
//      2   7
//     / \
//    1   3
//
//    和值: 2 你应该返回如下子树:
//
//     2
//    / \
//    1   3

    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == val {
            return root
        } else if root.val < val {
            return searchBST(root.right, val)
        } else if root.val > val {
            return searchBST(root.left, val)
        }
        return nil
    }
}

extension Solution {

//    [BST插入](https://leetcode-cn.com/problems/insert-into-a-binary-search-tree)
//    给定二叉搜索树（BST）的根节点和要插入树中的值，将值插入二叉搜索树。 返回插入后二叉搜索树的根节点。 保证原始二叉搜索树中不存在新值。
//
//    注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。 你可以返回任意有效的结果。例如,
//    给定二叉搜索树:
//
//            4
//           / \
//          2   7
//         / \
//        1   3
//
//    和 插入的值: 5
//    你可以返回这个二叉搜索树:
//
//            4
//          /   \
//         2     7
//        / \   /
//       1   3 5
//    或者这个树也是有效的:
//
//            5
//          /   \
//         2     7
//        / \
//       1   3
//            \
//             4

    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val: val) }

//        if root.val == val {
//            return root
        if root.val < val {
            root.right = insertIntoBST(root.right, val)
        } else if root.val > val {
            root.left = insertIntoBST(root.left, val)
        }
        return root
    }
}


extension Solution {

//    [BST 删除节点](https://leetcode-cn.com/problems/delete-node-in-a-bst)
//    给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。
//
//    一般来说，删除节点可分为两个步骤：
//
//    首先找到需要删除的节点；
//    如果找到了，删除它。
//    说明： 要求算法时间复杂度为 O(h)，h 为树的高度。
//
//    示例:
//
//    root = [5,3,6,2,4,null,7]
//    key = 3
//
//       5
//      / \
//     3   6
//    / \   \
//    2   4   7
//
//    给定需要删除的节点值是 3，所以我们首先找到 3 这个节点，然后删除它。
//
//    一个正确的答案是 [5,4,6,2,null,null,7], 如下图所示。
//
//       5
//      / \
//     4   6
//    /     \
//    2      7
//
//    另一个正确答案是 [5,2,6,null,4,null,7]。
//
//     5
//    / \
//    2   6
//     \   \
//      4   7

    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        func getMin(_ node: TreeNode?) -> TreeNode? {
            // BST 最左边的就是最小的
            var node = node
            while let left = node?.left {
                node = left
            }
            return node
        }

        if root.val == key {
            // A 只有一个非空子节点，那么它要让这个孩子接替自己的位置。
            if root.left == nil {
                return root.right
            }
            if root.right == nil {
                return root.left
            }

            // 处理情况 3 在右子树找到最小节点
            if let minNode = getMin(root.right) {
                root.val = minNode.val
                root.right = deleteNode(root.right, minNode.val)
            }
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        }
        return root
    }
}

extension Solution {
//    https://leetcode-cn.com/problems/recover-binary-search-tree/
//    二叉搜索树中的两个节点被错误地交换。
//    请在不改变其结构的情况下，恢复这棵树。
//    示例 1: 输入: [1,3,null,null,2]
//
//          1
//        /
//      3
//        \
//          2
//
//    输出: [3,1,null,null,2]
//
//          3
//        /
//      1
//        \
//          2

    public func recoverBST1(_ root: TreeNode?) {
        sequenceTraversal(root)
        swap(x, y)
    }

    public func recoverBST(_ root: TreeNode?) {
        sequenceTraversal(root)
        swap(x, y)
    }

    func sequenceTraversal(_ root: TreeNode?) {

        guard let root = root else { return }

        sequenceTraversal(root.left)
        find(root)
        sequenceTraversal(root.right)
    }

    func inorderTraversal(_ root: TreeNode?) {
        var stack = [TreeNode?]()
        var node: TreeNode? = root

        while !stack.isEmpty || node != nil {
            while let cur = node {
                stack.append(cur)
                node = cur.left
            }
            if let cur = stack.removeLast() {
                // 中序操作
                find(cur)

                node = cur.right
            }
        }
    }

    //! 莫里斯中序遍历
    func morris(_ root: TreeNode?) {
        var node: TreeNode? = root

        while var node: TreeNode = node {
            if let left = node.left {
                //! 找到前驱节点
                var pred = left
                while let right = pred.right, !(right === node) {
                    pred = right
                }

                //!
                if pred.right == nil {
                    pred.right = node
                    node = left
                } else {
                    find(node)
                    pred.right = nil
                    node = node.right!
                }

            } else {
                find(node)
                node = node.right!
            }
        }
    }

    //! 找逆序对
    func find(_ node: TreeNode) {
        if let pred = pred, node.val < pred.val {
            if x == nil {
                x = pred
            }
            y = node
        }
        pred = node
    }

    fileprivate func swap(_ x: TreeNode, _ y: TreeNode) {
        let tmp = x.val
        x.val = y.val
        y.val = tmp
    }
}
