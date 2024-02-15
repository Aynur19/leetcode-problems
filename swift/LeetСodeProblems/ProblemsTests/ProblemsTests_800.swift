//
//  ProblemsTests_800.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class ProblemsTests_800: XCTestCase {
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
}
