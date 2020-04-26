//
//  String./Users/edmond/Documents/Algorithms/Algorithms/Algorithmsswift
//  Algorithms
//
//  Created by Edmond on 2020/4/25.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


extension Solution {

    // 面试题19：正则表达式匹配 https://leetcode-cn.com/problems/regular-expression-matching/solution/zheng-ze-biao-da-shi-pi-pei-by-leetcode/
    // 题目：请实现一个函数用来匹配包含'.'和'*'的正则表达式。模式中的字符'.'
    // 表示任意一个字符，而'*'表示它前面的字符可以出现任意次（含0次）。在本题
    // 中，匹配是指字符串的所有字符匹配整个模式。例如，字符串"aaa"与模式"a.a"
    // 和"ab*ac*a"匹配，但与"aa.a"及"ab*a"均不匹配。


//    1. 回朔算法
//    如果没有星号（正则表达式中的 * ），问题会很简单——我们只需要从左到右检查匹配串 s 是否能匹配模式串 p 的每一个字符。
//    当模式串中有星号时，我们需要检查匹配串 s 中的不同后缀，以判断它们是否能匹配模式串剩余的部分。
//
//    如果模式串中有星号，它会出现在第二个位置，即 pattern[1] 。
//    这种情况下，我们可以直接忽略模式串中这一部分，或者删除匹配串的第一个字符，前提是它能够匹配模式串当前位置字符，
//    即 pattern[0] 。 如果两种操作中有任何一种使得剩下的字符串能匹配，那么初始时，匹配串和模式串就可以被匹配。

//    [Backtrace]
    public func stringMatchBacktrace(_ s: String, _ p: String) -> Bool {
        if p.isEmpty { return s.isEmpty }

        let isFirstMatch = !s.isEmpty && (s.first == p.first || p.first == ".")
        if p.count >= 2 && p.char(offset: 1) == "*" {
            return (stringMatchBacktrace(s, p.substring(from:2)) ||
                isFirstMatch && stringMatchBacktrace(s.substring(from: 1), p))
        } else {
            return isFirstMatch && stringMatchBacktrace(s.substring(from: 1), p.substring(from: 1))
        }
    }

//    [DP]
//    首先是状态，因为题目拥有 最优子结构 ，一个自然的想法是将中间结果保存起来。
//    我们通过用 {dp(i,j) 表示 {text[i:] 和 pattern[j:] 是否能匹配。
//    我们可以用更短的字符串匹配问题来表示原本的问题。
//
//    用 [方法 1] 中同样的回溯方法，除此之外，因为函数 match(text[i:], pattern[j:]) 只会被调用一次，
//    我们用 dp(i, j) 来应对剩余相同参数的函数调用，
//    这帮助我们节省了字符串建立操作所需要的时间，也让我们可以将中间结果进行保存。

    public func stringMatchPatternDP(_ s: String, _ p: String) -> Bool {
        var memo = Array(repeating: Array(repeating: -1, count: p.count + 1), count: s.count + 1)

        func dp(_ i: Int, _ j: Int) -> Bool {
            /// 退出条件
            if memo[i][j] != -1 {
                return memo[i][j] == 1 ? true : false
            } else {
                var ans: Bool
                if j == p.count {
                    ans = i == s.count
                } else {
                    let firstMatch = i < s.count && (p.char(offset: j) == s.char(offset: i) || p.char(offset: j) == ".")
                    if j + 1 < p.count && p.char(offset: 1) == "*" {
                        ans = dp(i, j + 2) || (firstMatch && dp(i + 1, j))
                    } else {
                        ans = firstMatch && dp(i + 1, j + 1)
                    }
                }
                memo[i][j] = ans ? 1 : 0
                return ans
            }
        }
        return dp(0, 0)
    }
}

