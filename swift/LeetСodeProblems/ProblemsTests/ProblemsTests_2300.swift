//
//  ProblemsTests_2300.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 16.02.2024.
//

import XCTest

final class ProblemsTests_2300: XCTestCase {
    // MARK: Problem 2215. Find the Difference of Two Arrays
    func testsProblem_2215() throws {
        typealias TestCase = (nums1: [Int], nums2: [Int], expected: [[Int]])
        
        lazy var testsData_2215: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums1: [1,2,3], nums2: [2,4,6], expected: [[1,3],[4,6]]))
            testsData.append((nums1: [1,2,3,3], nums2: [1,1,2,2], expected: [[3],[]]))
            
            return testsData
        }()
        
        
        for data in testsData_2215 {
            let message = "nums1: \(data.nums1); nums2: \(data.nums2)"
            let actual = Problems.problem_2215_findDifference(data.nums1, data.nums2)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
