//
//  ProblemsTests_1050.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

import XCTest

final class ProblemsTests_1050: XCTestCase {
    // MARK: Problem 1004. Max Consecutive Ones III
    func testsProblem_1004() throws {
        typealias TestCase = (nums: [Int], k: Int, expected: Int)
        
        lazy var testsData_1004: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums: [1,1,1,0,0,0,1,1,1,1,0], k: 2, expected: 6))
            testsData.append((nums: [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k: 3, expected: 10))
            
            return testsData
        }()
        
        
        for data in testsData_1004 {
            let message = "nums: \(data.nums); k: \(data.k)"
            let actual = Problems.problem_1004_longestOnes(data.nums, data.k)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
