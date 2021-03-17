// 42. 接雨水
// 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
// 示例 1：
// 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
// 输出：6
// 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 
// 示例 2：
// 输入：height = [4,2,0,3,2,5]
// 输出：9

extension Solution {

    func trap(_ height: [Int]) -> Int {
      if height.isEmpty {
          return 0
      }

      // 利用 double index， 分别找出左右两边的最高柱子完成工作；
      var left = 0
      var right = height.count - 1

      var lMax = height[0]
      var rMax = height[right]

      var ans = 0

      while left <= right {
        lMax = max(lMax, height[left])
        rMax = max(rMax, height[right]) 

        if lMax < rMax {
          ans += lMax - height[left]
          left += 1
        } else {
          ans += rMax - height[right]
          right -= 1
        }
      }

      return ans

    }
}