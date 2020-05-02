//
//  BaseTest.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/5/1.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest
import Algorithms


public class BaseTest: XCTestCase {
    var solution: Solution!

    public override func setUp() {
        super.setUp()
        solution = Solution()
    }
}
