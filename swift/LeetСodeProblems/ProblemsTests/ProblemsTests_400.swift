//
//  ProblemsTests_400.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

import XCTest

final class ProblemsTests_400: XCTestCase {
    // MARK: Problem 392. Is Subsequence
    func testsProblem_392() throws {
        lazy var testsData_392: [(s: String, t: String, expected: Bool)] = {
            var testsData = [(s: String, t: String, expected: Bool)]()
            
            testsData.append((s: "abc", t: "ahbgdc", expected: true))
            testsData.append((s: "axc", t: "ahbgdc", expected: false))
            testsData.append((s: "", t: "ahbgdc", expected: true))
            
            return testsData
        }()
        
        for data in testsData_392 {
            let actual = Problems.problem_392_isSubsequence(data.s, data.t)
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; t: '\(data.t)'")
        }
    }
    
    // MARK: Problem 387. First Unique Character in a String
    func testsProblem_387() throws {
        lazy var testsData_387: [(s: String, expected: Int)] = {
            var testsData = [(s: String, expected: Int)]()
            
            testsData.append((s: "leetcode", expected: 0))
            testsData.append((s: "loveleetcode", expected: 2))
            testsData.append((s: "aabb", expected: -1))
            
            return testsData
        }()
        
        for data in testsData_387 {
            let actual = Problems.problem_387_firstUniqChar(data.s)
            let actual2 = Problems.problem_387_firstUniqChar2(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 380. Insert Delete GetRandom O(1)
    func testsProblem_380() throws {
        struct TestData {
            let command: String
            let value: Int
            let isInserted: Bool
            let isRemoved: Bool
            let randomVal: [Int]
            
            init(
                _ command: String = "insert",
                _ value: Int = 0,
                isInserted: Bool = false,
                isRemoved: Bool = false,
                randomVal: [Int] = []
            ) {
                self.command = command
                self.value = value
                self.isInserted = isInserted
                self.isRemoved = isRemoved
                self.randomVal = randomVal
            }
        }
        
        lazy var testsData_380: [[TestData]] = {
            var testsData = [[TestData]]()
            
            testsData.append([
                .init("RandomizedSet"),
                .init("insert", 1, isInserted: true),
                .init("remove", 2, isRemoved: false),
                .init("insert", 2, isInserted: true),
                .init("getRandom", randomVal: [1, 2]),
                .init("remove", 1, isRemoved: true),
                .init("insert", 2, isInserted: false),
                .init("getRandom", randomVal: [2])
            ])
            testsData.append([
                .init("RandomizedSet"),
                .init("insert", 3, isInserted: true),
                .init("insert", 3, isInserted: false),
                .init("getRandom", randomVal: [3]),
                .init("getRandom", randomVal: [3]),
                .init("insert", 1, isInserted: true),
                .init("remove", 3, isRemoved: true),
                .init("getRandom", randomVal: [1]),
                .init("getRandom", randomVal: [1]),
                .init("insert", 0, isInserted: true),
                .init("remove", 0, isRemoved: true),
            ])
            testsData.append([
                .init("RandomizedSet"),
                .init("remove", 0, isRemoved: false),
                .init("remove", 0, isRemoved: false),
                .init("insert", 0, isInserted: true),
                .init("getRandom", randomVal: [0]),
                .init("remove", 0, isRemoved: true),
                .init("insert", 0, isInserted: true)
            ])
            testsData.append([
                .init("RandomizedSet"),
                .init("insert", -7, isInserted: true),
                .init("getRandom", randomVal: [-7]),
                .init("getRandom", randomVal: [-7]),
                .init("getRandom", randomVal: [-7]),
                .init("insert", 6, isInserted: true),
                .init("insert", 7, isInserted: true),
                .init("insert", 10, isInserted: true),
                .init("insert", 3, isInserted: true),
                .init("insert", 8, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8]),
                .init("insert", -8, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8]),
                .init("insert", 6, isInserted: false),
                .init("insert", -8, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8]),
                .init("remove", 2, isRemoved: false),
                .init("insert", 2, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2]),
                .init("insert", 5, isInserted: true),
                .init("remove", -5, isRemoved: false),
                .init("remove", -8, isRemoved: true),
                .init("insert", -8, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5]),
                .init("insert", -4, isInserted: true),
                .init("insert", 10, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, -4]),
                .init("remove", 7, isRemoved: true),
                .init("remove", -1, isRemoved: false),
                .init("insert", 8, isInserted: false),
                .init("remove", -6, isRemoved: false),
                .init("getRandom", randomVal: [-7, 6, 10, 3, 8, -8, 2, 5, -4]),
                .init("getRandom", randomVal: [-7, 6, 10, 3, 8, -8, 2, 5, -4]),
                .init("remove", 9, isRemoved: false),
                .init("getRandom", randomVal: [-7, 6, 10, 3, 8, -8, 2, 5, -4]),
                .init("insert", 7, isInserted: true),
                .init("insert", 0, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, -4, 0]),
                .init("remove", -10, isRemoved: false),
                .init("remove", -4, isRemoved: true),
                .init("remove", -3, isRemoved: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0]),
                .init("insert", -4, isInserted: true),
                .init("insert", -5, isInserted: true),
                .init("insert", 8, isInserted: false),
                .init("insert", -2, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2]),
                .init("insert", -9, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9]),
                .init("remove", 7, isRemoved: true),
                .init("insert", -2, isInserted: false),
                .init("insert", 7, isInserted: true),
                .init("insert", 4, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4]),
                .init("insert", -6, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6]),
                .init("insert", -8, isInserted: false),
                .init("insert", 2, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6]),
                .init("remove", 9, isRemoved: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6]),
                .init("remove", -1, isRemoved: false),
                .init("insert", 3, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6]),
                .init("insert", 0, isInserted: false),
                .init("insert", -3, isInserted: true),
                .init("insert", -1, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1]),
                .init("insert", -8, isInserted: false),
                .init("insert", -10, isInserted: true),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("insert", 3, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("insert", 4, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("insert", -10, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("insert", 0, isInserted: false),
                .init("insert", -2, isInserted: false),
                .init("insert", 5, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -2, -9, 4, -6, -3, -1, -10]),
                .init("remove", -2, isRemoved: true),
                .init("insert", 5, isInserted: false),
                .init("insert", 10, isInserted: false),
                .init("getRandom", randomVal: [-7, 6, 7, 10, 3, 8, -8, 2, 5, 0, -4, -5, -9, 4, -6, -3, -1, -10]),
                .init("insert", 9, isInserted: true),
                .init("insert", 0, isInserted: false),
                .init("insert", 7, isInserted: false),
                .init("insert", -2, isInserted: true),
            ])
            return testsData
        }()
        
        for testCaseIdx in 1...testsData_380.count {
            let data = testsData_380[testCaseIdx - 1]
            let implementations: [RandomizedSetProtocol] = [
                RandomizedSet(),
                RandomizedSet2(),
                RandomizedSet3()
            ]
            
            for impIdx in 1...implementations.count {
                let imp = implementations[impIdx - 1]
                for testCase in data {
                    switch testCase.command {
                        case "insert":
                            XCTAssertEqual(
                                imp.insert(testCase.value), testCase.isInserted,
                                "test case: \(testCaseIdx); imp case: \(impIdx)"
                            )
                        case "remove":
                            XCTAssertEqual(
                                imp.remove(testCase.value), testCase.isRemoved,
                                "test case: \(testCaseIdx); imp case: \(impIdx)"
                            )
                        case "getRandom":
                            let value = imp.getRandom()
                            XCTAssertTrue(
                                testCase.randomVal.contains { $0 == value },
                                "test case: \(testCaseIdx); imp case: \(impIdx)"
                            )
                        default: break
                    }
                }
            }
        }
    }
    
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
            
            XCTAssertEqual(actual, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
            XCTAssertEqual(actual2, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
            XCTAssertEqual(actual3, data.expected, "nums1: \(data.nums1); nums2: \(data.nums2)")
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
