//
//  ProblemsTests.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 27.01.2024.
//

import XCTest
@testable import Problems

public final class ProblemsTests_200: XCTestCase {
    // MARK: Problem 200. Number of Islands
        func testsProblem_200() throws {
        lazy var testsData_200: [(grid: [[Character]], expected: Int)] = {
            var testsData = [(grid: [[Character]], expected: Int)]()
            
            testsData.append((
                grid: [["1","1","1","1","0"],
                       ["1","1","0","1","0"],
                       ["1","1","0","0","0"],
                       ["0","0","0","0","0"]],
                expected: 1
            ))
            testsData.append((
                grid: [["1","1","0","0","0"],
                       ["1","1","0","0","0"],
                       ["0","0","1","0","0"],
                       ["0","0","0","1","1"]],
                expected: 3
            ))

            return testsData
        }()
        
        for data in testsData_200 {
            let actual = Problems.problem_200_numIslands(data.grid)
            let actual2 = Problems.problem_200_numIslands2(data.grid)
            
            XCTAssertEqual(actual, data.expected, "grid: \(data.grid)")
            XCTAssertEqual(actual2, data.expected, "grid: \(data.grid)")
        }
    }
    
    // MARK: Problem 167. Two Sum II - Input Array Is Sorted
    func testsProblem_167() throws {
        lazy var testsData_167: [(nums: [Int], target: Int, expected: [Int])] = {
            var testsData = [(nums: [Int], target: Int, expected: [Int])]()
            
            testsData.append((nums: [2, 7, 11, 15], target: 9, expected: [1, 2]))
            testsData.append((nums: [2, 3, 4], target: 6, expected: [1, 3]))
            testsData.append((nums: [-1, 0], target: -1, expected: [1, 2]))

            return testsData
        }()
        
        for data in testsData_167 {
            let actual = Problems.problem_167_twoSum(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 153. Find Minimum in Rotated Sorted Array
    func testsProblem_153() throws {
        lazy var testsData_153: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [3, 4, 5, 1, 2], expected: 1))
            testsData.append((nums: [4, 5, 6, 7, 0, 1, 2], expected: 0))
            testsData.append((nums: [11, 13, 15, 17], expected: 11))
            testsData.append((nums: [200, 13, 15, 17], expected: 13))
            testsData.append((nums: [11, 13, 15, 1], expected: 1))

            return testsData
        }()
        
        for data in testsData_153 {
            let actual = Problems.problem_153_findMin(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 150. Evaluate Reverse Polish Notation
    func testsProblem_150() throws {
        lazy var testsData_150: [(tokens: [String], expected: Int)] = {
            var testsData = [(tokens: [String], expected: Int)]()
            
            testsData.append((tokens: ["2", "1", "+", "3", "*"], expected: 9))
            testsData.append((tokens: ["4", "13", "5", "/", "+"], expected: 6))
            testsData.append((tokens: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"], expected: 22))
            
            return testsData
        }()
        
        for data in testsData_150 {
            let actual = Problems.problem_150_evalRPN(data.tokens)
            
            XCTAssertEqual(actual, data.expected, "tokens: '\(data.tokens)'")
        }
    }
    
//    // MARK: Problem 146. LRU Cache
//    func testsProblem_146() throws {
//        lazy var testsData_146: [(commands: [String], args: [[Int]], expected: [Int])] = {
//            var testsData = [(commands: [String], args: [[Int]], expected: [Int])]()
//            
//            testsData.append((
//                commands: ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"],
//                args: [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]],
//                expected: [1, -1, -1, 3, 4]
//            ))
//            
//            testsData.append((
//                commands: ["LRUCache", "put", "put", "put", "put", "get", "get", "get", "get", "put", "get", "get", "get", "get", "get"],
//                args: [[3], [1, 1], [2, 2], [3, 3], [4, 4], [4], [3], [2], [1], [5, 5], [1], [2], [3], [4], [5]],
//                expected: [4, 3, 2, -1, -1, 2, 3, -1, 5]
//            ))
//            
//            testsData.append((
//                commands: ["LRUCache", "get", "get", "put", "get", "put", "put", "put", "put", "get", "put"],
//                args: [[1], [6], [8], [12, 1], [2], [15, 11], [5, 2], [1, 15], [4, 2], [5], [15, 15]],
//                expected: [-1, -1, -1, -1]
//            ))
//            
//            testsData.append((
//                commands: ["LRUCache","put","put","put","put","put","get","put","get","get","put","get",
//                           "put","put","put","get","put","get","get","get","get","put","put","get","get",
//                           "get","put","put","get","put","get","put","get","get","get","put","put","put",
//                           "get","put","get","get","put","put","get","put","put","put","put","get","put",
//                           "put","get","put","put","get","put","put","put","put","put","get","put","put",
//                           "get","put","get","get","get","put","get","get","put","put","put","put","get",
//                           "put","put","put","put","get","get","get","put","put","put","get","put","put",
//                           "put","get","put","put","put","get","get","get","put","put","put","put","get",
//                           "put","put","put","put","put","put","put"],
//                args: [[10],[10,13],[3,17],[6,11],[10,5],[9,10],[13],[2,19],[2],[3],[5,25],[8],[9,22],
//                       [5,5],[1,30],[11],[9,12],[7],[5],[8],[9],[4,30],[9,3],[9],[10],[10],[6,14],[3,1],
//                       [3],[10,11],[8],[2,14],[1],[5],[4],[11,4],[12,24],[5,18],[13],[7,23],[8],[12],
//                       [3,27],[2,12],[5],[2,9],[13,4],[8,18],[1,7],[6],[9,29],[8,21],[5],[6,30],[1,12],
//                       [10],[4,15],[7,22],[11,26],[8,17],[9,29],[5],[3,4],[11,30],[12],[4,29],[3],[9],
//                       [6],[3,4],[1],[10],[3,29],[10,28],[1,20],[11,13],[3],[3,12],[3,8],[10,9],[3,26],
//                       [8],[7],[5],[13,17],[2,27],[11,15],[12],[9,19],[2,15],[3,16],[1],[12,17],[9,1],
//                       [6,19],[4],[5],[5],[8,1],[11,7],[5,2],[9,28],[1],[2,2],[7,4],[4,22],[7,24],[9,26],
//                       [13,28],[11,26]],
//                expected: [-1,19,17,-1,-1,-1,5,-1,12,3,5,5,1,-1,30,5,30,-1,-1,24,18,-1,18,-1,18,-1,
//                            4,29,30,12,-1,29,17,22,18,-1,20,-1,18,18,20]
//            ))
//            
//            return testsData
//        }()
//        
//        for data in testsData_146 {
//            var actual = [Int]()
//            let lruCache = LRUCache(data.args[0][0])
//            
//            for i in 1..<data.commands.count {
//                var method = ""
//                if data.commands[i] == "put" {
//                    lruCache.put(data.args[i][0], data.args[i][1])
//                    method = "\(i)) put(\(data.args[i][0]), \(data.args[i][1])): ->  "
//                } else if data.commands[i] == "get" {
//                    actual.append(lruCache.get(data.args[i][0]))
//                    method = "\(i)) get(\(data.args[i][0])): ->\t"
//                }
//                print("\(i)) \(method)\(lruCache)")
//            }
//            
//            XCTAssertEqual(actual, data.expected, "commands: \(data.commands), args: \(data.args)")
//        }
//    }
    
    // MARK: Problem 141. Linked List Cycle
//    func testsProblem_141() throws {
//        lazy var testsData_141: [(head: ListNode?, expected: Bool)] = {
//            var testsData = [(head: ListNode?, expected: Bool)]()
//            
//            let l1 = ListNode(3, .init(2, .init(0, .init(4))))
//            l1.next?.next?.next?.next = l1.next
//            testsData.append((head: l1, expected: true))
//            
//            let l2 = ListNode(1, .init(2))
//            l2.next?.next = l2
//            testsData.append((head: l2, expected: true))
//            
//            testsData.append((head: ListNode(1), expected: false))
//            
//            return testsData
//        }()
//        
//        for data in testsData_141 {
//            let actual = Problems.problem_141_hasCycle(data.head)
//            let actual2 = Problems.problem_141_hasCycle2(data.head)
//            
//            XCTAssertEqual(actual, data.expected, "head: \(String(describing: data.head))")
//            XCTAssertEqual(actual2, data.expected, "head: \(String(describing: data.head))")
//        }
//    }
    
    // MARK: Problem 136. Single Number
    func testsProblem_136() throws {
        lazy var testsData_136: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [2, 2, 1], expected: 1))
            testsData.append((nums: [4, 1, 2, 1, 2], expected: 4))
            testsData.append((nums: [1], expected: 1))
            
            return testsData
        }()
        
        for data in testsData_136 {
            let actual = Problems.problem_136_singleNumber(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: '\(data.nums)'")
        }
    }
    
    // MARK: Problem 125. Valid Palindrome
    func testsProblem_125() throws {
        lazy var testsData_125: [(s: String, expected: Bool)] = {
            var testsData = [(s: String, expected: Bool)]()
            
            testsData.append((s: "A man, a plan, a canal: Panama", expected: true))
            testsData.append((s: "race a car", expected: false))
            testsData.append((s: " ", expected: true))
            testsData.append((s: "0P", expected: false))
            
            return testsData
        }()
        
        for data in testsData_125 {
            let actual = Problems.problem_125_isPalindrome(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 121. Best Time to Buy and Sell Stock
    func testsProblem_121() throws {
        lazy var testsData_121: [(prices: [Int], expected: Int)] = {
            var testsData = [(prices: [Int], expected: Int)]()
            
            testsData.append((prices: [7, 1, 5, 3, 6, 4], expected: 5))
            testsData.append((prices: [7, 6, 4, 3, 1], expected: 0))
            
            return testsData
        }()
        
        for data in testsData_121 {
            let actual = Problems.problem_121_maxProfit(data.prices)
            
            XCTAssertEqual(actual, data.expected, "prices: \(data.prices)")
        }
    }
    
    // MARK: Problem 110. Balanced Binary Tree
    func testsProblem_110() throws {
        lazy var testsData_110: [(root: TreeNode?, expected: Bool)] = {
            var testsData = [(root: TreeNode?, expected: Bool)]()
            
            testsData.append((
                root: TreeNode(3, .init(9), .init(20, .init(15), .init(7))),
                expected: true
            ))
            testsData.append((
                root: TreeNode(1, .init(2, .init(3, .init(4), .init(4)), .init(3)), .init(2)),
                expected: false
            ))
            testsData.append((
                root: nil,
                expected: true
            ))
            testsData.append((
                root: TreeNode(1, nil, .init(2, nil, .init(3))),
                expected: false
            ))
            testsData.append((
                root: TreeNode(1, .init(2, .init(4, .init(8), nil), .init(5)), .init(3, .init(6), nil)),
                expected: true
            ))
            
            return testsData
        }()
        
        for data in testsData_110 {
            let actualBFS = Problems.problem_110_isBalanced(data.root)
            
            XCTAssertEqual(actualBFS, data.expected, "head: \(String(describing: data.root))")
        }
    }
    
    // MARK: Problem 104. Maximum Depth of Binary Tree
    func testsProblem_104() throws {
        lazy var testsData_104: [(root: TreeNode?, expected: Int)] = {
            var testsData = [(root: TreeNode?, expected: Int)]()
            
            testsData.append((
                root: TreeNode(3, .init(9), .init(20, .init(15), .init(7))),
                expected: 3
            ))
            testsData.append((
                root: TreeNode(1, nil, .init(7)),
                expected: 2
            ))
            
            return testsData
        }()
        
        for data in testsData_104 {
            let actualBFS = Problems.problem_104_maxDepth_BFS(data.root)
            let actualDFS = Problems.problem_104_maxDepth_DFS(data.root)
            
            XCTAssertEqual(actualBFS, data.expected, "head: \(String(describing: data.root))")
            XCTAssertEqual(actualDFS, data.expected, "head: \(String(describing: data.root))")
        }
    }
    
    // MARK: Problem 103. Binary Tree Zigzag Level Order Traversal
    func testsProblem_103() throws {
        lazy var testsData_103: [(root: TreeNode?, expected: [[Int]])] = {
            var testsData = [(root: TreeNode?, expected: [[Int]])]()
            
            testsData.append((
                root: TreeNode(3, .init(9), .init(20, .init(15), .init(7))),
                expected: [[3], [20, 9], [15, 7]]
            ))
            testsData.append((
                root: TreeNode(1),
                expected: [[1]]
            ))
            testsData.append((
                root: TreeNode?.none,
                expected: []
            ))
            testsData.append((
                root: TreeNode(1, .init(2, .init(4), nil), .init(3, nil, .init(5))),
                expected: [[1], [3, 2], [4, 5]]
            ))
            
            return testsData
        }()
        
        for data in testsData_103 {
            let actual = Problems.problem_103_zigzagLevelOrder(data.root)
            
            XCTAssertEqual(actual, data.expected, "root: \(String(describing: data.root))")
        }
    }
}
