//
//  Arithmetic.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/22.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {

// 剑指Offer 面试题16：数值的整数次方 https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof/
// 题目：实现函数 double Power(double base, int exponent)，求 base 的 exponent 次方。不得使用库函数，同时不需要考虑大数问题。
// 主要考察代码规范性、完整性需要考虑 exponent 为 0、负数的情况以及错误处理

    public func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 && n < 0 { return 0 }
        let absN = n < 0 ? -1 * n : n
        var result = myPowAbs(x, absN)
        if n < 0 {
            result = 1 / result
        }
        return result
    }

    fileprivate func myPowAbs(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n == 1 { return x }
        var result = myPowAbs(x, n / 2)
        result *= result
        if n % 2 == 1 {
            result *= x
        }
        return result
    }
}
