//
//  ProblemsTests_1500.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 17.02.2024.
//

import XCTest

final class ProblemsTests_1500: XCTestCase {
    // MARK: Problem 1450. Number of Students Doing Homework at a Given Time
    func testsProblem_1450() throws {
        typealias TestCase = (startTime: [Int], endTime: [Int], queryTime: Int, expected: Int)
        
        lazy var testsData_1450: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((startTime: [1,2,3], endTime: [3,2,7], queryTime: 4, expected: 1))
            testsData.append((startTime: [4], endTime: [4], queryTime: 4, expected: 1))
            
            return testsData
        }()
        
        
        for data in testsData_1450 {
            let message = "startTime: \(data.startTime); endTime: \(data.endTime); queryTime: \(data.queryTime)"
            let actual = Problems.problem_1450_busyStudent(data.startTime, data.endTime, data.queryTime)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 1446. Consecutive Characters
    func testsProblem_1446() throws {
        typealias TestCase = (s: String, expected: Int)
        
        lazy var testsData_1446: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((s: "leetcode", expected: 2))
            testsData.append((s: "abbcccddddeeeeedcba", expected: 5))
            testsData.append((s: "j", expected: 1))
            testsData.append((s: "cc", expected: 2))
            
            return testsData
        }()
        
        
        for data in testsData_1446 {
            let message = "s: '\(data.s)'"
            let actual = Problems.problem_1446_maxPower(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
