//
//  SortTemplate.swift
//  Algorithms
//
//  Created by Edmond on 2020/5/28.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


extension Solution {

    public func mergeSorted1(_ nums: [Int]) -> [Int] {
        var nums = nums

        func merge(_ start: Int, _ end: Int) {
            if start == end {
                return
            } else {
                let mid = (end + start) / 2
                merge(start, mid)
                merge(mid + 1, end)
                mergeTemp(start, mid, end)
            }
        }

        func mergeTemp(_ start: Int, _ mid: Int, _ end: Int) {

            var left = start, right = mid + 1, index = 0
            var temp = Array(repeating: 0, count: end - start + 1)

            while left <= mid, right <= end {
                if nums[left] <= nums[right] {
                    temp[index] = nums[left]
                    left += 1
                } else {
                    temp[index] = nums[right]
                    right += 1
                }
                index += 1
            }

            while left <= mid {
                temp[index] = nums[left]
                left += 1
                index += 1
            }
            while right <= end {
                temp[index] = nums[right]
                right += 1
                index += 1
            }
            // 将数组左半部分剩余元素复制到目标数组中
            for (i, val) in temp.enumerated() {
                nums[i + start] = val
            }
        }
        merge(0, nums.count - 1)
        return nums
    }

    public func mergeSorted(_ nums: [Int]) -> [Int] {

        func mergeSort(_ start: Int, _ end: Int, _ temp: inout [Int], _ nums: inout [Int]) {
            if start < end {
                let mid = (end + start) / 2
                // 排序左半部分
                mergeSort(start, mid, &temp, &nums)
                // 排序右半部分
                mergeSort(mid + 1, end, &temp, &nums)
                // 归并
                merge(start, mid, end, &temp, &nums)
            }
        }

        func merge(_ start: Int, _ mid: Int, _ end: Int, _ temp: inout [Int], _ nums: inout [Int]) {

            var left = start
            var right = mid + 1
            var current = start

            while left <= mid && right <= end {
                if nums[left] <= nums[right] {
                    temp[current] = nums[left]
                    left += 1
                } else {
                    temp[current] = nums[right]
                    right += 1
                }
                current += 1
            }

            while left <= mid {
                temp[current] = nums[left]
                left += 1
                current += 1
            }

            while right <= end {
                temp[current] = nums[right]
                right += 1
                current += 1
            }

            for i in start...end {
                nums[i] = temp[i]
            }
            
        }

        var nums = nums
        var temp = Array(repeating: 0, count: nums.count)
        mergeSort(0, nums.count - 1, &temp, &nums)
        return nums
    }


}

extension Solution {

    public func quickSorted(_ nums: [Int]) -> [Int] {

        var nums = nums

        func quickSorted(_ nums: inout [Int], _ start: Int, _ end: Int) {
            if start >= end {
                return
            }

            var left = start, right = end;
            /// 要点 1：pivot 是值而非 index: https://zhuanlan.zhihu.com/p/34259719
            let pivot = nums[(start + end) / 2]

            /// 要点 2：每次对比 left & right，必须是 `left <= right`
            while left <= right {
                /// 要点 3：`nums[left] < pivot` 而不是 `nums[left] <= pivot`
                while left <= right && nums[left] < pivot {
                    left += 1
                }
                /// 要点 4：`nums[right] > pivot` 而不是 `nums[right] >= pivot`
                while left <= right && nums[right] > pivot {
                    right -= 1
                }
                if left <= right {
                    let temp = nums[left]
                    nums[left] = nums[right]
                    nums[right] = temp

                    left += 1
                    right -= 1
                }
            }
            quickSorted(&nums, start, right)
            quickSorted(&nums, left, end)
        }

        quickSorted(&nums, 0, nums.count - 1)
        return nums
    }

    public func templateMerge(_ nums: [Int], _ start: Int, _ middle: Int, _ end: Int, _ temp: inout [Int]) {
        var left = start, right = middle + 1, index = start;

        /// merge two sorted subarrays in nums to temp array
        while left <= middle && right <= end {
            if nums[left] < nums[right] {
                temp[index] = nums[left]
                index += 1; left += 1
            } else {
                temp[index] = nums[right]
                index += 1; right += 1
            }
        }
        while left <= middle {
            temp[index] = nums[left]
            index += 1; left += 1
        }
        while right <= end {
            temp[index] = nums[right]
            index += 1; right += 1
        }
    }
}

