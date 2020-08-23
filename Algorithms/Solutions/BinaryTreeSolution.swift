//
//  BinaryTreeAlgorithm.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {
    // 意义：对于二叉树，常用的序列化方法是在树上进行某种遍历（如先序、中序、后序、层序），用一种或两种遍历结果作为序列化结果。

    /**
     根据前序序列和中序序列构建二叉树
      https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
     - Parameters:
     - preorder: 前序序列数组
     - inorder: 中序序列数组
     - Returns: TreeNode 构建好的二叉树根节点
     **/

    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inOrderMap = [Int : Int]()
        for (i, v) in inorder.enumerated() {
            inOrderMap[v] = i
        }
        func buildTreeCore(_ prevStart: Int, _ prevEnd: Int,
                           _ inStart: Int, _ inEnd: Int) -> TreeNode? {
            if prevStart > prevEnd || inStart > inEnd { return nil }

            let root = TreeNode(val: preorder[prevStart])
            let inRootIndex = inOrderMap[root.val]!
            let numberLeft = inRootIndex - inStart
            root.left = buildTreeCore(prevStart + 1, prevStart + numberLeft,
                                      inStart, inRootIndex - 1)
            root.right = buildTreeCore(prevStart + numberLeft + 1, prevEnd,
                                       inRootIndex + 1, inEnd)
            return root
        }
        return buildTreeCore(0, preorder.count - 1, 0, inorder.count - 1)
    }


    public func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 || preorder.count != inorder.count {
            return nil
        }

        return buildTreeCore(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }

    public func buildTreeCore(_ preorder: [Int], _ preLeft: Int, _ preRight: Int,
                              _ inorder: [Int], _ inLeft: Int, _ inRight: Int) -> TreeNode? {
        /// preorder中的 pos 位置的元素 preorder[i] 为根的子树必然对应着 inorder 数组中 [left, right]之间的值。
        var i = -1
        for index in inLeft...inRight {
            if inorder[index] == preorder[preLeft] {
                i = index
                break
            }
        }
        if i == -1 {
            return nil
        }
        /// 将 inorder 数组分为 [0, p-1] 和 [p+1, inorder.inRight] 两部分, 分别对应左子树的节点集合和右子树的节点集合。
        /// 注意 leftTreeElementCount 因为在先序数组中，左子树的节点全部在右子树的前面。

        let root = TreeNode(val: preorder[preLeft])
        let leftTreeElementCount = i - inLeft
        if preLeft + 1 <= preLeft + leftTreeElementCount {
            root.left = buildTreeCore(preorder, preLeft + 1, preLeft + leftTreeElementCount,
                                      inorder, inLeft, i - 1)
        }
        if preLeft + leftTreeElementCount + 1 <= preRight {
            root.right = buildTreeCore(preorder, preLeft + leftTreeElementCount + 1, preRight,
                                       inorder, i + 1, inRight)
        }
        return root
    }


    /**
     不知为何，C++ 的解法，在 Swift 中不能生效， https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/c-fen-zhi-by-yuexiwen/
     */
    //    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    //        if preorder.count == 0 || inorder.count == 0 || preorder.count != inorder.count {
    //            return nil
    //        }
    //        var pos = 0
    //        return buildTreeCore(preorder, &pos, inorder, 0, inorder.count - 1)
    //    }
    //
    //    public func buildTreeCore(_ preorder: [Int], _ pos: inout Int,
    //                              _ inorder: [Int], _ inLeft: Int, _ inRight: Int) -> TreeNode? {
    //        if pos >= preorder.count {
    //            return nil
    //        }
    //        var i = -1
    //        for index in inLeft...inRight {
    //            if inorder[index] == preorder[pos] {
    //                i = index
    //                break
    //            }
    //        }//
    //        let root = TreeNode(val: preorder[pos])
    //        if inLeft <= i - 1 {
    //            pos += 1
    //            root.left = buildTreeCore(preorder, &pos, inorder, inLeft, i - 1)
    //        }
    //        if i + 1 <= inRight {
    //            pos += 1
    //            root.right = buildTreeCore(preorder, &pos, inorder, i + 1, inRight)
    //        }
    //        return root
    //    }
}

extension Solution {
    //    https://www.youtube.com/watch?v=k0_TpZMhQ_4
    //    中序遍历的下一个节点的作用 ？？？
    //    原因：对搜索树（平衡二叉树）做中序遍历，其结果是有序的数组
    //    解题思路：
    //          p
    //          |
    //          N
    //         / \
    //        L   R
    //     L：对中序遍历而言，是先遍历左子树，如果当前节点为 N，其左节点一定是访问过的；
    //     R：右子树，返回右子树的第一个节点
    //     P：当 N 是 P 的左子树，那 P 就是下一个节点
    //        当 N 是 P 的右子树，一直往父亲节点走，直到是某个节点当左子树；

