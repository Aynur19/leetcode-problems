//
//  ProblemsTests_1000.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

import XCTest

final class ProblemsTests_1000: XCTestCase {
    // MARK: Problem 986. Interval List Intersections
    func testsProblem_986() throws {
        typealias TestCase = (firstList: [[Int]], secondList: [[Int]], expected: [[Int]])
        
        lazy var testsData_986: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                firstList: [[0,2],[5,10],[13,23],[24,25]],
                secondList: [[1,5],[8,12],[15,24],[25,26]],
                expected: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
            ))
            testsData.append((firstList: [[1,3],[5,9]], secondList: [], expected: []))
            
            return testsData
        }()
        
        
        for data in testsData_986 {
            let message = "firstList: \(data.firstList); secondList: \(data.secondList)"
            let actual = Problems.problem_986_intervalIntersection(data.firstList, data.secondList)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 977. Squares of a Sorted Array
    func testsProblem_977() throws {
        typealias TestCase = (nums: [Int], expected: [Int])
        
        lazy var testsData_977: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums: [-4,-1,0,3,10], expected: [0,1,9,16,100]))
            testsData.append((nums: [-7,-3,2,3,11], expected: [4,9,9,49,121]))
            
            return testsData
        }()
        
        
        for data in testsData_977 {
            let message = "nums: \(data.nums)"
            let actual = Problems.problem_977_sortedSquares(data.nums)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 974. Subarray Sums Divisible by K
    func testsProblem_974() throws {
        typealias TestCase = (nums: [Int], k: Int, expected: Int)
        
        lazy var testsData_974: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((nums:  [4,5,0,-2,-3,1], k: 5, expected: 7))
            testsData.append((nums: [5], k: 9, expected: 0))
            testsData.append((nums: [-1,2,9], k: 2, expected: 2))
            testsData.append((nums: [2,-2,2,-4], k: 6, expected: 2))
            
            return testsData
        }()
        
        
        for data in testsData_974 {
            let message = "nums: \(data.nums); k: \(data.k)"
            let actual = Problems.problems_974_subarraysDivByK(data.nums, data.k)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}

