//
//  ProblemsTests_100.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 27.01.2024.
//

import XCTest
@testable import Problems

public final class ProblemsTests_100: XCTestCase {
    // MARK: Problem 53. Maximum Subarray
    func testsProblem_53() throws {
        lazy var testsData_53: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [-2, 1, -3, 4, -1, 2, 1, -5, 4], expected: 6))
            testsData.append((nums: [1], expected: 1))
            testsData.append((nums: [5, 4, -1, 7, 8], expected: 23))
            
            return testsData
        }()
        
        for data in testsData_53 {
            let actual = Problems.problem_53_maxSubArray(data.nums)
            let actual2 = Problems.problem_53_maxSubArray2(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual2, data.expected, "nums: \(data.nums)")
        }
    }
}
