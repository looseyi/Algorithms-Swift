//
//  BinaryTree.swift
//  Algorithm
//
//  Created by Edmond on 2020/4/11.
//

import Foundation

public class BinaryTreeNode: Equatable {
	
	public var parent: BinaryTreeNode?
	public var left: BinaryTreeNode?
	public var right: BinaryTreeNode?
	public var value: Int

	public init(value: Int, parent: BinaryTreeNode? = nil, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
		self.value = value
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
		result.append(node.value)
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
		result.append(node.value)
		inOrderCore(node.right, result: &result)
	}
	
	public static func ==(left: BinaryTreeNode, right: BinaryTreeNode) -> Bool {
		return left.value == right.value
	}
}
