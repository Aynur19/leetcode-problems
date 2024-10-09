// 432. All O`one Data Structure
// Solved
// Hard
// Topics: Hash Table, Linked List, Design, Doubly-Linked List
// Companies

// Design a data structure to store the strings' count with the ability to return the strings with minimum and maximum counts.
// 
// Implement the AllOne class:
// - AllOne() Initializes the object of the data structure.
// - inc(String key) Increments the count of the string key by 1. If key does not exist in the data structure, 
//   insert it with count 1.
// - dec(String key) Decrements the count of the string key by 1. If the count of key is 0 after the decrement, 
//   remove it from the data structure. It is guaranteed that key exists in the data structure before the decrement.
// - getMaxKey() Returns one of the keys with the maximal count. If no element exists, return an empty string "".
// - getMinKey() Returns one of the keys with the minimum count. If no element exists, return an empty string "".
//
// Note that each function must run in O(1) average time complexity.

// Example 1:
// Input
//      ["AllOne", "inc", "inc", "getMaxKey", "getMinKey", "inc", "getMaxKey", "getMinKey"]
//      [[], ["hello"], ["hello"], [], [], ["leet"], [], []]
// Output
//      [null, null, null, "hello", "hello", null, "hello", "leet"]
// 
// Explanation
//      AllOne allOne = new AllOne();
//      allOne.inc("hello");
//      allOne.inc("hello");
//      allOne.getMaxKey(); // return "hello"
//      allOne.getMinKey(); // return "hello"
//      allOne.inc("leet");
//      allOne.getMaxKey(); // return "hello"
//      allOne.getMinKey(); // return "leet"

// Constraints:
// 1 <= key.length <= 10
// key consists of lowercase English letters.
// It is guaranteed that for each call to dec, key is existing in the data structure.
// At most 5 * 10^4 calls will be made to inc, dec, getMaxKey, and getMinKey.


// Help: https://algo.monster/liteproblems/432


class AllOne {
    private var nodes = [String:ListNode2]()
    private var root: ListNode2

    init() {
        root = ListNode2(count: 0, key: "")    
        root.next = root
        root.prev = root
    }

    

    func inc(_ key: String) {
        guard let current = nodes[key] else {
            if root.next === root || root.next!.count > 1 {
                return nodes[key] = root.appended(node: ListNode2(count: 1, key: key))
            } 
            
            _ = root.next?.keys.insert(key)
            return nodes[key] = root.next
        }

        let next = current.next
        
        if next === root || next!.count > current.count + 1 {
            nodes[key] = current.appended(node: ListNode2(count: current.count + 1, key: key))
        } else {
            next?.keys.insert(key)
            nodes[key] = next
        }

        _ = current.keys.remove(key)

        if current.keys.isEmpty {
            current.remove()
        }
    }
    
    func dec(_ key: String) {
        guard let current = nodes[key] else { return }

        if current.count == 1 {
            nodes[key] = nil
        } else {
            let prev = current.prev

            if prev === root || prev!.count < current.count - 1 {
                nodes[key] = prev?.appended(node: ListNode2(count: current.count - 1, key: key))
            } else {
                _ = prev?.keys.insert(key)
                nodes[key] = prev
            }
        }

        _ = current.keys.remove(key)

        if current.keys.isEmpty {
            current.remove()
        }
    }
    
    func getMaxKey() -> String {
        root.prev?.keys.first ?? ""
    }
    
    func getMinKey() -> String {
        root.next?.keys.first ?? ""
    }
}

class ListNode2 {
    var count: Int
    var keys = Set<String>()

    weak var prev: ListNode2?
    var next: ListNode2?

    init(count: Int, key: String) {
        self.keys = [key]
        self.count = count
    }

    func appended(node: ListNode2) -> ListNode2 {
        node.next = next
        node.prev = self

        next?.prev = node
        next = node

        return node
    }

    func remove() {
        prev?.next = next
        next?.prev = prev
    }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * let obj = AllOne()
 * obj.inc(key)
 * obj.dec(key)
 * let ret_3: String = obj.getMaxKey()
 * let ret_4: String = obj.getMinKey()
 */
    