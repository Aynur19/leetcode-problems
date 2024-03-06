//
//  MinStack.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 06.03.2024.
//

//  155. Min Stack
//  Medium
//  Topics: Stack, Design

//  Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//  Implement the MinStack class:
//  - MinStack() initializes the stack object.
//  - void push(int val) pushes the element val onto the stack.
//  - void pop() removes the element on the top of the stack.
//  - int top() gets the top element of the stack.
//  - int getMin() retrieves the minimum element in the stack.
//  
//  You must implement a solution with O(1) time complexity for each function.

//  Example 1:
//  Input
//      ["MinStack","push","push","push","getMin","pop","top","getMin"]
//      [[],[-2],[0],[-3],[],[],[],[]]
//  Output
//      [null,null,null,null,-3,null,0,-2]
//  Explanation
//      MinStack minStack = new MinStack();
//      minStack.push(-2);
//      minStack.push(0);
//      minStack.push(-3);
//      minStack.getMin(); // return -3
//      minStack.pop();
//      minStack.top();    // return 0
//      minStack.getMin(); // return -2

//  Constraints:
//  -2^31 <= val <= 2^31 - 1
//  Methods pop, top and getMin operations will always be called on non-empty stacks.
//  At most 3 * 10^4 calls will be made to push, pop, top, and getMin.

//  Approach: Double Linked List, Stack
//  Time complexity:
//    - O(1)        -> for 1 call of push(), pop(), top(), getMin()
//    - 37 ms       -> for all calls
//  Space complexity:
//    - O(1)        -> for 1 call of push(), pop(), top(), getMin()
//    - 17.87 MB    -> for all calls
public class MinStack {
    typealias ValueType = Int
    
    struct MinStackValue<ValType> where ValType : Comparable   {
        let value: ValType
        let minVal: ValType
        
        init(_ value: ValType, minVal: ValType) {
            self.value = value
            self.minVal = minVal
        }
    }
    
    private var stack: DoubleLinkedList<MinStackValue<ValueType>>?

    init() { }
    
    func push(_ val: ValueType) {
        if let stack = self.stack {
            stack.setNext(.init(value: .init(val, minVal: min(stack.value.minVal, val))))
            self.stack = stack.next
            return
        }
        
        self.stack = DoubleLinkedList<MinStackValue>(value: .init(val, minVal: val))
    }
    
    func pop() {
        guard let stack = self.stack?.prev else {
            self.stack = nil
            return
        }
        
        _ = stack.removeNext()
        self.stack = stack
    }
    
    func top() -> ValueType {
        guard let stack = self.stack else {
            return 0
        }
        
        return stack.value.value
    }
    
    func getMin() -> ValueType {
        guard let stack = self.stack else {
            return 0
        }
        
        return stack.value.minVal
    }
}
