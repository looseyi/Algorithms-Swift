//
//  BinaryTree.swift
//  Algorithm
//
//  Created by Edmond on 2020/4/11.
//

import Foundation

public class TreeNode {
	
	public var parent: TreeNode?
	public var left: TreeNode?
	public var right: TreeNode?
	public var val: Int

	public init(val: Int, parent: TreeNode? = nil, left: TreeNode? = nil, right: TreeNode? = nil) {
		self.val = val
		self.left = left
		self.right = right
		self.parent = parent
	}

	public func preOrder() -> [Int] {
		var result = [Int]()
		preOrderCore(self, result: &result)
		return result
	}

	private func preOrderCore(_ node: TreeNode?, result: inout [Int]) {
		guard let node = node else {
			return
		}
		result.append(node.val)
		preOrderCore(node.left, result: &result)
		preOrderCore(node.right, result: &result)
	}

	public func inOrder() -> [Int] {
		var result = [Int]()
		inOrderCore(self, result: &result)
		return result
	}

	private func inOrderCore(_ node: TreeNode?, result: inout [Int]) {
		guard let node = node else {
			return
		}
		inOrderCore(node.left, result: &result)
		result.append(node.val)
		inOrderCore(node.right, result: &result)
	}

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result: [Int] = []

        var stack = [TreeNode?]()
        var node: TreeNode? = root

        while !stack.isEmpty || node != nil {
            while let cur = node {
                stack.append(cur)
                node = cur.left
            }
            if let cur = stack.removeLast() {
                // 中序操作
                result.append(cur.val)

                node = cur.right
            }
        }
        return result
    }
}

extension TreeNode: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        if let left = left, let right = right {
            return "\(val)\n\(left.description) \(right.description)"
        } else if let left = left {
            return "\(val)\n\(left.description)"
        } else if let right = right {
            return "\(val)\n\(right.description)"
        } else {
            return "\(val)"
        }
    }
    public var debugDescription: String {
        return description
    }
}

extension TreeNode: Equatable {
    public static func ==(left: TreeNode, right: TreeNode) -> Bool {
        return left.val == right.val
    }
}

