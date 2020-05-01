//
//  Array.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/14.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {
	
	// 剑指Offer 面试题3（二）：不修改数组找出重复的数字
	// 题目：在一个长度为n+1的数组里的所有数字都在1到n的范围内，所以数组中至
	// 少有一个数字是重复的。请找出数组中任意一个重复的数字。例如，如果输入长度为8的数组{2, 3, 5, 4, 3, 2, 6, 7}，那么对应的
	// 输出是重复的数字2或者3。
	
	// 题眼：数组中至少一个数字重复，作为 1～n 范围内只有 n 个数字，而数组包含超过 n 个数字
	// 那么一半区间一定有重复数字，利用二分法；
	
	/**
	查找整数数组中任一重复的数字，限制：不能修改输入的数组
	- Parameters:
	- numbers: 整数数组
	- Returns: 重复的整数
	*/
	public func duplicateEditDisable(_ numbers: [Int]) -> Int? {
		// 所有数字都在1到 numbers.count-1 大小范围内， min 和 max 表示这个范围
		var min = 1
		var max = numbers.count - 1
		while min <= max {
			let middle = (max - min) / 2 + min
			let countAtRange = numbers.filter { $0 >= min && $0 <= middle }.count
			if min == max {
				if countAtRange > 1 {
					return min
				} else {
					break
				}
			}
			let expectCount = middle - min + 1
			if countAtRange > expectCount {
				max = middle
			} else {
				min = middle + 1
			}
		}
		return nil
	}

	
	/**
	查找整数数组中任一重复的数字，可修改输入数组
	- Parameters:
	- numbers: 整数数组
	- Returns: Tuple(重复数字的索引，值)
	*/
	public func duplicateEditEnable(_ numbers: [Int]) -> (index: Int, num: Int)? {
		var numbers = numbers
		for index in 0..<numbers.count {
			while numbers[index] != index {
				if numbers[index] == numbers[numbers[index]] {
					return (index, numbers[index])
				}
				(numbers[index], numbers[numbers[index]]) = (numbers[numbers[index]], numbers[index])
			}
		}
		return nil
	}
}


extension Solution {
    
