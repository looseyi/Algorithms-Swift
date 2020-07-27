//
//  Matrix.swift
//  AlgorithmsTests
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import XCTest

class existWordInMatrixInPartiallySortedMatrix: BaseTest {

	let matrix = [[1, 2, 8, 9],
				  [2, 4, 9, 12],
				  [4, 7, 10, 13],
				  [6, 8, 11, 15]]
	
	// 查找的数在数组中
	func testCateInMatrix() {
		XCTAssertTrue(solution.findInPartiallySorted(matrix, num: 7))
	}
	
	// 要查找的数不在数组中
	func testCateNotInMatrix() {
		XCTAssertFalse(solution.findInPartiallySorted(matrix, num: 5))
	}
	
	// 要查找的数是数组中最小的数字
	func testCateMiniumInMatrix() {
		XCTAssertTrue(solution.findInPartiallySorted(matrix, num: 1))
	}
	
	// 要查找的数是数组中最大的数字
	func testCateMaxiumInMatrix() {
		XCTAssertTrue(solution.findInPartiallySorted(matrix, num: 15))
	}

	// 要查找的数比数组中最小的还要小
	func testCateSmallerThenNumsINMatrix() {
		XCTAssertFalse(solution.findInPartiallySorted(matrix, num: 0))
	}

	// 要查找的数比数组中最大的还要大
	func testCateBiggerThenNumsINMatrix() {
		XCTAssertFalse(solution.findInPartiallySorted(matrix, num: 16))
	}
}


class FindStringPathInMartrix : BaseTest {
    //ABTG
    //CFCS
    //JDEH
    func testCase1() {
        let str = "BFCE"
        let matrix: [[Character]] = [["A","B","T","G"],
                                     ["C","F","C","S"],
                                     ["J","D","E","H"]]
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }
    //ABCE
    //SFCS
    //ADEE
    func testCase2() {
        let matrix: [[Character]] = [["A","B","C","E"],
                                     ["S","F","C","S"],
                                     ["A","D","E","E"]]
        let str = "SEE"
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }
    //ABTG
    //CFCS
    //JDEH
    func testCase3() {
        let matrix: [[Character]] = [["A","B","T","G"],
                                     ["C","F","C","S"],
                                     ["J","D","E","H"]]
        let str = "ABFB"
        XCTAssertFalse(solution.existWordInMatrix(matrix, str))
    }

    //ABCEHJIG
    //SFCSLOPQ
    //ADEEMNOE
    //ADIDEJFM
    //VCEIFGGS
    func testCase4() {
        let matrix: [[Character]] = [["A","B","C","E","H","J","I","G"],
                                     ["S","F","C","S","L","O","P","Q"],
                                     ["A","D","E","E","M","N","O","E"],
                                     ["A","D","I","D","E","J","F","M"],
                                     ["V","C","E","I","F","G","G","S"]]
        let str = "SLHECCEIDEJFGGFIE"
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }

    //ABCEHJIG
    //SFCSLOPQ
    //ADEEMNOE
    //ADIDEJFM
    //VCEIFGGS
    func testCase5() {
        let matrix: [[Character]] = [["A","B","C","E","H","J","I","G"],
                                     ["S","F","C","S","L","O","P","Q"],
                                     ["A","D","E","E","M","N","O","E"],
                                     ["A","D","I","D","E","J","F","M"],
                                     ["V","C","E","I","F","G","G","S"]]
        let str = "SGGFIECVAASABCEHJIGQEM"
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }
    //ABCEHJIG
    //SFCSLOPQ
    //ADEEMNOE
    //ADIDEJFM
    //VCEIFGGS
    func testCase6() {
        let matrix: [[Character]] = [["A","B","C","E","H","J","I","G"],
                                     ["S","F","C","S","L","O","P","Q"],
                                     ["A","D","E","E","M","N","O","E"],
                                     ["A","D","I","D","E","J","F","M"],
                                     ["V","C","E","I","F","G","G","S"]]
        let str = "SGGFIECVAASABCEEJIGOEM"
        XCTAssertFalse(solution.existWordInMatrix(matrix, str))
    }

    //ABCEHJIG
    //SFCSLOPQ
    //ADEEMNOE
    //ADIDEJFM
    //VCEIFGGS
    func testCase7() {
        let matrix: [[Character]] = [["A","B","C","E","H","J","I","G"],
                                     ["S","F","C","S","L","O","P","Q"],
                                     ["A","D","E","E","M","N","O","E"],
                                     ["A","D","I","D","E","J","F","M"],
                                     ["V","C","E","I","F","G","G","S"]]
        let str = "SGGFIECVAASABCEHJIGQEMS"
        XCTAssertFalse(solution.existWordInMatrix(matrix, str))
    }

    //AAAA
    //AAAA
    //AAAA
    func testCase8() {
        let matrix: [[Character]] = [["A","A","A","A"],
                                     ["A","A","A","A"],
                                     ["A","A","A","A"]]
        let str = "AAAAAAAAAAAA" //12
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }

    //AAAA
    //AAAA
    //AAAA
    func testCase9() {
        let matrix: [[Character]] = [["A","A","A","A"],
                                     ["A","A","A","A"],
                                     ["A","A","A","A"]]
        let str = "AAAAAAAAAAAAA" //13
        XCTAssertFalse(solution.existWordInMatrix(matrix, str))
    }

