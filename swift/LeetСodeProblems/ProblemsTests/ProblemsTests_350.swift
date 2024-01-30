//
//  ProblemsTests_350.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

import XCTest
@testable import Problems

final class ProblemsTests_350: XCTestCase {
    // MARK: Problem 347. Top K Frequent Elements
    func testsProblem_347() throws {
        lazy var testsData_347: [(nums: [Int], k: Int, expected: [Int])] = {
            var testsData = [(nums: [Int], k: Int, expected: [Int])]()
            
            testsData.append((nums: [1, 1, 1, 2, 2, 3], k: 2, expected: [1, 2]))
            testsData.append((nums: [1], k: 1, expected: [1]))
            
            return testsData
        }()
        
        for data in testsData_347 {
            let actual = Problems.problem_347_topKFrequent(data.nums, data.k).sorted { $0 < $1 }
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); k: \(data.k)")
        }
    }
    
    // MARK: Problem 341. Flatten Nested List Iterator
    func testsProblem_341() throws {
        lazy var testsData_341: [(nestedList: [NestedInteger], expected: [Int])] = {
            var testsData = [(nestedList: [NestedInteger], expected: [Int])]()
            
            testsData.append((
                nestedList: [
                    .init(integers: [.init(value: 1), .init(value: 1)]),
                    .init(value: 2),
                    .init(integers: [.init(value: 1), .init(value: 1)])
                ],
                expected: [1, 1, 2, 1, 1]
            ))
            testsData.append((
                nestedList: [
                    .init(value: 1),
                    .init(integers: [
                        .init(value: 4), .init(integers: [
                            .init(value: 6)
                        ])
                    ])
                ],
                expected: [1, 4, 6]
            ))
            
            return testsData
        }()
        
        var idx = 0
        for data in testsData_341 {
            idx += 1
            var nums = [Int]()
            let iterator = NestedIterator(data.nestedList)
            
            while iterator.hasNext() {
                nums.append(iterator.next())
            }
            
            XCTAssertEqual(nums, data.expected, "test case: \(idx)")
        }
    }
}
