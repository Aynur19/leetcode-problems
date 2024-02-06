//
//  ProblemsTests_550.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

import XCTest

final class ProblemsTests_550: XCTestCase {
    // MARK: Problem 523. Continuous Subarray Sum
    func testsProblem_523() throws {
        lazy var testsData_523: [(nums: [Int], k: Int, expected: Bool)] = {
            var testsData = [(nums: [Int], k: Int, expected: Bool)]()
            
            testsData.append((nums: [23, 2, 4, 6, 7], k: 6, expected: true))
            testsData.append((nums: [23, 2, 6, 4, 7], k: 6, expected: true))
            testsData.append((nums: [23, 2, 6, 4, 7], k: 13, expected: false))
            testsData.append((nums: [2, 4, 3], k: 6, expected: true))
            
            return testsData
        }()
        
        for data in testsData_523 {
            let actual = Problems.problem_523_checkSubarraySum(data.nums, data.k)
            let actual2 = Problems.problem_523_checkSubarraySum2(data.nums, data.k)
            let actual3 = Problems.problem_523_checkSubarraySum3(data.nums, data.k)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); k: \(data.k)")
            XCTAssertEqual(actual2, data.expected, "nums: \(data.nums); k: \(data.k)")
            XCTAssertEqual(actual3, data.expected, "nums: \(data.nums); k: \(data.k)")
        }
    }
    
}
