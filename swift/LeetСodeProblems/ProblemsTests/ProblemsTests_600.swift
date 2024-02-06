//
//  ProblemsTests_600.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

import XCTest

final class ProblemsTests_600: XCTestCase {
    // MARK: Problem 560. Subarray Sum Equals K
    func testsProblem_560() throws {
        lazy var testsData_560: [(nums: [Int], k: Int, expected: Int)] = {
            var testsData = [(nums: [Int], k: Int, expected: Int)]()
            
            testsData.append((nums: [1, 1, 1], k: 2, expected: 2))
            testsData.append((nums: [1, 2, 3], k: 3, expected: 2))
            testsData.append((nums: [-1, -1, 1], k: 0, expected: 1))
            
            return testsData
        }()
        
        for data in testsData_560 {
            let actual = Problems.problem_560_subarraySum(data.nums, data.k)
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); k: \(data.k)")
        }
    }
    
    // MARK: Problem 557. Reverse Words in a String III
    func testsProblem_557() throws {
        lazy var testsData_557: [(s: String, expected: String)] = {
            var testsData = [(s: String, expected: String)]()
            
            testsData.append((
                s: "Let's take LeetCode contest",
                expected: "s'teL ekat edoCteeL tsetnoc"
            ))
            testsData.append((s: "Mr Ding", expected: "rM gniD"))
            
            return testsData
        }()
        
        for data in testsData_557 {
            let actual = Problems.problem_557_reverseWords(data.s)
            let actual2 = Problems.problem_557_reverseWords2(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'")
        }
    }
}
