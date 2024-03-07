//
//  ProblemsTests_800.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class ProblemsTests_800: XCTestCase {
    
    // MARK: Problem 787. Cheapest Flights Within K Stops
    func testsProblem_787() throws {
        typealias TestCase = (n: Int, flights: [[Int]], src: Int, dst: Int, k: Int, expected: Int)
        
        lazy var testsData_787: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                n: 4, flights: [[0,1,100], [1,2,100], [2,0,100], [1,3,600], [2,3,200]],
                src: 0, dst: 3, k: 1, expected: 700
            ))
            testsData.append((
                n: 3, flights: [[0,1,100], [1,2,100], [0,2,500]],
                src: 0, dst: 2, k: 1, expected: 200
            ))
            testsData.append((
                n: 3, flights: [[0,1,100], [1,2,100], [0,2,500]],
                src: 0, dst: 2, k: 0, expected: 500))
            
            return testsData
        }()
        
        for data in testsData_787 {
            let message = "n: \(data.n); flights: \(data.flights); src: \(data.src); dst: \(data.dst); k: \(data.k)"
            let actual = Problems.problem_787_findCheapestPrice(data.n, data.flights, data.src, data.dst, data.k)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 771. Jewels and Stones
    func testsProblem_771() throws {
        typealias TestCase = (jewels: String, stones: String, expected: Int)
        lazy var testsData_771: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((jewels: "aA", stones: "aAAbbbb", expected: 3))
            testsData.append((jewels: "z", stones: "ZZ", expected: 0))
            
            return testsData
        }()
        
        for data in testsData_771 {
            let message = "jewels: '\(data.jewels)'; stones: '\(data.stones)'"
            let actual = Problems.problems_771_numJewelsInStones(data.jewels, data.stones)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 763. Partition Labels
    func testsProblem_763() throws {
        typealias TestCase = (s: String, expected: [Int])
        lazy var testsData_763: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((s: "ababcbacadefegdehijhklij", expected: [9, 7, 8]))
            testsData.append((s: "eccbbbbdec", expected: [10]))
            testsData.append((s: "eaaaabaaec", expected: [9, 1]))
            
            return testsData
        }()
        
        for data in testsData_763 {
            let message = "s: '\(data.s)'"
            let actual = Problems.problem_763_partitionLabels(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 707. Design Linked List
    func testsProblem_707() throws {
        let testsData_707 = ProblemsTestCases.testsData_707()
        
        for testCases in testsData_707 {
            let list = LinkedList(missedValue: -1)
            
            for data in testCases {
                let message = "command: '\(data.command)'; args: \(data.args)"
                var actual = 0
                
                switch data.command {
                    case "addAtHead":
                        list.addAtHead(data.args[0])
                    case "addAtTail":
                        list.addAtTail(data.args[0])
                    case "addAtIndex":
                        list.addAtIndex(data.args[0], data.args[1])
                    case "deleteAtIndex":
                        list.deleteAtIndex(data.args[0])
                    case "get":
                        actual = list.get(data.args[0])
                        XCTAssertEqual(actual, data.expected, message)
                    default:
                        break
                }
            }
        }
    }
    
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
