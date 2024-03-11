//
//  QueueProtocol.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 08.03.2024.
//

protocol QueueProtocol {
    associatedtype ValueType
    
    func enqueue(_ x: ValueType)
    
    func dequeue() -> ValueType?
    
    func peek() -> ValueType?
    
    func empty() -> Bool 
}
