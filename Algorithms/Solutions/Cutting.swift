//
//  Cutting.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/21.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {

    // 剑指Offer 面试题14：剪绳子 (可看作🎒问题）
    // 题目：给你一根长度为n绳子，请把绳子剪成m段（m、n都是整数，n>1并且m≥1）。
    // 每段的绳子的长度记为k[0]、k[1]、……、k[m]。k[0]*k[1]*…*k[m]可能的最大乘
    // 积是多少？例如当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此
    // 时得到最大的乘积18。

    /**
     长度为n的绳子剪成m段后的最大乘积（动态规划法）
     可以转换问题为: 绳子的长度为N，剪为长度 L（1<=L<=N）的子段，求每段绳子长度的最大乘积，即为完全背包问题
     dp[i] 表示 绳子长为 i 的最大乘积, 则有动态转换方程 dp[i] = Max{dp[i - L] * i} (1 <=L<n, L<=i<=n)
     - Parameters:
     - length: 绳子长度
     - Returns: 最大乘积
     */
    public func cuttingRope_dp(_ n: Int) -> Int {
        if n <= 3 {
            return 1 * (n - 1)
        }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...(n + 1) / 2 {
            for j in i...n {
                dp[j] = max(dp[j - i] * i, dp[j])
            }
        }
        return dp[n]
    }

    /**
     贪心算法：尽可能多地减去长度为3的绳子段，当绳子最后剩下的长度为4的时候，剪成2*2的2段
     L<=3时，返回L-1, L>3时，优先分解成更多的3，然后分解成2，得到的乘积最大

     转换成代码思路：

     当 L <= 3 时，最优解为 1 * (L-1)
     当 L > 3时，
     如果 L mod 3的值为 1，则分解为两个2，剩下的分解为3
     如果 L mod 3的值为 2，则分解为1个2，剩下的分解为3
     如果 L mod 3的值为 0，全部分解为3

     - Parameters:
     - length: 绳子长度
     - Returns: 段数的最大乘积
     */
    public func cuttingRope_greedy(_ n: Int) -> Int {
        if n <= 3 {
            return 1 * (n - 1)
        } else {
            var n = n, res = 1
            if n % 3 == 1 {
                res = 4; n -= 4
            } else if n % 3 == 2 {
                res = 2; n -= 2
            }
            while n > 0 {
                res *= 3
                n -= 3
            }
            return res
        }
    }

}
