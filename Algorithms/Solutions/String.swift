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

    public func lengthOfLongestSubstring1(_ s: String) -> Int {
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

    public func lengthOfLongestSubstring(_ s: String) -> Int {
//        var left = 0, right = 0, length = 0
//        var window = [Character : Int]()
//        let chars = Array(s)
//        for char  in chars {
//            if let count = window[char] {
//                window[char] = count + 1
//            }
//            right += 1
//
//            // 如果 window 中出现重复字符
//            // 开始移动 left 缩小窗口
//            while let count = window[char], count > 1 {
//                let key = chars[left];
//                if count = chars[key]
//                window[key] = count
//                left += 1
//            }
//
//            length = max(length, right - left)
//        }
//        return length
        return 0
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
        while l >= 0 && r < chars.count, chars[l] == chars[r] {
          l -= 1
          r += 1
        }

        return r - l - 1
    }
}


extension Solution {

    /// 编辑距离
//    给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。
//
//    你可以对一个单词进行如下三种操作：
//
//    插入一个字符
//    删除一个字符
//    替换一个字符
//
//
//    示例 1：
//
//    输入：word1 = "horse", word2 = "ros"
//    输出：3
//    解释：
//    horse -> rorse (将 'h' 替换为 'r')
//    rorse -> rose (删除 'r')
//    rose -> ros (删除 'e')
//    示例 2：
//
//    输入：word1 = "intention", word2 = "execution"
//    输出：5
//    解释：
//    intention -> inention (删除 't')
//    inention -> enention (将 'i' 替换为 'e')
//    enention -> exention (将 'n' 替换为 'x')
//    exention -> exection (将 'n' 替换为 'c')
//    exection -> execution (插入 'u')

    public func minDistance1(_ word1: String, _ word2: String) -> Int {

        var arr1 = Array(word1), arr2 = Array(word2)
        /// memory init with [[-1]]
        var memory = Array(repeating: Array(repeating: -1, count: word2.count), count: word1.count)

        func min3(_ a: Int, _ b: Int, _ c: Int) -> Int {
            return min(a, min(b, c))
        }

        func dp(_ i: Int, _ j: Int) -> Int {
            // base case
            if i == -1 {
                return j + 1
            }
            if j == -1 {
                return i + 1
            }

            if memory[i][j] != -1 {
                return memory[i][j]
            }

            if arr1[i] == arr2[j] {
                memory[i][j] = dp(i - 1, j - 1)
            } else {
                memory[i][j] = min3(dp(i, j - 1) + 1,
                                    dp(i - 1, j) + 1,
                                    dp(i - 1, j - 1) + 1)
            }
            return memory[i][j]
        }

        return dp(word1.count - 1, word2.count - 1)
    }

    /// dp table, bottom to top
    public func minDistance(_ word1: String, _ word2: String) -> Int {

        if word1.isEmpty {
            return word2.count
        }

        if word2.isEmpty {
            return word1.count
        }

        func min3(_ a: Int, _ b: Int, _ c: Int) -> Int {
            return min(a, min(b, c))
        }

        let arr1 = Array(word1), arr2 = Array(word2)

        /// memory init with [[-1]]
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)

        for i in 1...word1.count {
            dp[i][0] = i
        }

        for j in 1...word2.count {
            dp[0][j] = j
        }

        for i in 1...word1.count {
            for j in 1...word2.count {
                if arr1[i - 1] == arr2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min3(dp[i][j - 1] + 1,
                                    dp[i - 1][j] + 1,
                                    dp[i - 1][j - 1] + 1)
                }
            }
        }

        return dp[word1.count][word2.count]
    }
}


extension Solution {

//    [最长上升序列](https://leetcode-cn.com/problems/longest-increasing-subsequence)
//    给定一个无序的整数数组，找到其中最长上升子序列的长度。
//    示例:
//
//    输入: [10,9,2,5,3,7,101,18]
//    输出: 4
//    解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
//    说明:
//
//    可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
//    你算法的时间复杂度应该为 O(n2) 。
//    进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?

    public func lengthOfLIS1(_ nums: [Int]) -> Int {
//        var res = 0
        var dp = Array(repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
        }

//        for i in 0..<dp.count {
//            res = max(res, dp[i])
//        }
        return dp.max() ?? 0
    }

    public func lengthOfLIS(_ nums: [Int]) -> Int {

        var top = Array(repeating: 1, count: nums.count)

        // 牌堆数初始化为 0
        var piles = 0
        for i in 0..<nums.count {
            // 要处理的扑克牌
            let poker = nums[i]

            /***** 搜索左侧边界的二分查找 *****/
            var left = 0, right = piles
            while (left < right) {
                let mid = (left + right) / 2;
                if (top[mid] > poker) {
                    right = mid
                } else if (top[mid] < poker) {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            /*********************************/

            // 没找到合适的牌堆，新建一堆
            if (left == piles) {
                piles += 1
            }
            // 把这张牌放到牌堆顶
            top[left] = poker
        }
        // 牌堆数就是 LIS 长度
        return piles
    }
}

extension Solution {
//    剑指 Offer 38. [字符串的排列](https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/)
//    输入一个字符串，打印出该字符串中字符的所有排列。
//    你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。
//    示例: 输入：s = "abc" 输出：["abc","acb","bac","bca","cab","cba"]
//    限制：1 <= s 的长度 <= 8

    public func permutation(_ s: String) -> [String] {
        var results = [String]()
        var chars = Array(s)
        var tracks = Set<Character>()

        func backtrack(_ index: Int) {

            if s.count - 1 == index {
                // 添加排列方案
                results.append(String(chars))
                return
            }

            tracks.removeAll()
            var i = index
            while i < s.count {
                // 重复，因此剪枝
                if tracks.contains(chars[i]) {
                    i += 1
                    continue
                }
                tracks.update(with:chars[i])
                // 交换，将 c[i] 固定在第 x 位
                swap(&chars, i, index)
                // 开启固定第 x + 1 位字符
                backtrack(index + 1)
                swap(&chars, index, i)
                i += 1
            }
        }

        backtrack(0)
        return results
    }

    func permutation1(_ s: String) -> [String] {
        var results = [String]()
        let chars = Array(s)

        func backtrack(_ chars: [Character], _ tracks: [Int]) {

            var tracks = tracks
            if tracks.count == chars.count {
                let result = String(tracks.map { chars[$0] })
                if !results.contains(result) {
                    results.append(result)
                }
                return
            }

            for (i, _) in chars.enumerated() {
                if tracks.contains(i) {
                    continue
                }
                tracks.append(i)
                backtrack(chars, tracks)
                tracks.removeLast()
            }
        }

        let tracks = [Int]()
        backtrack(chars, tracks)
        return results
    }

}

extension Solution {
//    链接：https://leetcode-cn.com/problems/palindromic-substrings
//    给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
//    具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。
//
//    示例 1：
//    输入："abc" 输出：3
//    解释：三个回文子串: "a", "b", "c" 示例 2：
//
//    输入："aaa" 输出：6
//    解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"

    func countSubstrings(_ s: String) -> Int {
        var i = 0, j = 0, sum = 0
        while i < s.count {
            j = i + 1
            while j < s.count {
                let result = palindrome(s, i, j)
                if !result.isEmpty {
                    sum += 1
                }
            }
        }
        return sum

    }

    func palindrome(_ s: String, _ l: Int, _ r: Int) -> String {
        var l = l, r = r
        while l < r, r < s.count, s.char(offset: l) == s.char(offset: r) {
            l += 1
            r -= 1
        }

        return s.substring(from: l + 1, to: r - l - 1)
    }
}
