//
//  QueueArray.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 08.03.2024.
//

public final class QueueArray<ValueType>: QueueProtocol {
    private var data: [ValueType]
    private var start: Int
    private var end: Int
    private let defaultValue: ValueType

    init(_ capacity: Int = 10, defaultValue: ValueType) {
        let capacity = capacity > 10 ? capacity : 10
        self.defaultValue = defaultValue
        
        data = .init(repeating: defaultValue, count: capacity + 1)
        start = capacity
        end = capacity
    }
    
    private func resize() {
        let size = data.count
        
        var oldStart = start
        var newData = Array<ValueType>(repeating: defaultValue, count: size * 2 + 1)
        var idx = newData.count - 1
        
        while true {
            newData[idx] = data[oldStart]
            
            oldStart -= 1
            idx -= 1
            
            if oldStart < 0 { oldStart = size - 1 }
            if oldStart == end { break }
        }
        
        start = newData.count - 1
        end = oldStart
        data = newData
    }
    
    func enqueue(_ x: ValueType) {
        data[end] = x
        end = end > 0 ? end - 1 : data.count - 1
        
        if end == start {
            resize()
        }
    }
    
    func dequeue() -> ValueType? {
        guard start != end else { return nil }
        
        start = start > 0 ? start - 1 : data.count - 1
        
        return data[start + 1]
    }
    
    func peek() -> ValueType? {
        guard start != end else { return nil }
        
        return data[start]
    }
    
    func empty() -> Bool {
        return start == end
    }
}