	// 剑指Offer 面试题11：旋转数组的最小数字 https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/
	// 题目：把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
	// 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如数组
	// {3, 4, 5, 1, 2} 为 {1, 2, 3, 4, 5} 的一个旋转，该数组的最小值为 1。
	
//    解题思路：
//    如下图所示，寻找旋转数组的最小元素即为寻找 右排序数组 的首个元素 numbers[x] ，称 xx 为 旋转点 。
//    排序数组的查找问题首先考虑使用 二分法 解决，其可将遍历法的 线性级别 时间复杂度降低至 对数级别 。
//    [示例](https://pic.leetcode-cn.com/5884538fb9541a31a807d59c81226ded3dcd61df66efcdeb000165036ea68bb9-Picture1.png)
//    
//    算法流程：
//    循环二分： 设置 ii, jj 指针分别指向 numbers 数组左右两端，m = (i + j) // 2m=(i+j)//2 为每次二分的中点（ "//" 代表向下取整除法，因此恒有 i \leq m < ji≤m<j ），可分为以下三种情况：
//    当 numbers[m] > numbers[j]时： mm 一定在 左排序数组 中，即旋转点 xx 一定在 [m + 1, j][m+1,j] 闭区间内，因此执行 i = m + 1i=m+1；
//    当 numbers[m] < numbers[j] 时： mm 一定在 右排序数组 中，即旋转点 xx 一定在[i, m][i,m] 闭区间内，因此执行 j = mj=m；
//    当 numbers[m] == numbers[j] 时： 无法判断 mm 在哪个排序数组中，即无法判断旋转点 xx 在 [i, m][i,m] 还是 [m + 1, j][m+1,j] 区间中。解决方案： 执行 j = j - 1j=j−1 缩小判断范围 （分析见以下内容） 。
//    返回值： 当 i = ji=j 时跳出二分循环，并返回 numbers[i] 即可。
//    思考： 是否可以用 numbers[m] 和 numbers[i] 比较做代替？
//    解析： 不可以。因为做比较的目的是判断 mm 在哪个排序数组中。但在 numbers[m] > numbers[i]情况下，无法判断 mm 在哪个排序数组中。本质是因为 jj 初始值肯定在右排序数组中； ii 初始值无法确定在哪个排序数组中。
//    示例： 当 i = 0, j = 4, m = 2i=0,j=4,m=2 时，有 numbers[m] > numbers[i] ，以下两示例得出不同结果。
//    numbers = [1, 2, 3, 4 ,5]numbers=[1,2,3,4,5] 旋转点 x = 0x=0 ： mm 在右排序数组（此示例只有右排序数组）；
//    numbers = [3, 4, 5, 1 ,2]numbers=[3,4,5,1,2] 旋转点 x = 3x=3 ： mm 在左排序数组。
//    
//    展开分析 numbers[m] == numbers[j] 情况：
//    无法判定 mm 在左（右）排序数组： 设以下两个旋转点值为 00 的示例数组，则当 i = 0i=0, j = 4j=4 时 m = 2m=2 ，两示例结果不同。
//    
//    例 [1, 0, 1, 1, 1][1,0,1,1,1] ：旋转点 x = 1x=1 ，因此 m = 2m=2 在 右排序数组 中。
//    例 [1, 1, 1, 0, 1][1,1,1,0,1] ：旋转点 x = 3x=3 ，因此 m = 2m=2 在 左排序数组 中。
//    j = j - 1j=j−1 操作的正确性证明： 只需证明每次执行此操作后，旋转点 xx 仍在 [i, j][i,j] 区间内即可。
//    
//    若 mm 在右排序数组中： numbers[m] == numbers[j] ，因此数组 [m, j][m,j]（恒有 m < jm<j）区间内所有元素值相等，执行 j = j - 1j=j−1 只会抛弃一个重复值，因此旋转点 xx 仍在 [i, j][i,j] 区间内。
//    若 mm 在左排序数组中： 由于 左排序数组 任一元素 >= 右排序数组 任一元素 ，因此可推出旋转点元素值 numbers[x] <= numbers[j] == numbers[m]，则有：
//    若 numbers[x] < numbers[j] ： 即 jj 左方仍有值更小的元素，执行 j = j - 1j=j−1 后旋转点 xx 仍在 [i, j][i,j] 区间内。
//    若 numbers[x] == numbers[j] ： 分为以下两种情况。
//    当 j>xj>x ： 易得执行 j = j - 1j=j−1 后旋转点 xx 仍在 [i, j][i,j] 区间内。
//    当 j=xj=x： 特殊情况，即执行 j = j - 1j=j−1 后旋转点 xx 可能不在 [i, j][i,j] 区间内。例如 [1, 1, 1, 2, 3, 1][1,1,1,2,3,1] ，当 i = 0i=0 , m = 2m=2 , j = 5j=5 时执行 j = j - 1j=j−1 后虽然 丢失了旋转点索引 x = 5x=5 ，但最终返回值仍正确（最终返回的 numbers[0] 等于旋转点值 numbers[5] ），这是因为：之后的二分循环一直在执行 j = mj=m ，而区间 [i, m][i,m] 内的元素值一定都等于旋转点值 numbers[x] （ ∵ 区间内元素值既要满足 \geq≥ 也要满足 \leq≤ numbers[x]） ，因此 仍可保证正确的返回值 。
//    总结： 此方法可以保证返回值 numbers[i] 等于旋转点值 numbers[x] ；但在少数特例下 ii 不是旋转点 xx 。本题目只要求返回 “旋转点的值” ，因此本方法可行。
//    
//    [示例](https://pic.leetcode-cn.com/41e849b6d74be968bc604d0f95feb262c30e4238672f4abe4ec32ad4f0d3620b-Picture4.png)
//    
//    复杂度分析：
//    时间复杂度 O(log_2 N)O(log 
//    2
//    ​    ​    
//    N) ： 在特例情况下（例如 [1, 1, 1, 1][1,1,1,1]），会退化到 O(N)O(N)。
//    空间复杂度 O(1)O(1) ： ii , jj , mm 指针使用常数大小的额外空间。
	
