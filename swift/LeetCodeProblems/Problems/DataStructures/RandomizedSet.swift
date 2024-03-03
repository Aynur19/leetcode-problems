//
//  RandomizedSet.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

//  380. Insert Delete GetRandom O(1)
//  Medium
//  Topics

//  Implement the RandomizedSet class:
//  - RandomizedSet() Initializes the RandomizedSet object.
//  - bool insert(int val) Inserts an item val into the set if not present. 
//    Returns true if the item was not present, false otherwise.
//  - bool remove(int val) Removes an item val from the set if present.
//    Returns true if the item was present, false otherwise.
//  - int getRandom() Returns a random element from the current set of elements
//    (it's guaranteed that at least one element exists when this method is called).
//    Each element must have the same probability of being returned.
//
//  You must implement the functions of the class such that each function works in average O(1) time complexity.

//  Example 1:
//  Input
//      ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
//      [[], [1], [2], [2], [], [1], [2], []]
//  Output
//      [null, true, false, true, 2, true, false, 2]
//
//  Explanation
//      RandomizedSet randomizedSet = new RandomizedSet();
//      randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
//      randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
//      randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
//      randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
//      randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
//      randomizedSet.insert(2); // 2 was already in the set, so return false.
//      randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.
 
//  Constraints:
//  -2^31 <= val <= 2^31 - 1
//  At most 2 * 105 calls will be made to insert, remove, and getRandom.
//  There will be at least one element in the data structure when getRandom is called.

//  help: https://www.youtube.com/watch?v=knlHlKV6Uag

protocol RandomizedSetProtocol {
    func insert(_ val: Int) -> Bool
    
    func remove(_ val: Int) -> Bool
    
    func getRandom() -> Int
}

// Approach: Standart Set
// Time complexity: 734 ms
// Space complexity: 32.53 MB
public final class RandomizedSet: RandomizedSetProtocol {
    private var set: Set<Int>
    
    init() {
        set = []
    }
    
    func insert(_ val: Int) -> Bool {
        return set.insert(val).inserted
    }
    
    func remove(_ val: Int) -> Bool {
        return set.remove(val) != nil
    }
    
    func getRandom() -> Int {
        return set.randomElement() ?? 0
    }
}

// Approach: Standard Hash Table
// Time complexity: 675 ms
// Space complexity: 32.33 MB
public final class RandomizedSet2: RandomizedSetProtocol {
    private var dict: [Int:Int]
    private var values: [Int]
    
    init() {
        dict = [:]
        values = []
    }
    
    func insert(_ val: Int) -> Bool {
        if dict[val] != nil { return false }
        
        values.append(val)
        dict[val] = values.count - 1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let idx = dict[val] else { return false }
        assert(!values.isEmpty, "values is empty")
        
        if idx == values.count - 1 {
            _ = values.removeLast()
            dict[val] = nil
            return true
        }
        
        values[idx] = values[values.count - 1]
        _ = values.removeLast()
        
        if !values.isEmpty {
            dict[values[idx]] = idx
        }
        dict[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        assert(!values.isEmpty, "values is empty")
        
        let randomIdx = Int.random(in: 0..<values.count)
        return values[randomIdx]
    }
}

// Approach: Custom Hash Table
// Time complexity: 693 ms
// Space complexity: 32.32 MB
public final class RandomizedSet3: RandomizedSetProtocol {
    enum State { case free, used, deleted }
    
    private var values: [Int]
    private var states: [State]
    
    private var nUsed: Int
    private var nFree: Int
    
    private static let emptySize = 8
    
    init() {
        nUsed = 0
        nFree = Self.emptySize
        values = Array(repeating: 0, count: Self.emptySize)
        states = Array(repeating: .free, count: Self.emptySize)
    }
    
    private func firstPos(_ val: Int) -> Int {
        if val == Int.min {
            return Int.max & (values.count - 1)
        }
        
        return abs(val) & (values.count - 1)
    }
    
    private func nextPos(_ pos: Int) -> Int {
        return (pos + 5) & (values.count - 1)
    }
    
    private func resize(size: Int) {
        let oldValues = values
        let oldStates = states
        
        values = Array(repeating: 0, count: size)
        states = Array(repeating: .free, count: size)
        
        nFree = size
        nUsed = 0
        
        for i in oldValues.indices {
            if oldStates[i] == .used {
                _ = insert(oldValues[i])
            }
        }
    }
    
    private func updateSizeUp() {
        if nFree < values.count / 4 {
            if nUsed >= values.count / 8 * 5 {
                resize(size: values.count * 2)
            } else {
                resize(size: values.count)
            }
        }
    }
    
    private func updateSizeDown() {
        if nUsed < values.count / 4, values.count > Self.emptySize {
            resize(size: values.count / 2)
        }
    }
    
    func insert(_ val: Int) -> Bool {
        var pos = firstPos(val)
        
        while true {
            if states[pos] == .used {
                if values[pos] == val { return false }
            } else if states[pos] == .deleted {
                values[pos] = val
                states[pos] = .used
                nUsed += 1
                return true
            } else {
                values[pos] = val
                states[pos] = .used
                nUsed += 1
                nFree -= 1
                updateSizeUp()
                return true
            }
            
            pos = nextPos(pos)
        }
    }
    
    func remove(_ val: Int) -> Bool {
        var pos = firstPos(val)
        
        while true {
            if states[pos] == .free { return false }
            
            if states[pos] == .used {
                if values[pos] == val {
                    states[pos] = .deleted
                    nUsed -= 1
                    updateSizeDown()
                    return true
                }
            } else {
                assert(states[pos] == .deleted)
            }
            
            pos = nextPos(pos)
        }
    }
    
    func getRandom() -> Int {
        while true {
            let randomIdx = Int.random(in: 0..<values.count)
            
            if states[randomIdx] == .used {
                return values[randomIdx]
            }
        }
    }
}
