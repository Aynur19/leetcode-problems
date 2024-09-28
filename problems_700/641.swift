// 641. Design Circular Deque
// Solved
// Medium
// Topics: Array, Linked List, Design, Queue
// Companies

// Design your implementation of the circular double-ended queue (deque).
// 
// Implement the MyCircularDeque class:
// MyCircularDeque(int k) Initializes the deque with a maximum size of k.
// - boolean insertFront() Adds an item at the front of Deque. Returns true if the operation is successful, or false otherwise.
// - boolean insertLast() Adds an item at the rear of Deque. Returns true if the operation is successful, or false otherwise.
// - boolean deleteFront() Deletes an item from the front of Deque. Returns true if the operation is successful, or false otherwise.
// - boolean deleteLast() Deletes an item from the rear of Deque. Returns true if the operation is successful, or false otherwise.
// - int getFront() Returns the front item from the Deque. Returns -1 if the deque is empty.
// - int getRear() Returns the last item from Deque. Returns -1 if the deque is empty.
// - boolean isEmpty() Returns true if the deque is empty, or false otherwise.
// - boolean isFull() Returns true if the deque is full, or false otherwise.

// Example 1:
// Input
//      ["MyCircularDeque", "insertLast", "insertLast", "insertFront", "insertFront", "getRear", "isFull", "deleteLast", 
//          "insertFront", "getFront"]
//      [[3], [1], [2], [3], [4], [], [], [], [4], []]
// Output
//      [null, true, true, true, false, 2, true, true, true, 4]
// Explanation
//      MyCircularDeque myCircularDeque = new MyCircularDeque(3);
//      myCircularDeque.insertLast(1);  // return True
//      myCircularDeque.insertLast(2);  // return True
//      myCircularDeque.insertFront(3); // return True
//      myCircularDeque.insertFront(4); // return False, the queue is full.
//      myCircularDeque.getRear();      // return 2
//      myCircularDeque.isFull();       // return True
//      myCircularDeque.deleteLast();   // return True
//      myCircularDeque.insertFront(4); // return True
//      myCircularDeque.getFront();     // return 4
//  
// Constraints:
// 1 <= k <= 1000
// 0 <= value <= 1000
// At most 2000 calls will be made to insertFront, insertLast, deleteFront, deleteLast, getFront, getRear, isEmpty, isFull.


// Time complexity: O(1) each operation
// Memory complexity: O(1) each operation

class MyCircularDeque {
    private var data: [Int]
    private var frontPtr: Int
    private var lastPtr: Int
    private var freeCapacity = 0

    init(_ k: Int) {
        if k < 1 {
            assertionFailure("k < 1")
        }

        data = Array(repeating: 0, count: k + 1)
        freeCapacity = k

        frontPtr = -1
        lastPtr = 0
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }

        frontPtr = getPrevPtr(ptr: frontPtr)
        data[frontPtr] = value
        freeCapacity -= 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }

        data[lastPtr] = value
        lastPtr = getNextPtr(ptr: lastPtr)
        freeCapacity -= 1
        return true
    }
    
    func deleteFront() -> Bool {
        if isEmpty() { return false }

        frontPtr = getNextPtr(ptr: frontPtr)
        freeCapacity += 1
        return true
    }
    
    func deleteLast() -> Bool {
        if isEmpty() { return false }

        lastPtr = getPrevPtr(ptr: lastPtr)
        freeCapacity += 1
        return true
    }
    
    func getFront() -> Int {
        isEmpty() ? -1 : data[frontPtr]
    }
    
    func getRear() -> Int {
        isEmpty() ? -1 : data[getPrevPtr(ptr: lastPtr)]
    }
    
    func isEmpty() -> Bool {
        freeCapacity == data.count - 1
    }
    
    func isFull() -> Bool {
        freeCapacity == 0
    }

    private func getNextPtr(ptr: Int) -> Int {
        var nextPtr = ptr + 1
        return nextPtr < data.count ? nextPtr : 0
    }

    private func getPrevPtr(ptr: Int) -> Int {
        var prevPtr = ptr - 1
        return prevPtr > -1 ? prevPtr : data.count - 1
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */