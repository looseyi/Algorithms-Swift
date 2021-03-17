//
//  Solution.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

public class Solution {

    var pred: TreeNode?, x: TreeNode!, y: TreeNode!
	
	public init() {}

}

extension String {

    func index(_ offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }

    func char(offset: Int) -> Character {
        return self[index(offset)]
    }

    func substring(from offset: Int) -> String {
        return String(suffix(from: index(offset)))
    }

    func substring(from offset: Int, to end: Int) -> String {
        return String(self[index(offset)...index(end)])
    }
}

// 利用 swap 节省空间
func swap<T>(_ list: inout [T], _ i: Int, _ j: Int) {
    let tmp = list[i]
    list[i] = list[j]
    list[j] = tmp
}
