//
//  PorblemsTests_800.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class PorblemsTests_800: XCTestCase {
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
