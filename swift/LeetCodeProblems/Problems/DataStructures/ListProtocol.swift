//
//  ListProtocol.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 08.03.2024.
//

protocol ListProtocol {
    associatedtype ValueType
    
    func get(_ index: Int) -> ValueType?

    func empty() -> Bool

    func addAtHead(_ val: ValueType)

    func addAtTail(_ val: ValueType)

    func addAtIndex(_ index: Int, _ val: ValueType) -> Bool

    func removeAtHead() -> ValueType?

    func removeAtTail() -> ValueType?

    func removeAtIndex(_ index: Int) -> ValueType?

    func deleteAtHead()

    func deleteAtTail()

    func deleteAtIndex(_ index: Int)
}
