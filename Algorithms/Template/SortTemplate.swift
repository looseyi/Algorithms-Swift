//
//  SortTemplate.swift
//  Algorithms
//
//  Created by Edmond on 2020/5/28.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


extension Solution {
/// 快速排序和归并的核心是将数据进行转换

    public func sortInteger2(_ a: [Int]) {
        var temp = Array(repeating: 0, count: a.count)
        templateMergesort(a, 0, a.count, &temp)
    }

    public func templateMergesort(_ a: [Int], _ start: Int, _ end: Int, _ temp: inout [Int]) {
        if start >= end {
            return
        }

        let middle = (start + end) / 2

        templateMergesort(a, start, middle, &temp)
        templateMergesort(a, middle + 1, end, &temp)
        templateMerge(a, start, middle, end, &temp)
    }

    public func templateMerge(_ a: [Int], _ start: Int, _ middle: Int, _ end: Int, _ temp: inout [Int]) {
        var left = start, right = middle + 1, index = start;

        /// merge two sorted subarrays in a to temp array
        while left <= middle && right <= end {
            if a[left] < a[right] {
                temp[index] = a[left]
                index += 1; left += 1
            } else {
                temp[index] = a[right]
                index += 1; right += 1
            }
        }
        while left <= middle {
            temp[index] = a[left]
            index += 1; left += 1
        }
        while right <= end {
            temp[index] = a[right]
            index += 1; right += 1
        }
    }
}

extension Solution {

//    public func sortInteger3(_ a: [Int]) {
//        var temp = Array(repeating: 0, count: a.count)
//        templateQuickSort(a, 0, a.count)
//    }
//
//    public func templateQuickSort(_ a: [Int], _ start: Int, _ end: Int) {
//        if start >= end {
//            return
//        }
//
//        let left = start, right = end;
//        /// 要点 1：pivot 是值而非 index: https://zhuanlan.zhihu.com/p/34259719
//        let pivot = a[(start + end) / 2]
//
//        /// 要点 2：每次对比 left & right，必须是 `left <= right`
//        while left <= right {
//            /// 要点 3：`A[left] < pivot` 而不是 `A[left] <= pivot`
//            while left <= right && A[left] < pivot {
//                left += 1
//            }
//            /// 要点 4：`A[right] > pivot` 而不是 `A[right] >= pivot`
//            while left <= right && A[right] > pivot {
//                right -= 1
//            }
//            if left <= right {
//                let temp = a[left]
//                a[left] = a[right]
//                a[right] = temp
//
//                left += 1
//                right -= 1
//            }
//        }
//        templateQuickSort(a, start, right)
//        templateQuickSort(a, left, end)
//    }
//
//    public func templateMerge(_ a: [Int], _ start: Int, _ middle: Int, _ end: Int, _ temp: inout [Int]) {
//        var left = start, right = middle + 1, index = start;
//
//        /// merge two sorted subarrays in a to temp array
//        while left <= middle && right <= end {
//            if a[left] < a[right] {
//                temp[index] = a[left]
//                index += 1; left += 1
//            } else {
//                temp[index] = a[right]
//                index += 1; right += 1
//            }
//        }
//        while left <= middle {
//            temp[index] = a[left]
//            index += 1; left += 1
//        }
//        while right <= end {
//            temp[index] = a[right]
//            index += 1; right += 1
//        }
//    }
}

