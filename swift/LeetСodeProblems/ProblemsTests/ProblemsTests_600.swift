//
//  ProblemsTests_600.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

import XCTest

final class ProblemsTests_600: XCTestCase {
    // MARK: Problem 581. Shortest Unsorted Continuous Subarray
    func testsProblem_581() throws {
        lazy var testsData_581: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [2,1,1,1,1], expected: 5))
            testsData.append((nums: [1,2,3,5,4], expected: 2))
            testsData.append((nums: [2,1,4,5,3], expected: 5))
            testsData.append((nums: [2,6,4,8,10,9,15], expected: 5))
            testsData.append((nums: [2,6,-4,8,10,9,15], expected: 6))
            testsData.append((nums: [2,6,-4,-8,10,9,15], expected: 6))
            testsData.append((nums: [1,2,3,4], expected: 0))
            testsData.append((nums: [1], expected: 0))
            testsData.append((nums: [1,3,2,2,2], expected: 4))
            
            return testsData
        }()
        
        for data in testsData_581 {
            let actual = Problems.problem_581_findUnsortedSubarray(data.nums)
            let actual2 = Problems.problem_581_findUnsortedSubarray2(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual2, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 567. Permutation in String
    func testsProblem_567() throws {
        lazy var testsData_567: [(s1: String, s2: String, expected: Bool)] = {
            var testsData = [(s1: String, s2: String, expected: Bool)]()
            
            testsData.append((s1: "ab", s2: "eidbaooo", expected: true))
            testsData.append((s1: "ab", s2: "eidboaoo", expected: false))
            testsData.append((s1: "adc", s2: "dcda", expected: true))
            
            return testsData
        }()
        
        for data in testsData_567 {
            let actual = Problems.problem_567_checkInclusion(data.s1, data.s2)
            let actual2 = Problems.problem_567_checkInclusion2(data.s1, data.s2)
            
            XCTAssertEqual(actual, data.expected, "s1: '\(data.s1)'; s2: '\(data.s2)'")
            XCTAssertEqual(actual2, data.expected, "s1: '\(data.s1)'; s2: '\(data.s2)'")
        }
    }
    
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
