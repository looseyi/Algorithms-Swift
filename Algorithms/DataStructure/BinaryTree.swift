//
//  BinaryTree.swift
//  Algorithm
//
//  Created by Edmond on 2020/4/11.
//

import Foundation

public class BinaryTreeNode {
	
	public var parent: BinaryTreeNode?
	public var left: BinaryTreeNode?
	public var right: BinaryTreeNode?
	public var val: Int

	public init(val: Int, parent: BinaryTreeNode? = nil, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
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

	private func preOrderCore(_ node: BinaryTreeNode?, result: inout [Int]) {
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

	private func inOrderCore(_ node: BinaryTreeNode?, result: inout [Int]) {
		guard let node = node else {
			return
		}
		inOrderCore(node.left, result: &result)
		result.append(node.val)
		inOrderCore(node.right, result: &result)
	}
}

extension BinaryTreeNode: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        if let left = left, let right = right {
            return "\(val)\n\(left.description)   \(right.description)"
        } else if let left = left {
            return "\(val)\n\(left.description)"
        } else if let right = right {
            return "\(val)\n   \(right.description)"
        } else {
            return "\(val)"
        }
    }
    public var debugDescription: String {
        return description
    }
}

extension BinaryTreeNode: Equatable {
    public static func ==(left: BinaryTreeNode, right: BinaryTreeNode) -> Bool {
        return left.val == right.val
    }
}

