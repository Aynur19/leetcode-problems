//
//  StringIterator.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 07.02.2024.
//

public final class StringIterator {
    fileprivate(set) var idx = -1
    fileprivate(set) var char: Character = " "
    fileprivate(set) var isEnd = false
    fileprivate var iter: String.Iterator
    
    init(_ iterator: StringIterator) {
        self.idx = iterator.idx
        self.char = iterator.char
        self.isEnd = iterator.isEnd
        self.iter = iterator.iter
    }
    
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
