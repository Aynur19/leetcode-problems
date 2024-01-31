//
//  ProblemsTests_450.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

import XCTest

final class ProblemsTests_450: XCTestCase {
    // MARK: Problem 404. Sum of Left Leaves
    func testsProblem_404() throws {
        lazy var testsData_404: [(root: TreeNode?, expected: Int)] = {
            var testsData = [(root: TreeNode?, expected: Int)]()
            
            testsData.append((
                root: .init(3, .init(9), .init(20, .init(15), .init(7))),
                expected: 24
            ))
            testsData.append((
                root: .init(1),
                expected: 0
            ))
            testsData.append((
                root: .init(0, 
                    .init(2, .init(1, .init(5), .init(1)), nil),
                    .init(4, .init(3, nil, .init(6)), .init(-1, nil, .init(8)))
                ),
                expected: 5
            ))
            
            return testsData
        }()
        
        var testCase = 0
        for data in testsData_404 {
            testCase += 1
            let actual = Problems.problem_404_sumOfLeftLeaves(data.root)
            let actual2 = Problems.problem_404_sumOfLeftLeaves2(data.root)
            let actual3 = Problems.problem_404_sumOfLeftLeaves3(data.root)
            
            XCTAssertEqual(actual, data.expected, "testCase: \(testCase)")
            XCTAssertEqual(actual2, data.expected, "testCase: \(testCase)")
            XCTAssertEqual(actual3, data.expected, "testCase: \(testCase)")
        }
    }
    
}
