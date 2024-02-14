//
//  ProblemsTests_750.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class ProblemsTests_750: XCTestCase {
    // MARK: Problem 704. Binary Search
    func testsProblem_704() throws {
        typealias TestCase = (nums: [Int], target: Int, expected: Int)
        lazy var testsData_704: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums: [-1,0,3,5,9,12], target: 9, expected: 4))
            testsData.append((nums: [-1,0,3,5,9,12], target: 2, expected: -1))
            testsData.append((nums: [-1,-1,0,3,5,9,12], target: -1, expected: 0))
            
            return testsData
        }()
        
        for data in testsData_704 {
            let message = "nums: \(data.nums); target: \(data.target)"
            let actual = Problems.problems_704_search(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
