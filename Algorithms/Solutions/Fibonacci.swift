//
//  Fibonacci.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/13.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


extension Solution {
	/// 写一个函数，输入n，求斐波那契（Fibonacci）数列的第n项。
	
	/**
	求斐波那契数列中的第n个元素（递归方式-效率低）
	- Parameters:
	- n: n
	- Returns: 第n个斐波那契数列的值
	*/
	public func fibonacciRecursive(_ n: Int) -> Int {
		if n <= 0 { return 0 }
		if n == 1 { return 1 }
		return fibonacciLoop(n - 1) + fibonacciLoop(n - 2)  		
	}

	/**
	求斐波那契数列中的第n个元素（循环方式-效率较高）
	- Parameters:
	- n: n
	- Returns: 第n个斐波那契数列的值
	*/
	public func fibonacciLoop(_ n: Int) -> Int {
		if n <= 0 { return 0 }
		if n == 1 { return 1 }

		var n1 = 0, n2 = 1
		for _ in 2...n {
			(n1, n2) = (n2, n1 + n2)
		}
		return n2
	}
}
