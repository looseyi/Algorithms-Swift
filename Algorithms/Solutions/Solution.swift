//
//  Solution.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation

public class Solution {
	
	public init() {}

}

extension String {

    func index(offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }

    func char(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }

    func substring(from offset: Int) -> String {
        return String(suffix(from: index(startIndex, offsetBy: offset)))
    }
}
