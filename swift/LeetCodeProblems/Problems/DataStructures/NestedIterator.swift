//
//  NestedIterator.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  341. Flatten Nested List Iterator
//  Medium
//  Topics: Stack, Tree, Depth-First Search, Design, Queue, Iterator

//  You are given a nested list of integers nestedList.
//  Each element is either an integer or a list whose elements may also be integers or other lists.
//  Implement an iterator to flatten it.
//
//  Implement the NestedIterator class:
//  - NestedIterator(List<NestedInteger> nestedList) Initializes the iterator with the nested list nestedList.
//  - int next() Returns the next integer in the nested list.
//  - boolean hasNext() Returns true if there are still some integers in the nested list and false otherwise.
//
//  Your code will be tested with the following pseudocode:
//    initialize iterator with nestedList
//    res = []
//    while iterator.hasNext()
//      append iterator.next() to the end of res
//    return res
//
//  If res matches the expected flattened list, then your code will be judged as correct.

//  Example 1:
//  Input: nestedList = [[1,1],2,[1,1]]
//  Output: [1,1,2,1,1]
//  Explanation: By calling next repeatedly until hasNext returns false,
//  the order of elements returned by next should be: [1,1,2,1,1].
//
//  Example 2:
//  Input: nestedList = [1,[4,[6]]]
//  Output: [1,4,6]
//  Explanation: By calling next repeatedly until hasNext returns false,
//  the order of elements returned by next should be: [1,4,6].
 
//  Constraints:
//  1 <= nestedList.length <= 500
//  The values of the integers in the nested list is in the range [-10^6, 10^6].

// help: https://www.youtube.com/watch?v=8T-0gQqQgEA&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
// Approach: Stack, N-Tree
// Time complexity: O(count) = 30 ms
//   count - count of NestedIntegers in structure
// Space complexity: O(depth) = 17.75 MB
//   depth - depth of list
public final class NestedIterator {
    private final class NestedIntegerListPosition {
        let list: [NestedInteger]
        var nextPosition: Int
        
        init(list: [NestedInteger], nextPosition: Int = 0) {
            self.list = list
            self.nextPosition = nextPosition
        }
    }
    
    private var positions = [NestedIntegerListPosition]()
    private var currentIsFilled = false
    private var current = Int.zero
    
    init(_ nestedList: [NestedInteger]) {
        positions.append(.init(list: nestedList))
    }
    
    func next() -> Int {
        fillCurrent()

        guard currentIsFilled else { return Int.zero }
        
        currentIsFilled = false
        return current
    }
    
    func hasNext() -> Bool {
        fillCurrent()
        return currentIsFilled
    }
    
    private func fillCurrent() {
        guard !currentIsFilled else { return }
        
        while true {
            guard let listPosition = positions.last else { return }

            let list = listPosition.list
            var nextPosition = listPosition.nextPosition
            
            if nextPosition >= list.count {
                _ = positions.removeLast()
                continue
            }
            
            if list[nextPosition].isInteger() {
                current = list[nextPosition].getInteger()
                currentIsFilled = true
                nextPosition += 1
                listPosition.nextPosition = nextPosition
                return
            }
            
            listPosition.nextPosition += 1
            positions.append(.init(list: list[nextPosition].getList()))
            
        }
    }
}
