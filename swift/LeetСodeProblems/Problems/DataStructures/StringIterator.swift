//
//  StringIterator.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 07.02.2024.
//

public final class StringIterator {
    private(set) var idx = -1
    private(set) var char: Character = " "
    private(set) var isEnd = false
    private var iter: String.Iterator
    
    init(_ string: String) {
        isEnd = string.isEmpty
        iter = string.makeIterator()
    }
    
    func next() -> (char: Character, idx: Int) {
        idx += 1
        if let nextChar = iter.next() {
            char = nextChar
        } else {
            isEnd = false
            char = " "
        }
        
        return (char, idx)
    }
}
