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


extension Solution {

    //    剑指Offer 面试题20：表示数值的字符串  https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
    //    题目：请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，
    //    字符串“+100”、“5e2”、“-123”、“3.1416”及“-1E-16”都表示数值，但“12e”、
    //    “1a3.14”、“1.2.3”、“+-5”及“12e+5.4”都不是
    /*
     核心: 有效数字的模式只有两种:
     1)A[.[B]][e|EC]  比如: +100   -67.0  29.    3.14E5
     2).B[e|EC]       比如: .3     .4E6
     其中,A、C是整数，B是正整数; [e|EC]表示[eC]或者[EC]
     原则: 有A的话,有没有B都可以; 没有A的话, 必须有B
     */

    private static let digits: [Character] = ["0","1","2","3","4","5","6","7","8","9"]

    public func isNumeric(_ s: String) -> Bool {
        let s = s.trimmingCharacters(in: .whitespaces)
        if s.isEmpty { return false }
        let str = Array(s)

        //查找正负号以及整数部分
        var (isNum, index) = scanInteger(str, 0)
        //如果之后是小数点
        if index < str.count && str[index] == "." {
            index += 1
            //查找小数点之后的数字部分
            let result = scanUnsignInteger(str, index)
            isNum = isNum || result.0
            index = result.1
        }
        //如果之后是e或者E
        if index < str.count - 1 && (str[index] == "e" || str[index] == "E") {
            index += 1
            let result = scanInteger(str, index)
            isNum = isNum && result.0
            index = result.1
        }
        return isNum && index == str.count
    }

    /// 匹配数值字符串中整数部分（可能包含+和-符号）
    private func scanInteger(_ str: [Character], _ startIdx: Int) -> (Bool, Int) {
        var i = startIdx
        if str[i] == "+" || str[i] == "-" {
            i += 1
        }
        return scanUnsignInteger(str, i)
    }

    /// 匹配数值字符串中无符号整数部分, A[.[B]][e|EC] 即：其中的A（移除正负符号后）和B
    private func scanUnsignInteger(_ str: [Character], _ startIdx: Int) -> (Bool, Int) {
        var i = startIdx
        while i < str.count, Solution.digits.contains(str[i]) {
            i += 1
        }
        return (i > startIdx, i)
    }
}

extension Solution {
    //    3. 无重复字符的最长子串
    //    https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
    //    给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

    //    输入: "abcabcbb"
    //    输出: 3
    //    解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

    /// 这题还可以用滑动窗口来解决（正解）

    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = [Character](), length = 0
        let arr = Array(s)
        for s in arr {
            if !result.contains(s) {
                result.append(s)
            } else {
                while result.removeFirst() != s {
                }
                result.append(s)
            }
            length = max(length, result.count)
        }
        return length
    }
}

extension Solution {

    /// https://leetcode-cn.com/problems/longest-palindromic-substring/submissions/

    public func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        var start = 0, end = 0, len = 0
        let chars = Array(s)

        for idx in 0..<chars.count {
            let l1 = expandAroundCenter(chars, idx, idx)//一个元素为中心
            let l2 = expandAroundCenter(chars, idx, idx + 1)//两个元素为中心
            len = max(l1, l2)
            if len > end - start {
                start = idx - (len - 1) / 2
                end = idx + len / 2
            }
        }
        return String(chars[start...end])
    }

    // 计算以left和right为中心的回文串长度
    func expandAroundCenter(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left, r = right
        while (l >= 0 && r < chars.count
            && chars[l] == chars[r]) {
                l -= 1
                r += 1
        }

        return r - l - 1
    }
}

