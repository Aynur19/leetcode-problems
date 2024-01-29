//
//  NestedInteger.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

final class NestedInteger {
    private var value: Int?
    private var integers: [NestedInteger]?
    
    init(value: Int? = nil, integers: [NestedInteger]? = nil) {
        self.value = value
        self.integers = integers
    }
    
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool { return value != nil }
    
    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int { return value ?? 0 }
    
    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int) {
        self.value = value
        self.integers = nil
    }
    
    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger) {
        if integers != nil {
            integers?.append(elem)
        } else {
            integers = [elem]
        }
        value = nil
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] {  return integers ?? [] }
}
