//
//  ProblemsTests_450.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

import XCTest

final class ProblemsTests_450: XCTestCase {
    // MARK: Problem 449. Serialize and Deserialize BST
    func testsProblem_449() throws {
        lazy var testsData_449: [(root: TreeNode?, expectedData: [String], expectedObject: TreeNode?)] = {
            var testsData = [(root: TreeNode?, expectedData: [String], expectedObject: TreeNode?)]()
            
            testsData.append((
                root: .init(2, .init(1), .init(3)),
                expectedData: ["2;1;?;?;3;?;?;", "2;1;3;?;?;?;?;"],
                expectedObject: .init(2, .init(1), .init(3))
            ))
            testsData.append((
                root: nil,
                expectedData: ["", ""],
                expectedObject: nil
            ))
            testsData.append((
                root: .init(3, .init(1, nil, .init(2)), .init(4)),
                expectedData: ["3;1;?;2;?;?;4;?;?;", "3;1;4;?;2;?;?;?;?;"],
                expectedObject: .init(3, .init(1, nil, .init(2)), .init(4))
            ))
            testsData.append((
                root: .init(5, .init(3, .init(2, .init(1), nil), .init(4)), .init(6)),
                expectedData: [
                    "5;3;2;1;?;?;?;4;?;?;6;?;?;",
                    "5;3;6;2;4;?;?;1;?;?;?;?;?;"
                ],
                expectedObject: .init(3, .init(1, nil, .init(2)), .init(4))
            ))
            testsData.append((
                root: .init(15,
                            .init(13,
                                  .init(9, .init(1), nil),
                                  .init(10, .init(3), .init(4))
                            ),
                            .init(14,
                                  .init(11, .init(5), .init(6)),
                                  .init(12, nil, .init(8))
                            )
                        ),
                expectedData: [
                    "15;13;9;1;?;?;?;10;3;?;?;4;?;?;14;11;5;?;?;6;?;?;12;?;8;?;?;",
                    "15;13;14;9;10;11;12;1;?;3;4;5;6;?;8;?;?;?;?;?;?;?;?;?;?;?;?;"
                ],
                expectedObject: .init(15,
                                      .init(13,
                                            .init(9, .init(1), nil),
                                            .init(10, .init(3), .init(4))
                                      ),
                                      .init(14,
                                            .init(11, .init(5), .init(6)),
                                            .init(12, nil, .init(8))
                                      )
                                  )
            ))
            
            return testsData
        }()
        
        let codec = Codec()
        for testCaseIdx in 1...testsData_449.count {
            let data = testsData_449[testCaseIdx - 1]
            
            for idx in 1...3 {
                let actualSerialize = codec.serialize(data.root, idx)
                let actualDeserialize = codec.deserialize(actualSerialize, idx)
                let expectedData = data.expectedData[idx == 3 ? 1 : 0]
                
                XCTAssertEqual(
                    actualSerialize, expectedData,
                    "test case: \(testCaseIdx)"
                )
                
                if let root = data.root {
                    XCTAssertTrue(
                        (actualDeserialize! === root),
                        "test case: \(testCaseIdx)"
                    )
                } else {
                    XCTAssertTrue(
                        actualDeserialize == nil,
                        "test case: \(testCaseIdx)"
                    )
                }
            }
        }
    }
    
    // MARK: Problem 443. String Compression
    func testsProblem_443() throws {
        lazy var testsData_443: [(chars: [Character], expectedChars: [Character], expected: Int)] = {
            var testsData = [(chars: [Character], expectedChars: [Character], expected: Int)]()
            
            testsData.append((
                chars: ["a", "a", "b", "b", "c", "c", "c"],
                expectedChars: ["a", "2", "b", "2", "c", "3", "c"],
                expected: 6
            ))
            testsData.append((
                chars: ["a"],
                expectedChars: ["a"],
                expected: 1
            ))
            testsData.append((
                chars: ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"],
                expectedChars: ["a", "b", "1", "2", "b", "b", "b", "b", "b", "b", "b", "b", "b"],
                expected: 4
            ))
            
            return testsData
        }()
        
        for data in testsData_443 {
            var chars = data.chars
            let actual = Problems.problem_443_compress(&chars)
            
            XCTAssertEqual(chars, data.expectedChars, "chars: '\(data.chars)'")
            XCTAssertEqual(actual, data.expected, "chars: '\(data.chars)'")
        }
    }
    
    // MARK: Problem 438. Find All Anagrams in a String
    func testsProblem_438() throws {
        lazy var testsData_438: [(s: String, p: String, expected: [Int])] = {
            var testsData = [(s: String, p: String, expected: [Int])]()
            
            testsData.append((s: "cbaebabacd", p: "abc", expected: [0, 6]))
            testsData.append((s: "abab", p: "ab", expected: [0, 1, 2]))
            testsData.append((s: "abaacbabc", p: "abc", expected: [3, 4, 6]))
            
            return testsData
        }()
        
        for data in testsData_438 {
            let actual = Problems.problem_438_findAnagrams(data.s, data.p)
            let actual2 = Problems.problem_438_findAnagrams(data.s, data.p)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; p: '\(data.p)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'; p: '\(data.p)'")
        }
    }
    
    // MARK: Problem 424. Longest Repeating Character Replacement
    func testsProblem_424() throws {
        lazy var testsData_424: [(s: String, k: Int, expected: Int)] = {
            var testsData = [(s: String, k: Int, expected: Int)]()
            
            testsData.append((s: "ABAB", k: 2, expected: 4))
            testsData.append((s: "AABABBA", k: 1, expected: 4))
            testsData.append((s: "AABA", k: 0, expected: 2))
            testsData.append((s: "ABAA", k: 0, expected: 2))
            testsData.append((s: "BAAA", k: 0, expected: 3))
            testsData.append((s: "AAAA", k: 2, expected: 4))
            testsData.append((s: "AAAB", k: 0, expected: 3))
            testsData.append((s: "ABBB", k: 2, expected: 4))
            testsData.append((
                s: "KRSCDCSONAJNHLBMDQGIFCPEKPOHQIHLTDIQGEKLRLCQNBOHNDQGHJPNDQPERNFSSSRDEQLFPCCCARFMDLHADJADAGNNSBNCJQOF",
                k: 4, expected: 7))
            
            return testsData
        }()
        
        for data in testsData_424 {
            let actual = Problems.problem_424_characterReplacement(data.s, data.k)
            let actual2 = Problems.problem_424_characterReplacement2(data.s, data.k)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; k: \(data.k)")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'; k: \(data.k)")
        }
    }
    
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
