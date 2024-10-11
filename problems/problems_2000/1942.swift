// 1942. The Number of the Smallest Unoccupied Chair
// Solved
// Medium
// Topics
// Companies

// There is a party where n friends numbered from 0 to n - 1 are attending. There is an infinite number of chairs in 
// this party that are numbered from 0 to infinity. When a friend arrives at the party, they sit on the unoccupied chair 
// with the smallest number.
// 
// For example, if chairs 0, 1, and 5 are occupied when a friend comes, they will sit on chair number 2.
// When a friend leaves the party, their chair becomes unoccupied at the moment they leave. If another friend arrives 
// at that same moment, they can sit in that chair.
// 
// You are given a 0-indexed 2D integer array times where times[i] = [arrivali, leavingi], indicating the arrival and 
// leaving times of the ith friend respectively, and an integer targetFriend. All arrival times are distinct.
// 
// Return the chair number that the friend numbered targetFriend will sit on.

// Example 1:
// Input: times = [[1,4],[2,3],[4,6]], targetFriend = 1
// Output: 1
// Explanation: 
//     - Friend 0 arrives at time 1 and sits on chair 0.
//     - Friend 1 arrives at time 2 and sits on chair 1.
//     - Friend 1 leaves at time 3 and chair 1 becomes empty.
//     - Friend 0 leaves at time 4 and chair 0 becomes empty.
//     - Friend 2 arrives at time 4 and sits on chair 0.
//     Since friend 1 sat on chair 1, we return 1.
// 
// Example 2:
// Input: times = [[3,10],[1,5],[2,6]], targetFriend = 0
// Output: 2
// Explanation: 
//     - Friend 1 arrives at time 1 and sits on chair 0.
//     - Friend 2 arrives at time 2 and sits on chair 1.
//     - Friend 0 arrives at time 3 and sits on chair 2.
//     - Friend 1 leaves at time 5 and chair 0 becomes empty.
//     - Friend 2 leaves at time 6 and chair 1 becomes empty.
//     - Friend 0 leaves at time 10 and chair 2 becomes empty.
//     Since friend 0 sat on chair 2, we return 2.

// Constraints:
// n == times.length
// 2 <= n <= 10^4
// times[i].length == 2
// 1 <= arrivali < leavingi <= 10^5
// 0 <= targetFriend <= n - 1
// Each arrivali time is distinct.


// Time complexity: O(n * log n + k * log k)
// Memory complexity: O(n + k)
class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        var friends = times.indices.map { Friend(index: $0, start: times[$0][0], end: times[$0][1]) }
        
        Heap.sort(array: &friends) { parent, child in
            parent.start > child.start || parent.start == child.start && parent.end > child.end
        }
        
        let heap = Heap { (parent: Friend, child: Friend) in
            parent.end < child.end
        }
        
        let chairs = Heap { (parent: Int, child: Int) in
            parent < child
        }
        
        while !friends.isEmpty {
            let next = friends.removeLast()
            
            var chair = heap.size
            while let peek = heap.peek(),
                peek.end <= next.start,
                let chair = heap.pop()?.chair {
                chairs.push(chair)
            }
            
            if let peek = chairs.peek() {
                chair = peek
                _ = chairs.pop()
            }
            
            next.chair = chair
            print(next)
            
            if next.index == targetFriend {
                return chair
            }
            
            heap.push(next)
        }
        
        return 0
    }
}


final class Friend {
    let index: Int
    let start: Int
    let end: Int
    var chair = 0
    
    
    init(index: Int, start: Int, end: Int) {
        self.index = index
        self.start = start
        self.end = end
    }
}

protocol HeapProtocol {
    associatedtype Element
    
    init(
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    )
    
    init(
        items: [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    )
    
    var size: Int { get }
    
    func peek() -> Element?
    
    func push(_ value: Element)
    
    func pop() -> Element?
    
    static func sort(
        array: inout [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    )
}

public final class Heap<Element>: HeapProtocol {
    typealias Element = Element
    
    private var items: [Element]
    
    private var compare: (_ parent: Element, _ child: Element) -> Bool
    
    public var size: Int {
        items.count
    }
    
    public init(
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        self.items = []
        self.compare = compare
    }
    
    public init(
        items: [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        self.items = items
        self.compare = compare
        
        for idx in stride(from: size / 2, to: -1, by: -1) {
            heapify(index: idx)
        }
    }
    
    public static func sort(
        array: inout [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        let heap = Heap(items: array, compare: compare)
        for idx in array.indices {
            array[idx] = heap.pop()!
            
        }
    }
    
    public func peek() -> Element? {
        items.first
    }
    
    public func push(_ value: Element) {
        items.append(value)
        var currentIdx = size - 1
        var parentIdx = (currentIdx - 1) / 2
        
        while currentIdx > 0, !compare(items[parentIdx], items[currentIdx]) {
            items.swapAt(currentIdx, parentIdx)
            currentIdx = parentIdx
            parentIdx = (currentIdx - 1) / 2
        }
    }
    
    public func pop() -> Element? {
        let result = peek()

        if size > 0 {
            items[0] = items[size -  1]
            _ = items.removeLast()
            heapify(index: 0)
        }
        
        return result
        
    }
    
    private func heapify(index: Int) {
        var index = index
        
        while true {
            let ptrChildL = 2 * index + 1
            let ptrChildR = 2 * index + 2
            var ptrLargest = index
            
            if ptrChildL < size, !compare(items[ptrLargest], items[ptrChildL]) {
                ptrLargest = ptrChildL
            }
            
            if ptrChildR < size, !compare(items[ptrLargest], items[ptrChildR]) {
                ptrLargest = ptrChildR
            }
            
            if ptrLargest == index { return }
            
            items.swapAt(index, ptrLargest)
            index = ptrLargest
        }
    }
}
