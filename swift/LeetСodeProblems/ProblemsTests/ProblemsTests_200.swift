//
//  ProblemsTests.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 27.01.2024.
//

import XCTest
@testable import Problems

extension ProblemsTests {
    // MARK: Problem 200. Number of Islands
        func testsProblem_200() throws {
        lazy var testsData_200: [(grid: [[Character]], expected: Int)] = {
            var testsData = [(grid: [[Character]], expected: Int)]()
            
            testsData.append((
                grid: [["1","1","1","1","0"],
                       ["1","1","0","1","0"],
                       ["1","1","0","0","0"],
                       ["0","0","0","0","0"]],
                expected: 1
            ))
            testsData.append((
                grid: [["1","1","0","0","0"],
                       ["1","1","0","0","0"],
                       ["0","0","1","0","0"],
                       ["0","0","0","1","1"]],
                expected: 3
            ))

            return testsData
        }()
        
        for data in testsData_200 {
            let actual = Problems.problem_200_numIslands(data.grid)
            
            XCTAssertEqual(actual, data.expected, "grid: \(data.grid)")
        }
    }
    
    // MARK: Problem 167. Two Sum II - Input Array Is Sorted
    func testsProblem_167() throws {
        lazy var testsData_167: [(nums: [Int], target: Int, expected: [Int])] = {
            var testsData = [(nums: [Int], target: Int, expected: [Int])]()
            
            testsData.append((nums: [2, 7, 11, 15], target: 9, expected: [1, 2]))
            testsData.append((nums: [2, 3, 4], target: 6, expected: [1, 3]))
            testsData.append((nums: [-1, 0], target: -1, expected: [1, 2]))

            return testsData
        }()
        
        for data in testsData_167 {
            let actual = Problems.problem_167_twoSum(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 153. Find Minimum in Rotated Sorted Array
    func testsProblem_153() throws {
        lazy var testsData_153: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [3, 4, 5, 1, 2], expected: 1))
            testsData.append((nums: [4, 5, 6, 7, 0, 1, 2], expected: 0))
            testsData.append((nums: [11, 13, 15, 17], expected: 11))
            testsData.append((nums: [200, 13, 15, 17], expected: 13))
            testsData.append((nums: [11, 13, 15, 1], expected: 1))

            return testsData
        }()
        
        for data in testsData_153 {
            let actual = Problems.problem_153_findMin(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
        }
    }
}
