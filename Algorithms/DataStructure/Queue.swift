//
//  Queue.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

// 剑指Offer 面试题9：用两个栈实现队列
// 题目：用两个栈实现一个队列。队列的声明如下，请实现它的两个函数appendTail
// 和deleteHead，分别完成在队列尾部插入结点和在队列头部删除结点的功能。
//
// 备注：使用array模拟stack，只用了数组的append和removeLast方法
public class TwoStackQueue<T> {
	public var pushArr: [T] = []
	public var popArr: [T] = []
	
	public init() {}
	
	/**
	在队列末端添加元素
	- Parameters:
	- element:待添加的元素
	*/
	public func appendTail(element: T) {
		pushArr.append(element)
	}
	
	/**
	删除头节点
	- Returns: 被删除的头节点
	*/
	public func deleteHead() -> T? {
		if !popArr.isEmpty {
			return popArr.removeLast()
		} else {
			while pushArr.count > 0 {
				popArr.append(pushArr.removeLast())
			}
			if popArr.count > 0 {
				return popArr.removeLast()
			} else {
				return nil
			}
		}
	}
}
