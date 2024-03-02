//
//  ProblemsTests_1700.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 03.03.2024.
//

import XCTest

final class ProblemsTests_1700: XCTestCase {
    // MARK: Problem 1609. Even Odd Tree
    func testsProblem_1609() throws {
        typealias TestCase = (root: TreeNode?, expected: Bool)
        
        lazy var testsData_1609: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                root:
                        .init(1,
                              .init(10,
                                    .init(3, .init(12), .init(8))
                              ),
                              .init(4,
                                    .init(7, .init(6)),
                                    .init(9, nil, .init(2))
                              )
                        ),
                expected: true
            ))
            testsData.append((
                root:
                        .init(5,
                              .init(4, .init(3), .init(3)),
                              .init(2, .init(7))
                        ),
                expected: false
            ))
            testsData.append((
                root:
                        .init(5,
                              .init(9, .init(3), .init(5)),
                              .init(1, .init(7))
                        ),
                expected: false
            ))
            
            return testsData
        }()
        
        
        for idx in testsData_1609.indices {
            let message = "testCase: \(idx + 1)"
            let data = testsData_1609[idx]
            let actual = Problems.problem_1609_isEvenOddTree(data.root)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
