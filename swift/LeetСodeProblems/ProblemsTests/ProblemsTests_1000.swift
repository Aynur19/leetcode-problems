//
//  ProblemsTests_1000.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

import XCTest

final class ProblemsTests_1000: XCTestCase {
    // MARK: Problem 974. Subarray Sums Divisible by K
    func testsProblem_974() throws {
        typealias TestCase = (nums: [Int], k: Int, expected: Int)
        
        lazy var testsData_974: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums:  [4,5,0,-2,-3,1], k: 5, expected: 7))
            testsData.append((nums: [5], k: 9, expected: 0))
            testsData.append((nums: [-1,2,9], k: 2, expected: 2))
            testsData.append((nums: [2,-2,2,-4], k: 6, expected: 2))
            
            /// 2   -2   2   -4
            /// 2    0   2   -2
            /// 2    0   2   -2
            /// 2    2   4    2
            /// 1 (2) + 1 (0)
            ///
            /// -1   2   9
            /// -1   1  10
            /// -1   1    0
            ///
            
            return testsData
        }()
        
        
        for data in testsData_974 {
            let message = "nums: \(data.nums); k: \(data.k)"
            let actual = Problems.problems_974_subarraysDivByK(data.nums, data.k)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}