	/**
	旋转数组的最小数字
	- Parameters:
	- numbers: 一个递增数组的旋转
	- Returns: 数组中最小的那个数字
	*/
	public func minNumberInRotatedArray(_ numbers: [Int]) -> Int {
        if numbers.count == 1 || numbers.first! < numbers.last! { return numbers.first ?? -1 }
		
        var low = 0
        var high = numbers.count - 1
		if let first = numbers.first, let last = numbers.last, first == last {
			var index = 1
			var min = numbers[low]
			while index < high {
				if min > numbers[index] {
                    min = numbers[index]
                }
                index += 1
			}
            return min
		}
        while low != high - 1 {
            let mid = low + (high - low) / 2
            if numbers[mid] >= numbers[low] {
                low = mid
            }
            if numbers[mid] <= numbers[high] {
                high = mid
            }
        }
        return numbers[high]
	}
    
    public func minNumberInRotatedArray2(_ numbers: [Int]) -> Int {
        var i = 0, j = numbers.count - 1, m = j
        while i < j {
            m = (i + j) / 2
            if numbers[m] > numbers[j] { i = m + 1 } 
            else if numbers[m] < numbers[j] { j = m }
            else { j -= 1 }
        }
        return numbers[i]
    }
}

extension Solution {
//    33. 搜索旋转排序数组 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
//    假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//    ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//    搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
//    你可以假设数组中不存在重复的元素。
//    你的算法时间复杂度必须是 O(log n) 级别。
//    示例 1: 输入: nums = [4,5,6,7,0,1,2], target = 0 输出: 4
//    示例 2: 输入: nums = [4,5,6,7,0,1,2], target = 3 输出: -1

//    以二分方式确定数组哪边为有序数组(哪边有序很重要），并根据有序部分来判断 target 是否在其中，不断循环；
//    需要注意边界条件判断

    public func searchInRotatedArray2(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        if nums.count == 1 { return nums[0] == target ? 0 : -1 }

        var left = 0, right = nums.count - 1

        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] == target { return mid }

            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }

    /// 序列为两个升序，给后面的升序（都小于第一个元素）加一个权值，使序列变为一个升序，然后二分查找
    /// https://blog.csdn.net/bendaai/article/details/80059676

    public func searchInRotatedArray(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        if nums.count == 1 { return nums[0] == target ? 0 : -1 }

        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] == target { return mid }

            if target.shift(nums[0]) > nums[mid].shift(nums[0]) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }


//    81. 搜索旋转排序数组 II
//    https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii/
//    假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//    ( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。
//    编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。
//    示例 1: 输入: nums = [2,5,6,0,0,1,2], target = 0
//    输出: true
//    示例 2: 输入: nums = [2,5,6,0,0,1,2], target = 3
//    输出: false
//    进阶: 这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
//    这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？

    public func searchInRotatedArrayII(_ nums: [Int], _ target: Int) -> Bool {
        if nums.isEmpty { return false }
        if nums.count == 1 { return nums[0] == target }

        var left = 0, right = nums.count - 1

        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] == target { return true }
            /// 此时分不清到底是前面有序还是后面有序，此时 start++ 即可。相当于去掉一个重复的干扰项。
            if nums[left] == nums[mid] {
                left += 1; continue;
            }
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return false
    }
}

extension Int {
    func shift(_ from: Int) -> Int {
        return self < from ? self + 0x3f3f3f3f - from : self
    }
}


extension Solution {
// 剑指Offer 面试题21：调整数组顺序使奇数位于偶数前面
// 题目：输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有
// 奇数位于数组的前半部分，所有偶数位于数组的后半部分。
//    输入：nums = [1,2,3,4]
//    输出：[1,3,2,4]
//    注：[3,1,2,4] 也是正确的答案之一。

//    对于数组交换的可以尝试使用双指针来解题

    public func arrayExchangeSingal(_ nums: [Int]) -> [Int] {
        var left = 0, right = nums.count - 1, nums = nums
        while left < right {
            // 左边为偶数，右边为基数则进行交换
            if nums[left] % 2 == 0 && nums[right] % 2 == 1 {
                let temp = nums[left]
                nums[left] = nums[right]
                nums[right] = temp
                left += 1
                right -= 1
            } else if nums[left] % 2 == 1 {
                left += 1
            } else if nums[right] % 2 == 0 {
                right -= 1
            }
        }
        return nums
    }
}

