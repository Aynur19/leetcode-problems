//
//  Problem_350.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

//  350. Intersection of Two Arrays II
//  Easy
//  Topics

//  Given two integer arrays nums1 and nums2, return an array of their intersection.
//  Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

//  Example 1:
//  Input: nums1 = [1,2,2,1], nums2 = [2,2]
//  Output: [2,2]
//
//  Example 2:
//  Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//  Output: [4,9]
//  Explanation: [9,4] is also accepted.
 
//  Constraints:
//  1 <= nums1.length, nums2.length <= 1000
//  0 <= nums1[i], nums2[i] <= 1000
 
//  Follow up:
//  - What if the given array is already sorted? How would you optimize your algorithm?
//  - What if nums1's size is small compared to nums2's size? Which algorithm is better?
//  - What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

//  help: https://www.youtube.com/watch?v=QgsZ3BI1Xc8
extension Problems {
    // Approach: Hash Table
    // Time complexity: O(n + m) = 17 ms
    // Space complexity: O(min(n, m)) = 15.56 MB
    static func problem_350_intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var dict = [Int:Int]()
            nums1.forEach { num in
                dict[num, default: 0] += 1
            }
            
            var result = [Int]()
            nums2.forEach { num in
                if let count = dict[num] {
                    result.append(num)
                    dict[num] = count > 1 ? count - 1 : nil
                }
            }
            
            return result
        }
        
        return nums1.count > nums2.count ? intersect(nums2, nums1) : intersect(nums1, nums2)
    }
    
    // Approach: Binary Search, Sorting, Data Composition
    // Time complexity: O((max(n, m) + min(n, m)) * log min(n, m)) = 16 ms
    // Space complexity: O(min(n, m)) = 15.69 MB
    static func problem_350_intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        class Pair {
            let num: Int
            var count: Int
            
            init(_ num: Int, count: Int = 1) {
                self.num = num
                self.count = count
            }
        }
        
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let sortedNums1 = nums1.sorted()
            var counts = [Pair]()

            var count = 1
            if sortedNums1.count > 1 {
                for idx in 1..<sortedNums1.count {
                    if sortedNums1[idx] == sortedNums1[idx - 1] {
                        count += 1
                    } else {
                        counts.append(.init(sortedNums1[idx - 1], count: count))
                        count = 1
                    }
                }
            }
            counts.append(.init(sortedNums1[sortedNums1.count - 1], count: count))
            
            var result = [Int]()
            nums2.forEach { num in
                if let pair = counts.lowerBound(where: { $0.num < num }),
                   pair.count > 0 && pair.num == num {
                    result.append(pair.num)
                    pair.count -= 1
                }
            }
            
            return result
        }
        
        guard !nums1.isEmpty, !nums2.isEmpty else { return [] }
        
        return nums1.count > nums2.count ? intersect(nums2, nums1) : intersect(nums1, nums2)
    }
    
    // Approach: Binary Search, Sorting
    // Time complexity: O(max(n, m) + min(n, m)) * log min(n, m)) = 21 ms
    // Space complexity: O(min(n, m)) = 15.66 MB
    static func problem_350_intersect3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        class Pair {
            let num: Int
            var present: Bool
            
            init(_ num: Int, present: Bool) {
                self.num = num
                self.present = present
            }
        }
        
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let pairs = nums1.sorted().compactMap { num in
                Pair(num, present: true)
            }
            
            var result = [Int]()
            nums2.forEach { num in
                if let pair = pairs.lowerBound(where: { $0.num < num || $0.num == num && !$0.present }),
                   pair.num == num {
                    result.append(pair.num)
                    pair.present = false
                }
            }
            
            return result
        }
        
        guard !nums1.isEmpty, !nums2.isEmpty else { return [] }
        
        return nums1.count > nums2.count ? intersect(nums2, nums1) : intersect(nums1, nums2)
    }
    
    // Approach: Two Pointer
    // Time complexity: O(n * log n + m * log m + n) = 15 ms
    //      without sorting: O(n)
    // Space complexity: O(n + m) = 15.50 MB
    //      without sorting: O(1)
    static func problem_350_intersect4(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard !nums1.isEmpty, !nums2.isEmpty else { return [] }
        
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        
        var ptr1 = 0, ptr2 = 0
        var result = [Int]()
        
        while ptr1 < nums1.count && ptr2 < nums2.count {
            if nums1[ptr1] == nums2[ptr2] {
                result.append(nums1[ptr1])
                ptr1 += 1
                ptr2 += 1
            } else if nums1[ptr1] > nums2[ptr2] {
                ptr2 += 1
            } else {
                ptr1 += 1
            }
        }
        
        return result
    }
}
