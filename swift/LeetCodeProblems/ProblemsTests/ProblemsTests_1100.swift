//
//  ProblemsTests_1100.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

import XCTest

final class ProblemsTests_1100: XCTestCase {
    // MARK: Problem 1071. Greatest Common Divisor of Strings
    func testsProblem_1071() throws {
        typealias TestCase = (str1: String, str2: String, expected: String)
        
        lazy var testsData_1071: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((str1: "ABCABC", str2: "ABC", expected: "ABC"))
            testsData.append((str1: "ABABAB", str2: "ABAB", expected: "AB"))
            testsData.append((str1: "LEET", str2: "CODE", expected: ""))
            testsData.append((
                str1: "TAUXXTAUXXTAUXXTAUXXTAUXX",
                str2: "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX",
                expected: "TAUXX"
            ))
            
            return testsData
        }()
        
        
        for data in testsData_1071 {
            let message = "str1: '\(data.str1)'; str2: '\(data.str2)'"
            let actual = Problems.problem_1071_gcdOfStrings(data.str1, data.str2)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
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
