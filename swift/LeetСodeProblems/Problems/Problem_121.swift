//
//  Problem_121.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 17.01.2024.
//

//  121. Best Time to Buy and Sell Stock
//  Easy
//  Topics

//  You are given an array prices where prices[i] is the price of a given stock on the ith day.
//
//  You want to maximize your profit by choosing a single day to buy one stock
//  and choosing a different day in the future to sell that stock.
//
//  Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

//  Example 1:
//  Input: prices = [7,1,5,3,6,4]
//  Output: 5
//  Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//  Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
//
//  Example 2:
//  Input: prices = [7,6,4,3,1]
//  Output: 0
//  Explanation: In this case, no transactions are done and the max profit = 0.
 
//  Constraints:
//  1 <= prices.length <= 10^5
//  0 <= prices[i] <= 10^4

extension Problems {
    // Approach: Array, Dynamic Programming
    // Time complexity: O(n) = 823 ms
    // Space complexity: O(1) = 19.44 MB
    static func problem_121_maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var minPrice = prices[0]
        var maxProfit = 0
        
        for i in 1..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else {
                maxProfit = max(maxProfit, prices[i] - minPrice)
            }
        }
        
        return maxProfit
    }
}

