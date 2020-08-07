//
//  DynamicPrograming.swift
//  Algorithms
//
//  Created by Edmond on 2020/5/7.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {
//    [983. 最低票价](https://leetcode-cn.com/problems/minimum-cost-for-tickets/)
//    在一个火车旅行很受欢迎的国度，你提前一年计划了一些火车旅行。在接下来的一年里，你要旅行的日子将以一个名为 days 的数组给出。每一项是一个从 1 到 365 的整数。
//
//    火车票有三种不同的销售方式：
//
//    一张为期一天的通行证售价为 costs[0] 美元；
//    一张为期七天的通行证售价为 costs[1] 美元；
//    一张为期三十天的通行证售价为 costs[2] 美元。
//    通行证允许数天无限制的旅行。 例如，如果我们在第 2 天获得一张为期 7 天的通行证，那么我们可以连着旅行 7 天：第 2 天、第 3 天、第 4 天、第 5 天、第 6 天、第 7 天和第 8 天。
//
//    返回你想要完成在给定的列表 days 中列出的每一天的旅行所需要的最低消费。

    public func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        guard let last = days.last else { return 0 }
        var start = 0, i = 1, totalCosts = Array(repeating: 0, count: last + 1)
        while i <= last {
            if days[start] == i {
                var coast = Int.max
                let day1Ago = i - 1
                let day7Ago = i - 7 > 0 ? i - 7 : 0
                let day30Ago = i - 30 > 0 ? i - 30 : 0

                coast = min(totalCosts[day1Ago] + costs[0], coast)
                coast = min(totalCosts[day7Ago] + costs[1], coast)
                coast = min(totalCosts[day30Ago] + costs[2], coast)

                totalCosts[i] = coast

                start += 1
            } else {
                totalCosts[i] = totalCosts[i - 1]
            }

            i += 1
        }
        return totalCosts[last]
    }
}

//extension Solution {
////    打印一个list 如 [3 100 4 6 0 -1 4 3] 打印一个字典，key为当前值，value为第一个大于当前值的值
//
//    public func maxDictionaryInArray(_ array: [Int]) -> [Int : Int] {
//        if array.isEmpty {
//            return [:]
//        }
//        var dp = Array(repeating: -1, count: array.count)
//        var i = 0
//        while i < array.count {
//            if dp[i] < dp[i + 1]
//            dp[i]
//            i += 1
//        }
//    }
//}
