//
//  ProblemsTests_950.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class ProblemsTests_950: XCTestCase {// MARK: Problem 380. Insert Delete GetRandom O(1)
    // MARK: Problem 933. Number of Recent Calls
    func testsProblem_933() throws {
        typealias TestCase = (command: String, t: Int, expected: Int)
        
        lazy var testsData_933: [[TestCase]] = {
            var testsData = [[TestCase]]()
            
            testsData.append([
                (command: "RecentCounter", t: 0, expected: 0),
                (command: "ping", t: 1, expected: 1),
                (command: "ping", t: 100, expected: 2),
                (command: "ping", t: 3001, expected: 3),
                (command: "ping", t: 3002, expected: 3)
            ])
            
            return testsData
        }()
        
        let implementations: [RecentCounterProtocol] = [RecentCounter1(), RecentCounter2(), RecentCounter3()]
        
        for implIdx in implementations.indices {
            for testCaseIdx in 1...testsData_933.count {
                let impl = implementations[implIdx]
                let data = testsData_933[testCaseIdx - 1]
                
                for testCase in data {
                    let message = "impl: \(implIdx + 1); command: '\(testCase.command)'; t: \(testCase.t)"
                    
                    switch testCase.command {
                        case "ping":
                            XCTAssertEqual(impl.ping(testCase.t), testCase.expected, message)
                        default:break
                    }
                }
            }
        }
    }
}
