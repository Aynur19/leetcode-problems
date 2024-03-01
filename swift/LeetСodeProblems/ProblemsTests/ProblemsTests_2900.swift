//
//  ProblemsTests_2900.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 01.03.2024.
//

import XCTest

final class ProblemsTests_2900: XCTestCase {
    // MARK: Problem 2864. Maximum Odd Binary Number
    func testsProblem_2864() throws {
        typealias TestCase = (s: String, expected: String)
        
        lazy var testsData_2864: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((s: "010", expected: "001"))
            testsData.append((s: "0101", expected: "1001"))
            
            return testsData
        }()
        
        
        for data in testsData_2864 {
            let message = "s: \(data.s)"
            let actual = Problems.problem_2864_maximumOddBinaryNumber(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
