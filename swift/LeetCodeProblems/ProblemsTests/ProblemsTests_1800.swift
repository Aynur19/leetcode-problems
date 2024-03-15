//
//  ProblemsTests_1800.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 02.03.2024.
//

import XCTest

final class ProblemsTests_1800: XCTestCase {
    // MARK: Problem 1768. Merge Strings Alternately
    func testsProblem_1768() throws {
        typealias TestCase = (word1: String, word2: String, expected: String)
        
        lazy var testsData_1768: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((word1: "abc", word2: "pqr", expected: "apbqcr"))
            testsData.append((word1: "ab", word2: "pqrs", expected: "apbqrs"))
            testsData.append((word1: "abcd", word2: "pq", expected: "apbqcd"))
            
            return testsData
        }()
        
        
        for data in testsData_1768 {
            let message = "word1: \(data.word1); word2: \(data.word2)"
            let actual = Problems.problem_1768_mergeAlternately(data.word1, data.word2)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: Problem 1750. Minimum Length of String After Deleting Similar Ends
    func testsProblem_1750() throws {
        let testsData = ProblemsTestCases.testsData_1750()
        let problems = Problems()
        
        for data in testsData {
            let message = "s: '\(data.s)'"
            let actual = problems.problem_1750_minimumLength(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
