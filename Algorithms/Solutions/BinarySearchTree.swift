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
        } else {
            return searchBST(root.left, val)
        }
    }
}
