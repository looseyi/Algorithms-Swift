##重建二叉树

> source: 《剑指Offer》、[LeetCode - 105. Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/) 

Given preorder and inorder traversal of a tree, construct the binary tree.

**Note:**
You may assume that duplicates do not exist in the tree.

For example, given

```swift
let preorder = [3,9,20,15,7]
let inorder = [9,3,15,20,7]
```

Return the following binary tree:

```swift
    3
   / \
  9  20
    /  \
   15   7
```

###解题思路：

> 前序遍历：根-左-右
>
> 中序遍历：左-根-右

因此

- 对于 preorder，每个首元素即为一个子树的根元素

- 对于 inorder，查找 preorder 中的根元素

- 左边为 preorder 当前根元素的左子树

- 右边为 preorder 当前根元素的右子树

据此递归构造出一颗二叉树即可;



具体实现可基于分治的思想：

1. preorder 中元素的位置 pos，preorder[pos] 为根的子树必然对应着 inorder 数组中 [left, right]之间的值。

2. 一开始 pos = 0，以 preorder[0] 为根的树，对应着 inorder 数组中 [0, inorder.size()-1] 之间的元素

​	preorder[0] 在 inorder 中的位置为 p，则将 inorder 数组分为 [0, p-1] 和 [p+1, inorder.size()-1] 两部分

分别对应左子树的节点集合和右子树的节点集合。

注意 pos 值要传入到子树中处理后再传出的，因为先序数组中，左子树的节点全部在右子树的前面。
