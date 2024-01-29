//
//  ProblemsTests_300.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

import XCTest
@testable import Problems

public final class ProblemsTests_300: XCTestCase {
    // MARK: Problem 283. Move Zeroes
    func testsProblem_283() throws {
        lazy var testsData_283: [(nums: [Int], expected: [Int])] = {
            var testsData = [(nums: [Int], expected: [Int])]()
            
            testsData.append((nums: [0, 1, 0, 3, 12], expected: [1, 3, 12, 0, 0]))
            testsData.append((nums: [0], expected: [0]))
            
            return testsData
        }()
        
        for data in testsData_283 {
            var nums = data.nums
            Problems.problem_283_moveZeroes(&nums)
            XCTAssertEqual(nums, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 279. Perfect Squares
    func testsProblem_279() throws {
        lazy var testsData_279: [(n: Int, expected: Int)] = {
            var testsData = [(n: Int, expected: Int)]()
            
            testsData.append((n: 12, expected: 3))
            testsData.append((n: 13, expected: 2))
            testsData.append((n: 1, expected: 1))
            
            return testsData
        }()
        
        for data in testsData_279 {
            let actual = Problems.problem_279_numSquares(data.n)
            XCTAssertEqual(actual, data.expected, "n: \(data.n)")
        }
    }
    
    // MARK: Problem 268. Missing Number
    func testsProblem_268() throws {
        lazy var testsData_268: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [3, 0, 1], expected: 2))
            testsData.append((nums: [0, 1], expected: 2))
            testsData.append((nums: [9, 6, 4, 2, 3, 5, 7, 0, 1], expected: 8))
            
            return testsData
        }()
        
        for data in testsData_268 {
            let actual = Problems.problem_268_missingNumber(data.nums)
            let actual2 = Problems.problem_268_missingNumber2(data.nums)
            let actual3 = Problems.problem_268_missingNumber3(data.nums)
            let actual4 = Problems.problem_268_missingNumber4(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual2, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual3, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual4, data.expected, "nums: \(data.nums)")
        }
    }
}
