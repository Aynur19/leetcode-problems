//
//  ProblemsTests_2300.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 16.02.2024.
//

import XCTest

final class ProblemsTests_2300: XCTestCase {
    // MARK: Problem 2241. Design an ATM Machine
    func testsProblem_2241() throws {
        typealias TestCase = (command: String, banknotesCount: [Int], amount: Int, expected: [Int])
        
        lazy var testsData_933: [[TestCase]] = {
            var testsData = [[TestCase]]()
            
            testsData.append([
                (command: "ATM", banknotesCount: [], amount: 0, expected: []),
                (command: "deposit", banknotesCount: [0,0,1,2,1], amount: 0, expected: []),
                (command: "withdraw", banknotesCount: [], amount: 600, expected: [0,0,1,0,1]),
                (command: "deposit", banknotesCount: [0,1,0,1,1], amount: 0, expected: []),
                (command: "withdraw", banknotesCount: [], amount: 600, expected: [-1]),
                (command: "withdraw", banknotesCount: [], amount: 550, expected: [0,1,0,0,1])
            ])
            
            return testsData
        }()
        
        for testCaseIdx in 1...testsData_933.count {
            let atm = ATM()
            let data = testsData_933[testCaseIdx - 1]
            
            for testCase in data {
                let message = "command: '\(testCase.command)'; banknotesCount: \(testCase.banknotesCount); amount: \(testCase.amount)"
                
                switch testCase.command {
                    case "deposit":
                        atm.deposit(testCase.banknotesCount)
                    case "withdraw":
                        let actual = atm.withdraw(testCase.amount)
                        XCTAssertEqual(actual, testCase.expected, message)
                    default: break
                }
            }
        }
    }
    
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
