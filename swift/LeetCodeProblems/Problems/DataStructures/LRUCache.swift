//
//  LRUCache.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.09.2023.
//

//  146. LRU Cache
//  Medium
//  Topics

//  Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
//
//  Implement the LRUCache class:
//
//  LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
//  - int get(int key) Return the value of the key if the key exists, otherwise return -1.
//  - void put(int key, int value) Update the value of the key if the key exists.
//  Otherwise, add the key-value pair to the cache.
//  If the number of keys exceeds the capacity from this operation, evict the least recently used key.
//
//  The functions get and put must each run in O(1) average time complexity.

//  Example 1:
//  Input
//      ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//      [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//  Output
//      [null, null, null, 1, null, -1, null, -1, 3, 4]
//
//  Explanation
//  LRUCache lRUCache = new LRUCache(2);
//  lRUCache.put(1, 1); // cache is {1=1}
//  lRUCache.put(2, 2); // cache is {1=1, 2=2}
//  lRUCache.get(1);    // return 1
//  lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
//  lRUCache.get(2);    // returns -1 (not found)
//  lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
//  lRUCache.get(1);    // return -1 (not found)
//  lRUCache.get(3);    // return 3
//  lRUCache.get(4);    // return 4
 
//  Constraints:
//  1 <= capacity <= 3000
//  0 <= key <= 10^4
//  0 <= value <= 10^5
//  At most 2 * 10^5 calls will be made to get and put.

import Foundation

// help: https://www.youtube.com/watch?v=KptTnhWtBZY
final public class LRUCache {
    private var capacity: Int
    private var keyToValue = [Int:Int]()
    private var keyToIterator = [Int:DoubleLinkedList<Int>]()
    var order: DoubleLinkedList<Int>?
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let val = keyToValue[key] else { return -1 }
        
        toFront(by: key)
        
        return val
    }
    
    private func toFront(by key: Int) {
        guard let listIt = keyToIterator[key],
              order != keyToIterator[key]
        else { return }
        
        listIt.prev?.next = listIt.next
        listIt.next?.prev = listIt.prev
        listIt.prev = nil
        listIt.next = order
        order?.prev = listIt
        order = listIt
        keyToIterator[key] = order
    }
    
    func put(_ key: Int, _ value: Int) {
        if keyToValue[key] != nil {
            keyToValue[key] = value
            toFront(by: key)
            return
        } else {
            if keyToValue.count >= capacity {
                if let last = order?.getLast() {
                    last.prev?.next = nil
                    keyToValue[last.value] = nil
                    keyToIterator[last.value] = nil
                }
            }
        }
        
        keyToValue[key] = value
        
        let newItem = DoubleLinkedList(value: key, next: order)
        order?.prev = newItem
        keyToIterator[key] = newItem
        order = newItem
    }
}

extension LRUCache: CustomStringConvertible {
    public var description: String {
        var result: [String] = []
        var current = order
        
        while true {
            if let tmp = current,
               let value = keyToValue[tmp.value] {
                result.append("[\(tmp.value):\(value)]")
                current = tmp.next
            } else {
                break
            }
        }
        
        return result.joined(separator: "<->")
    }
}
