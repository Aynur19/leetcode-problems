//
//  QueueList.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

//  232. Implement Queue using Stacks
//  Easy
//  Topics: Stack, Design, Queue

//  Implement a first in first out (FIFO) queue using only two stacks.
//  The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).
//
//  Implement the MyQueue class:
//  - void push(int x) Pushes element x to the back of the queue.
//  - int pop() Removes the element from the front of the queue and returns it.
//  - int peek() Returns the element at the front of the queue.
//  - boolean empty() Returns true if the queue is empty, false otherwise.
//
//  Notes:
//  - You must use only standard operations of a stack,
//    which means only push to top, peek/pop from top, size, and is empty operations are valid.
//  - Depending on your language, the stack may not be supported natively.
//    You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
 
//  Example 1:
//  Input
//    ["MyQueue", "push", "push", "peek", "pop", "empty"]
//    [[], [1], [2], [], [], []]
//  Output
//    [null, null, null, 1, 1, false]
//  Explanation
//    MyQueue myQueue = new MyQueue();
//    myQueue.push(1); // queue is: [1]
//    myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
//    myQueue.peek(); // return 1
//    myQueue.pop(); // return 1, queue is [2]
//    myQueue.empty(); // return false
 
//  Constraints:
//  1 <= x <= 9
//  At most 100 calls will be made to push, pop, peek, and empty.
//  All the calls to pop and peek are valid.
 
//  Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? 
//  In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.


// Approach: LinkedList
// Time complexity: O(1) = 0
// Space complexity: O(n) = 16.36
public final class QueueList<ValueType>: QueueProtocol {
    private var list = LinkedList<ValueType>()

    init() { }
    
    func enqueue(_ x: ValueType) {
        list.addAtTail(x)
    }
    
    func dequeue() -> ValueType? {
        return list.removeAtHead()
    }
    
    func peek() -> ValueType? {
        return list.get(0)
    }
    
    func empty() -> Bool {
        return list.empty()
    }
}


extension QueueList: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

extension ProblemsTestCases {
    typealias TestCase_232 = [(command: String, args: Int, expected: Int)]
    
    static func testsData_232() -> [TestCase_232] {
        var testsData = [TestCase_232]()
        
        testsData.append([
            (command: "Queue", args: 0, expected: 0),
            (command: "push",  args: 1, expected: 0),
            (command: "push",  args: 2, expected: 0),
            (command: "peek",  args: 0, expected: 1),
            (command: "pop",   args: 0, expected: 1),
            (command: "empty", args: 0, expected: 0)
        ])
        
        testsData.append([
            (command: "Queue",  args: 0, expected: 0),
            (command: "push",   args: 1, expected: 0),
            (command: "pop",    args: 0, expected: 1),
            (command: "push",   args: 2, expected: 0),
            (command: "peek",   args: 0, expected: 2)
        ])
        
        return testsData
    }
}
