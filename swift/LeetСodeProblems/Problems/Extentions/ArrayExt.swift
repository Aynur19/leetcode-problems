//
//  ArrayExt.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

import Foundation

extension Array {
    @inlinable public func firstSortedIndex(of item: Element) -> Int? where Element: Comparable {
        guard count > 1 else { return item == self[0] ? 0 : nil }
        
        var left = 0
        var right = count - 1
        var idx = 0
    
        while true {
            idx = (right + left) / 2
            
            if left == right { return item == self[idx] ? 0 : nil }
            if item == self[idx] { return idx }
            
            if item > self[idx] {
                right = idx
            } else {
                left = idx + 1
            }
        }
    }
    
    @inlinable public func lowerBound(where predicate: (Element) -> Bool) -> Int? {
        guard count > 1 else { return predicate(self[0]) ? 0 : nil }
        if predicate(self[0]) { return 0 }
        
        
        var left = 0
        var right = count - 1
        var idx = 0
    
        while true {
            idx = (right + left) / 2
            
            if left == right { break }
            
            if predicate(self[idx]) {
                right = idx
            } else {
                left = idx + 1
            }
        }
        
        return predicate(self[idx]) ? idx : nil
    }
}
