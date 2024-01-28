//
//  ProblemsTests_250.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

import XCTest
@testable import Problems

extension ProblemsTests {
    // MARK: Problem 205. Isomorphic Strings
    func testsProblem_205() throws {
        lazy var testsData_205: [(s: String, t: String, expected: Bool)] = {
            var testsData = [(s: String, t: String, expected: Bool)]()
            
            testsData.append((s: "egg", t: "add", expected: true))
            testsData.append((s: "foo", t: "bar", expected: false))
            testsData.append((s: "paper", t: "title", expected: true))
            testsData.append((s: "bads", t: "baba", expected: false ))
            
            return testsData
        }()
        
        for data in testsData_205 {
            let actual = Problems.problem_205_isIsomorphic(data.s, data.t)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; t: '\(data.t)'")
        }
    }
}
