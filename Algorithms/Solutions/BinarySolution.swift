//
//  BinarySolution.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/22.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


extension Solution {

    // 剑指Offer 面试题15：二进制中1的个数
    // https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/
    // 题目：请实现一个函数，输入一个整数，输出该数二进制表示中1的个数。例如
    // 把9表示成二进制是1001，有2位是1。因此如果输入9，该函数输出2。

    public func hammingWeight(_ n: Int) -> Int {
        var count = 0, flag = 1
        while flag != 0 {
            if flag & n > 0 {
                count += 1
            }
            flag = flag << 1
        }
        return count
    }

    /**
     方法：将整数 num-1 与 num 做与运算，会把该整数的最右边的1变成0
     那么1个整数二进制有多少个1就可以进行多少次这样操作
     - Parameters:
     - num: 输入的整数
     - Returns: i的2进制表示中1的个数
     */
    public func hammingWeight2(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n > 0 {
            count += 1
            n = n & (n - 1)
        }
        return count
    }
}

