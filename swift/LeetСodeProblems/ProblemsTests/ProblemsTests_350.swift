//
//  ProblemsTests_350.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

import XCTest
@testable import Problems

final class ProblemsTests_350: XCTestCase {
    // MARK: Problem 350. Intersection of Two Arrays II
    func testsProblem_350() throws {
        lazy var testsData_350: [(nums1: [Int], nums2: [Int], expected: [Int])] = {
            var testsData = [(nums1: [Int], nums2: [Int], expected: [Int])]()
            
            testsData.append((nums1: [1, 2, 2, 1], nums2: [2, 2], expected: [2, 2]))
            testsData.append((nums1: [4, 9, 5], nums2: [9, 4, 9, 8, 4], expected: [4, 9]))
            testsData.append((nums1: [9, 3, 7], nums2: [6, 4, 1, 0, 0, 4, 4, 8, 7], expected: [7]))
            
            return testsData
        }()
        
        for data in testsData_350 {
            let actual = Problems.problem_350_intersect(data.nums1, data.nums2).sorted { $0 < $1 }
            let actual2 = Problems.problem_350_intersect2(data.nums1, data.nums2).sorted { $0 < $1 }
            let actual3 = Problems.problem_350_intersect3(data.nums1, data.nums2).sorted { $0 < $1 }
            let actual4 = Problems.problem_350_intersect4(data.nums1, data.nums2).sorted { $0 < $1 }
            
            XCTAssertEqual(actual, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
            XCTAssertEqual(actual2, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
            XCTAssertEqual(actual3, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
            XCTAssertEqual(actual4, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
        }
    }
    
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