    func testCase10() {
        let matrix: [[Character]] = [["A"]]
        let str = "A"
        XCTAssertTrue(solution.existWordInMatrix(matrix, str))
    }

    func testCase11() {
        let matrix: [[Character]] = [["A"]]
        let str = "B"
        XCTAssertFalse(solution.existWordInMatrix(matrix, str))
    }
}


class RobotMove: BaseTest {

    //10行10列 k为5
    func testCase1() {
        XCTAssertEqual(solution.movingCountInMatrix(10, 10, 5), 21)
    }
    //20行20列 k为15
    func testCase2() {
        XCTAssertEqual(solution.movingCountInMatrix(20, 20, 15), 359)
    }

    //1行100列 k为10
    func testCase3() {
        XCTAssertEqual(solution.movingCountInMatrix(1, 100, 10), 29)
    }
    //1行10列 k为10
    func testCase4() {
        XCTAssertEqual(solution.movingCountInMatrix(1, 10, 10), 10)
    }

    //10行1列 k为15
    func testCase5() {
        XCTAssertEqual(solution.movingCountInMatrix(100, 1, 15), 79)
    }
    //100行1列 k为15
    func testCase6() {
        XCTAssertEqual(solution.movingCountInMatrix(10, 1, 15), 10)
    }

    //1行1列 k为1
    func testCase7() {
        XCTAssertEqual(solution.movingCountInMatrix(1, 1, 15), 1)
    }
    //1行1列 k为1
    func testCase8() {
        XCTAssertEqual(solution.movingCountInMatrix(1, 1, 0), 1)
    }
    //10行10列 k为负数
    func testCase9() {
        XCTAssertEqual(solution.movingCountInMatrix(10, 10, -1), 0)
    }
}


class spiralOrder: BaseTest {
    /*
     1
     */
    func testCase1() {
        let matrix:[[Int]] = [[1]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1])
    }
    /*
     1 2
     3 4
     */
    func testCase2() {
        let matrix:[[Int]] = [[1,2],
                              [3,4]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,4,3])
    }
    /*
     1  2  3  4
     5  6  7  8
     9 10 11 12
     13 14 15 16
     */
    func testCase3() {
        let matrix:[[Int]] = [[1,2,3,4],
                              [5,6,7,8],
                              [9,10,11,12],
                              [13,14,15,16]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10])
    }
    /*
     1  2  3  4  5
     6  7  8  9 10
     11 12 13 14 15
     16 17 18 19 20
     21 22 23 24 25
     */
    func testCase4() {
        let matrix:[[Int]] = [[1,2,3,4,5],
                              [6,7,8,9,10],
                              [11,12,13,14,15],
                              [16,17,18,19,20],
                              [21,22,23,24,25]]
        XCTAssertTrue(solution.spiralOrder(matrix) ==
            [1,2,3,4,5,10,15,20,25,24,23,22,21,16,11,6,7,8,9,14,19,18,17,12,13])
    }
    /*
     1
     2
     3
     4
     5
     */
    func testCase5() {
        let matrix:[[Int]] = [[1],[2],[3],[4],[5]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,5])
    }

    /*
     1    2
     3    4
     5    6
     7    8
     9    10
     */
    func testCase6() {
        let matrix:[[Int]] = [[1,2],[3,4],[5,6],[7,8],[9,10]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,4,6,8,10,9,7,5,3])
    }
    /*
     1    2    3
     4    5    6
     7    8    9
     10   11   12
     13   14   15
     */
    func testCase7() {
        let matrix:[[Int]] = [[1,2,3],
                              [4,5,6],
                              [7,8,9],
                              [10,11,12],
                              [13,14,15]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,6,9,12,15,14,13,10,7,4,5,8,11])
    }
    /*
     1    2    3    4
     5    6    7    8
     9    10   11   12
     13   14   15   16
     17   18   19   20
     */
    func testCase8() {
        let matrix:[[Int]] = [[1,2,3,4],
                              [5,6,7,8],
                              [9,10,11,12],
                              [13,14,15,16],
                              [17,18,19,20]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,8,12,16,20,19,18,17,13,9,5,6,7,11,15,14,10])
    }
    /*
     1    2    3    4    5
     */
    func testCase9() {
        let matrix:[[Int]] = [[1,2,3,4,5]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,5])
    }
    /*
     1    2    3    4    5
     6    7    8    9    10
     */
    func testCase10() {
        let matrix:[[Int]] = [[1,2,3,4,5],
                              [6,7,8,9,10]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,5,10,9,8,7,6])
    }

    /*
     1    2    3    4    5
     6    7    8    9    10
     11   12   13   14    15
     */
    func testCase11() {
        let matrix:[[Int]] = [[1,2,3,4,5],
                              [6,7,8,9,10],
                              [11,12,13,14,15]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,5,10,15,14,13,12,11,6,7,8,9])
    }
    /*
     1    2    3    4    5
     6    7    8    9    10
     11   12   13   14   15
     16   17   18   19   20
     */
    func testCase12() {
        let matrix:[[Int]] = [[1,2,3,4,5],
                              [6,7,8,9,10],
                              [11,12,13,14,15],
                              [16,17,18,19,20]]
        XCTAssertTrue(solution.spiralOrder(matrix) == [1,2,3,4,5,10,15,20,19,18,17,16,11,6,7,8,9,14,13,12])
    }
}

