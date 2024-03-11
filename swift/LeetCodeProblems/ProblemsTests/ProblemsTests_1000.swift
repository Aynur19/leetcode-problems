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
    
    // MARK: Problem 948. Bag of Tokens
    func testsProblem_948() throws {
        typealias TestCase = (tokens: [Int], power: Int, expected: Int)
        
        lazy var testsData_948: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((tokens: [100], power: 50, expected: 0))
            testsData.append((tokens: [200,100], power: 150, expected: 1))
            testsData.append((tokens: [100,200,300,400], power: 200, expected: 2))
            
            return testsData
        }()
        
        for data in testsData_948 {
            let message = "tokens: \(data.tokens); power: \(data.power)"
            let actual = Problems.problem_948_bagOfTokensScore(data.tokens, data.power)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 938. Range Sum of BST
    func testsProblem_938() throws {
        typealias TestCase = (root: TreeNode?, low: Int, high: Int, expected: Int)
        
        lazy var testsData_938: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                root: .init(10, .init(5, .init(3), .init(7)), .init(15, nil, .init(18))),
                low: 7, high: 15, expected: 32
            ))
            testsData.append((
                root: .init(10,
                    .init(5, .init(3, .init(1), nil), .init(7, .init(6), nil)),
                            .init(15, .init(13), .init(18))),
                low: 6, high: 10, expected: 23
            ))
            
            return testsData
        }()
        
        
        for testCaseIdx in 1...testsData_938.count {
            let data = testsData_938[testCaseIdx - 1]
            let message = "idx: '\(testCaseIdx)'; low: \(data.low); high: \(data.high)"
            let actual = Problems.problem_938_rangeSumBST(data.root, data.low, data.high)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 933. Number of Recent Calls
//    func testsProblem_933() throws {
//        typealias TestCase = (command: String, t: Int, expected: Int)
//        
//        lazy var testsData_933: [[TestCase]] = {
//            var testsData = [[TestCase]]()
//            
//            testsData.append([
//                (command: "RecentCounter", t: 0, expected: 0),
//                (command: "ping", t: 1, expected: 1),
//                (command: "ping", t: 100, expected: 2),
//                (command: "ping", t: 3001, expected: 3),
//                (command: "ping", t: 3002, expected: 3)
//            ])
//            
//            return testsData
//        }()
//        
//        let implementations: [RecentCounterProtocol] = [RecentCounter1(), RecentCounter2(), RecentCounter3()]
//        
//        for implIdx in implementations.indices {
//            for testCaseIdx in 1...testsData_933.count {
//                let impl = implementations[implIdx]
//                let data = testsData_933[testCaseIdx - 1]
//                
//                for testCase in data {
//                    let message = "impl: \(implIdx + 1); command: '\(testCase.command)'; t: \(testCase.t)"
//                    
//                    switch testCase.command {
//                        case "ping":
//                            XCTAssertEqual(impl.ping(testCase.t), testCase.expected, message)
//                        default:break
//                    }
//                }
//            }
//        }
//    }
}

