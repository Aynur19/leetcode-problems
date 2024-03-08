//
//  RecentCounter.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

//  933. Number of Recent Calls
//  Easy
//  Topics: Design, Queue, Data Stream

//  You have a RecentCounter class which counts the number of recent requests within a certain time frame.
//
//  Implement the RecentCounter class:
//  - RecentCounter() Initializes the counter with zero recent requests.
//  - int ping(int t) Adds a new request at time t, where t represents some time in milliseconds,
//    and returns the number of requests that has happened in the past 3000 milliseconds
//    (including the new request). Specifically, return the number of requests that have happened
//    in the inclusive range [t - 3000, t].
//  - It is guaranteed that every call to ping uses a strictly larger value of t than the previous call.

//  Example 1:
//  Input
//      ["RecentCounter", "ping", "ping", "ping", "ping"]
//      [[], [1], [100], [3001], [3002]]
//  Output
//      [null, 1, 2, 3, 3]
//  Explanation
//      RecentCounter recentCounter = new RecentCounter();
//      recentCounter.ping(1);     // requests = [1], range is [-2999,1], return 1
//      recentCounter.ping(100);   // requests = [1, 100], range is [-2900,100], return 2
//      recentCounter.ping(3001);  // requests = [1, 100, 3001], range is [1,3001], return 3
//      recentCounter.ping(3002);  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3
 
//  Constraints:
//  1 <= t <= 10^9
//  Each test case will call ping with strictly increasing values of t.
//  At most 10^4 calls will be made to ping.

protocol RecentCounterProtocol {
    func ping(_ t: Int) -> Int
}

//  Approach: Double Linked List
//  Time complexity:
//    - O(1)        -> for 1 call of ping()
//    - 300 ms      -> for all calls
//  Space complexity:
//    - O(1)        -> for 1 call of ping()
//    - 17.59 MB    -> for all calls
//final class RecentCounter1: RecentCounterProtocol {
//    private var head: DoubleLinkedList<Int>?
//    private var end: DoubleLinkedList<Int>?
//    private var count = 0
//    
//    private static let maxPing = 3000
//    
//    init() { }
//    
//    func ping(_ t: Int) -> Int {
//        count += 1
//        
//        if head == nil {
//            head = .init(value: t)
//            end = head
//            return count
//        }
//        
//        head?.setPrev(.init(value: t))
//        head = head?.prev
//        
//        while true {
//            if let val = end?.value {
//                if t - Self.maxPing > val {
//                    end = end?.prev
//                    _ = end?.removeNext()
//                    count -= 1
//                } else { break }
//            }
//        }
//        
//        return count
//    }
//}
//
////  Approach: Queue, Linked List
////  Time complexity:
////    - O(1)        -> for 1 call of ping()
////    - 294 ms      -> for all calls
////  Space complexity:
////    - O(1)        -> for 1 call of ping()
////    - 17.30 MB    -> for all calls
//final class RecentCounter2: RecentCounterProtocol {
//    private let queue: Queue<Int>
//    private var count = 0
//    
//    private static let maxPing = 3000
//    
//    init() { 
//        queue = .init()
//    }
//    
//    func ping(_ t: Int) -> Int {
//        count += 1
//        queue.enqueue(t)
//        
//        while true {
//            if let val = queue.peek() {
//                if t - Self.maxPing > val {
//                    _ = queue.dequeue()
//                    count -= 1
//                } else { break }
//            }
//        }
//        
//        return count
//    }
//}
//
////  Approach: Array, Two Pointers
////  Time complexity:
////    - O(1)        -> for 1 call of ping()
////    - 275 ms      -> for all calls
////  Space complexity:
////    - O(1)        -> for 1 call of ping()
////    - 16.86 MB    -> for all calls
//final class RecentCounter3: RecentCounterProtocol {
//    private var values: [Int]
//    private var count = 0
//    private var firstIdx = -1
//    private var lastIdx = 0
//    
//    private static let maxPing = 3000
//    private let n: Int
//    
//    init() {
//        values = Array(repeating: 0, count: Self.maxPing + 2)
//        n = values.count
//    }
//    
//    func ping(_ t: Int) -> Int {
//        firstIdx = firstIdx < n - 1 ? firstIdx + 1 : 0
//        values[firstIdx] = t
//        count += 1
//        
//        while true {
//            if values[lastIdx] < t - Self.maxPing {
//                lastIdx = lastIdx < n - 1 ? lastIdx + 1 : 0
//                count -= 1
//            } else { break }
//        }
//        
//        return count
//    }
//}
