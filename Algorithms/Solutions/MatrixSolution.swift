//
//  Matrix.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

extension Solution {

// 剑指Offer面试题4：二维数组中的查找
// 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按
// 照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个
// 整数，判断数组中是否含有该整数。

// 题眼：由于二维数组，如果从中间选取一个数字来比较，那下一次要查找的会是两个重叠的区域。
// 通过从右上角来查找，保证是只有一个区域，注意数组为空的情况。
	
	/**
	判断二维数组中是否含有该整数P
	从二维数组的右上角开始查找
	- Parameters:
	- matrix: 二维数组
	- num: 查找的整数
	- Returns: 是否包含
	*/
	public func findInPartiallySorted(_ matrix: [[Int]], num: Int) -> Bool {
		// y 表示二维数组的列数， x 表示二维数组的行数 索引均从 0 开始
		// 查找方法从二维数组的右上角开始比较
		var y = 0
		var x = matrix.count - 1
		while y <= matrix[0].count - 1 && x >= 0 {
			if matrix[y][x] > num {
				x -= 1
			} else if matrix[y][x] < num {
				y += 1
			} else {
				return true
			}
		}
		return false
	}
}

extension Solution {

// 面试题12(剑指Offer)：矩阵中的路径
// 题目：请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有
// 字符的路径。路径可以从矩阵中任意一格开始，每一步可以在矩阵中向左、右、77
// 上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入
// 该格子。例如在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字
// 母用下划线标出）。但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个
// 字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
// A B T G
// C F C S
// J D E H


//  1. 典型的矩阵搜索问题，可使用 深度优先搜索（DFS）+ 剪枝 解决。
//    算法原理：
//    深度优先搜索： 可以理解为暴力法遍历矩阵中所有字符串可能性。DFS 通过递归，先朝一个方向搜到底，再回溯至上个节点，沿另一个方向搜索，以此类推。
//    剪枝： 在搜索中，遇到 这条路不可能和目标字符串匹配成功 的情况（例如：此矩阵元素和目标字符不同、此元素已被访问），则应立即返回，称之为 可行性剪枝 。
//
//    算法剖析：
//    递归参数： 当前元素在矩阵 board 中的行列索引 i 和 j ，当前目标字符在 word 中的索引 k 。
//    终止条件：
//    返回 false ： ① 行或列索引越界 或 ② 当前矩阵元素与目标字符不同 或 ③ 当前矩阵元素已访问过 （③ 可合并至 ② ） 。
//    返回 true ： 字符串 word 已全部匹配，即 k = len(word) - 1 。
//    递推工作：
//    标记当前矩阵元素： 将 board[i][j] 值暂存于变量 tmp ，并修改为字符 '/' ，代表此元素已访问过，防止之后搜索时重复访问。
//    搜索下一单元格： 朝当前元素的 上、下、左、右 四个方向开启下层递归，使用 或 连接 （代表只需一条可行路径） ，并记录结果至 res 。
//    还原当前矩阵元素： 将 tmp 暂存值还原至 board[i][j] 元素。
//    回溯返回值： 返回 res ，代表是否搜索到目标字符串。


//    2. 主程序寻找起点，辅助函数用于在给定起点和已探测节点的基础上继续DFS探测，同时用一个字典保留已探测的节点避免重复探测。当探测节点个数等于目标字符串长度时，即可返回；否则回溯至上一节点。

    public func existWordInMatrix(_ board: [[Character]], _ word: String) -> Bool {

        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        var offset = 0
        let rows = board.count, cloumns = board[0].count
        for row in 0..<rows {
            for col in 0..<cloumns {
                if dfs(board, row, col, word, &offset, &visited) {
                    return true
                }
            }
        }
        return false
    }

    private func dfs(_ board: [[Character]], _ row: Int, _ col: Int, _ word: String, _ offset: inout Int, _ visited: inout [[Bool]]) -> Bool {
        if offset >= word.count {
            return true
        }
        if row < 0 || col < 0 || row > board.count - 1 || col > board[0].count - 1 || offset < 0 || visited[row][col] {
            return false
        }
        let char = word[word.index(word.startIndex, offsetBy: offset)]
        if char != board[row][col] {
            return false
        }

        offset += 1
        visited[row][col] = true
        let valid = dfs(board, row + 1, col, word, &offset, &visited) ||
        dfs(board, row - 1, col, word, &offset, &visited) ||
        dfs(board, row, col + 1, word, &offset, &visited) ||
        dfs(board, row , col - 1, word, &offset, &visited)

        if !valid {
            offset -= 1
            visited[row][col] = false
        }
        return valid
    }
}


extension Solution {

//    剑指Offer 面试题13：机器人的运动范围
//    https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
//    地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。
//    一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），
//    也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，
//    因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。
//    请问该机器人能够到达多少个格子？

    static var m: Int!
    static var n: Int!
    static var k: Int!
    static var visited: [[Bool]]!

    public func movingCountInMatrix(_ m: Int, _ n: Int, _ k: Int) -> Int {
        Solution.m = m
        Solution.n = n
        Solution.k = k
        Solution.visited = Array(repeating: Array(repeating: false, count: n), count:m)
        return dfs(0, 0, 0, 0)
    }

    fileprivate func dfs(_ row: Int, _ col: Int, _ rowSum: Int, _ colSum: Int) -> Int {
        if row < 0 || row >= Solution.m || col < 0 || col >= Solution.n || Solution.visited[row][col] || rowSum + colSum > Solution.k {
            return 0
        }

        Solution.visited[row][col] = true
        return 1 + dfs(row + 1, col, sum(row + 1), colSum) + dfs(row, col + 1, rowSum, sum(col + 1))
    }

    private func sum(_ num: Int) -> Int {
        var i = 0, num = num
        while num != 0 {
            i += num % 10
            num = num / 10
        }
        return i
    }
}
