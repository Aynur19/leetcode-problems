//
//  ProblemsTests_400.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

import XCTest

final class ProblemsTests_400: XCTestCase {
    // MARK: Problem 374. Guess Number Higher or Lower
    func testsProblem_374() throws {
        lazy var testsData_374: [(n: Int, pick: Int, expected: Int)] = {
            var testsData = [(n: Int, pick: Int, expected: Int)]()
            
            testsData.append((n: 10, pick: 6, expected: 6))
            testsData.append((n: 1, pick: 1, expected: 1))
            testsData.append((n: 2, pick: 1, expected: 1))
            
            return testsData
        }()
        
        for data in testsData_374 {
            let guessGame = GuessGamePlayer(data.n, pick: data.pick)
            let actual = guessGame.guessNumber(data.n)
            
            XCTAssertEqual(actual, data.expected, "n: \(data.n); pick: \(data.pick)")
        }
    }
}
