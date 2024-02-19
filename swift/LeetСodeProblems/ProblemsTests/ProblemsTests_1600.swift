//
//  ProblemsTests_1600.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 19.02.2024.
//

import XCTest

final class ProblemsTests_1600: XCTestCase {
    // MARK: Problem 1572. Matrix Diagonal Sum
    func testsProblem_1572() throws {
        typealias TestCase = (nums: [[Int]], expected: Int)
        
        lazy var testsData_1572: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                nums: [[1,2,3],
                       [4,5,6],
                       [7,8,9]],
                expected: 25
            ))
            testsData.append((
                nums: [[1,1,1,1],
                       [1,1,1,1],
                       [1,1,1,1],
                       [1,1,1,1]],
                expected: 8
            ))
            
            return testsData
        }()
        
        
        for data in testsData_1572 {
            let message = "nums: \(data.nums)"
            let actual = Problems.problem_1572_diagonalSum(data.nums)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
