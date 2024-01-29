//
//  ProblemsTests_250.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

import XCTest
@testable import Problems

extension ProblemsTests {
    // MARK: Problem 235. Lowest Common Ancestor of a Binary Search Tree
    func testsProblem_235() throws {
        lazy var testsData_235: [(root: TreeNode?, p: TreeNode?, q: TreeNode?, expected: TreeNode?)] = {
            var testsData = [(root: TreeNode?, p: TreeNode?, q: TreeNode?, expected: TreeNode?)]()
            
            let p1: TreeNode? = .init(2, .init(0), .init(4, .init(3), .init(5)))
            let q1: TreeNode? = .init(8, .init(7), .init(9))
            let root1: TreeNode? = .init(6, p1, q1)
            let expected1: TreeNode? = root1
            testsData.append((root: root1, p: p1, q: q1, expected: expected1))
            
            let q2: TreeNode? = .init(4, .init(3), .init(5))
            let p2: TreeNode? = .init(2, .init(0), q2)
            let root2: TreeNode? = .init(6, p2, .init(8, .init(7), .init(9)))
            let expected2: TreeNode? = p2
            testsData.append((root: root2, p: p2, q: q2, expected: expected2))
            
            let q3: TreeNode? = .init(1)
            let p3: TreeNode? = .init(2)
            let root3: TreeNode? = p2
            root3?.left = q3
            let expected3: TreeNode? = root3
            testsData.append((root: root3, p: p3, q: q3, expected: expected3))
            
            return testsData
        }()
        
        var idx = 0
        for data in testsData_235 {
            idx += 1
            let actual = Problems.problem_235_lowestCommonAncestor(data.root, data.p, data.q)
            XCTAssertEqual(actual, data.expected, "test case: \(idx)")
        }
    }
    
    // MARK: Problem 234. Summary Ranges
    func testsProblem_234() throws {
        lazy var testsData_234: [(head: ListNode?, expected: Bool)] = {
            var testsData = [(head: ListNode?, expected: Bool)]()
            
            testsData.append((head: .init(1, .init(2, .init(2, .init(1)))), expected: true))
            testsData.append((head: .init(1, .init(2)), expected: false))
            
            return testsData
        }()
        
        for data in testsData_234 {
            let actual = Problems.problem_234_isPalindrome(data.head)
            XCTAssertEqual(actual, data.expected, "head: \(data.head?.description ?? "[]")")
        }
    }
    
    // MARK: Problem 232. Implement Queue using Stacks
    func testsProblem_232() throws {
        lazy var testsData_232: [(commands: [String], args: [[Int]], expected: [Int])] = {
            var testsData = [(commands: [String], args: [[Int]], expected: [Int])]()
            
            testsData.append((
                commands: ["MyQueue", "push", "push", "peek", "pop", "empty"],
                args: [[], [1], [2], [], [], []],
                expected: [1, 1, 0]
            ))
            
            return testsData
        }()
        
        for data in testsData_232 {
            var actual = [Int]()
            let myQueue = MyQueue()
            
            for i in 1..<data.commands.count {
                var method = ""
                switch data.commands[i] {
                    case "push":
                        method = "\(i)) push(\(data.args[i])): ->  "
                        myQueue.push(data.args[i][0])
                    case "peek":
                        method = "\(i)) peek(): ->  "
                        actual.append(myQueue.peek())
                    case "pop":
                        method = "\(i)) pop(): ->  "
                        actual.append(myQueue.pop())
                    default:
                        method = "\(i)) empty(): ->  "
                        actual.append(myQueue.empty() ? 1 : 0)
                }
                
                print("\(i)) \(method)\(myQueue)")
            }
            XCTAssertEqual(actual, data.expected, "commands: \(data.commands), args: \(data.args)")
        }
    }
    
    // MARK: Problem 228. Summary Ranges
    func testsProblem_228() throws {
        lazy var testsData_228: [(nums: [Int], expected: [String])] = {
            var testsData = [(nums: [Int], expected: [String])]()
            
            testsData.append((nums: [0,1,2,4,5,7], expected: ["0->2","4->5","7"]))
            testsData.append((nums: [0,2,3,4,6,8,9], expected: ["0","2->4","6","8->9"]))
            
            return testsData
        }()
        
        for data in testsData_228 {
            let actual = Problems.problem_228_summaryRanges(data.nums)
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 206. Reverse Linked List
    func testsProblem_206() throws {
        func testsData_206() -> [(head: ListNode?, expected: ListNode?)] {
            var testsData = [(head: ListNode?, expected: ListNode?)]()
            
            testsData.append((
                head: .init(1, .init(2, .init(3, .init(4, .init(5))))),
                expected: .init(5, .init(4, .init(3, .init(2, .init(1)))))
            ))
            testsData.append((
                head: .init(1, .init(2)),
                expected: .init(2, .init(1))
            ))
            testsData.append((head: nil, expected: nil))
            
            return testsData
        }
        
        for data in testsData_206() {
            let actual = Problems.problem_206_reverseList(data.head)
            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]")")
        }
        
        for data in testsData_206() {
            let actual = Problems.problem_206_reverseList2(data.head)
            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]")")
        }
    }
    
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