    /**
     剑指 Offer - 面试题8：二叉树的下一个结点
     题目：给定一棵二叉树的某节点，如何找出中序遍历顺序的下一个结点？
     树中的结点除了有两个分别指向左右子结点的指针以外，还有一个指向父结点的指针。
     - Parameters:
     - node: 给定节点
     - Returns: 中序序列的下一个节点
     */
    public func next(_ node: TreeNode) -> TreeNode? {
        // 首先，不需要考虑左子树，对中序遍历而言，左子树是一定已经访问过的。
        var node = node
        // 如果当前节点右子树存在，则返回右子树的第一个节点（在中序遍历中第一个节点即左节点）
        if let right = node.right {
            node = right
            while let left = node.left {
                node = left
            }
            return node
        }
        // 如果父节不存在，直接结束遍历
        guard let parent = node.parent else {
            return nil
        }
        // 当前节点为父节点的左子树，那么父节点即为next
        if node == parent.left {
            return parent
        } else {
            // 当前节点为父节点的右子树，则不断遍历父节点，直到该节点为父节点的左子树
            node = parent
            while let parent = node.parent {
                if parent.left == node {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
}


extension Solution {
    //    面试题26：树的子结构
    //    https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
    //    题目：输入两棵二叉树A和B，判断B是不是A的子结构。
    //    输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)
    //    B是A的子结构， 即 A中有出现和B相同的结构和节点值。
    //    例如: 给定的树 A:
    //              3
    //            / \
    //          4   5
    //        / \
    //      1   2
    //    给定的树 B：
    //          4
    //        /
    //      1
    //    返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

    func recursive(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil { return true }
        if A == nil || A != B { return false }
        return recursive(A?.left, B?.left) && recursive(A?.right, B?.right)
    }

    public func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if let A = A, let B = B {
            return recursive(A, B) || isSubStructure(A.left, B) || isSubStructure(A.right, B)
        } else {
            return false
        }
    }
}

extension Solution {
    //    面试题27：二叉树的镜像
    //    https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof/
    //    题目：请完成一个函数，输入一个二叉树，该函数输出它的镜像。

    public func mirrorTreeDFS(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let tmp = root.left
        root.left = mirrorTreeDFS(root.right)
        root.right = mirrorTreeDFS(tmp)
        return root
    }

    @discardableResult
    public func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            let node = stack.popLast()
            if let left = node?.left {
                stack.append(left)
            }
            if let right = node?.right {
                stack.append(right)
            }
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
        }
        return root
    }
}

extension Solution {
    public func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else {
            return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
}

extension Solution {

    //    572. 另一个树的子树
    //    https://leetcode-cn.com/problems/subtree-of-another-tree/
    //    给定两个非空二叉树 s 和 t，检验 s 中是否包含和 t 具有相同结构和节点值的子树。s 的一个子树包括 s 的一个节点和这个节点的所有子孙。s 也可以看做它自身的一棵子树。

    //    要判断一个树 t 是不是树 s 的子树，那么可以判断 t 是否和树 s 的任意子树相等。那么就转化成100. Same Tree。即，这个题的做法就是在 s 的每个子节点上，判断该子节点是否和 t 相等。
    //    判断两个树是否相等的三个条件是与的关系，即：当前两个树的根节点值相等；
    //    并且，s 的左子树和 t 的左子树相等；
    //    并且，s 的右子树和 t 的右子树相等。
    //
    //    而判断 t 是否为 s 的子树的三个条件是或的关系，即：当前两棵树相等；
    //    或者，t 是 s 的左子树；5
    //    或者，t 是 s 的右子树。
    //    判断 是否是相等的树 与 是否是子树 的代码简直是对称美啊~

    public func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        } else if s == nil || t == nil {
            return false
        } else {
            return isSameTree(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
        }
    }
}

extension Solution {

    //    面试题28：对称的二叉树
    //    https://leetcode-cn.com/problems/symmetric-tree/
    //    题目：请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和
    //    它的镜像一样，那么它是对称的。

    public func isSymmetricReverse(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }

    func isMirror(_ n1: TreeNode?, _ n2: TreeNode?) -> Bool {
        if n1 == nil && n2 == nil {
            return true
        } else if n1 == nil || n2 == nil {
            return false
        } else {
            return n1 == n2 && isMirror(n1?.left, n2?.right) && isMirror(n1?.right, n2?.left)
        }
    }

    public func isSymmetric(_ root: TreeNode?) -> Bool {
        var stack1 = [TreeNode?]()
        stack1.append(root?.left)
        stack1.append(root?.right)
        while !stack1.isEmpty {
            let t1 = stack1.removeLast()
            let t2 = stack1.removeLast()

            if t1 == nil && t2 == nil {
                continue
            } else if t1 == nil || t2 == nil {
                return false
            } else if t1 != t2 {
                return false
            }
            stack1.append(t1?.left)
            stack1.append(t2?.right)
            stack1.append(t1?.right)
            stack1.append(t2?.left)
        }
        return true
    }
}

extension Solution {
//    124. [二叉树中的最大路径和](https://leetcode-cn.com/problems/binary-tree-maximum-path-sum)
//    给定一个非空二叉树，返回其最大路径和。
//    本题中，路径被定义为一条从树中任意节点出发，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
//
//    示例 1: 输入: [1,2,3], 输出: 6
//      1
//     / \
//    2   3
//
//    示例 2:
//    输入: [-10,9,20,null,null,15,7], 输出: 42
//          -10
//          / \
//        9  20
//            /  \
//          15   7

    public func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min

        func maxGain(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }

            // 递归计算左右子节点的最大贡献值
            // 只有在最大贡献值大于 0 时，才会选取对应子节点
            let leftGain = max(0, maxGain(root.left))
            let rightGain = max(0, maxGain(root.right))

            // 节点的最大路径和取决于该节点的值与该节点的左右子节点的最大贡献值
            let priceNewpath = leftGain + rightGain + root.val

            // 更新答案
            ans = max(ans, priceNewpath);

            // 返回节点的最大贡献值
            return root.val + max(leftGain, rightGain);
        }

        _ = maxGain(root)
        return ans
    }
}
