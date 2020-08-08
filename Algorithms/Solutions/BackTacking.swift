//
//  BackTacking.swift
//  Algorithms
//
//  Created by Edmond on 2020/8/8.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {

//    [全排列](https://leetcode-cn.com/problems/permutations)：
//    给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//    示例: 输入: [1,2,3]
//    输出:
//    [
//    [1,2,3],
//    [1,3,2],
//    [2,1,3],
//    [2,3,1],
//    [3,1,2],
//    [3,2,1]
//    ]

    public func permute(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()

//        var list = [Int]()
//        var visited = Array(repeating: false, count: nums.count)
//        dfs1(nums, &list, &visited, &results)

        dfs2(nums, 0, &results)

        return results
    }

    private func dfs1(_ nums: [Int], _ list: inout [Int], _ visited: inout [Bool], _ results: inout [[Int]]) {
        // 退出条件
        if nums.count == list.count {
            results.append(list)
            return
        }

        for i in 0..<nums.count {

            if visited[i] == false {

                visited[i] = true
                list.append(nums[i])
                dfs1(nums, &list, &visited, &results)
                list.removeLast()
                visited[i] = false
            }
        }
    }

    func swap(_ list: inout [Int], _ i: Int, _ j: Int) {
        let tmp = list[i]
        list[i] = list[j]
        list[j] = tmp
    }

    private func dfs2(_ nums: [Int], _ position: Int, _ results: inout [[Int]]) {
        // 退出条件
        if nums.count - 1 == position {
            results.append(nums)
            return
        }

        var nums = nums
        for i in position..<nums.count {
            swap(&nums, i, position)
            dfs2(nums, position + 1, &results)
            swap(&nums, position, i)
        }
    }
}
