//
//  Problem_787.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 23.02.2024.
//

//  787. Cheapest Flights Within K Stops
//  Medium
//  Topics

//  There are n cities connected by some number of flights.
//  You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is
//  a flight from city fromi to city toi with cost pricei.
//
//  You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops.
//  If there is no such route, return -1.

//  Example 1:
//  Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
//  Output: 700
//  Explanation:
//      The graph is shown above.
//      The optimal path with at most 1 stop from city 0 to 3 is marked in red and has cost 100 + 600 = 700.
//      Note that the path through cities [0,1,2,3] is cheaper but is invalid because it uses 2 stops.
//
//  Example 2:
//  Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1
//  Output: 200
//  Explanation:
//      The graph is shown above.
//      The optimal path with at most 1 stop from city 0 to 2 is marked in red and has cost 100 + 100 = 200.
//
//  Example 3:
//  Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 0
//  Output: 500
//  Explanation:
//      The graph is shown above.
//      The optimal path with no stops from city 0 to 2 is marked in red and has cost 500.
 
//  Constraints:
//  1 <= n <= 100
//  0 <= flights.length <= (n * (n - 1) / 2)
//  flights[i].length == 3
//  0 <= from_i, to_i < n
//  from_i != toi
//  1 <= price_i <= 10^4
//  There will not be any multiple flights between two cities.
//  0 <= src, dst, k < n
//  src != dst

//  help: https://www.youtube.com/watch?v=ZugKHc_0jKI&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    // Approach:
    // Time complexity: O(n^2) = 37 ms
    // Space complexity: O(n) = 16.10 MB
    static func problem_787_findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let INF = 1_000_000_000
        let SRC = 0
        let DST = 1
        let PRICE = 2
        
        // [maxIntermediate][last] -> min cost to reach 'last' from 'src'
        // using not more than 'maxIntermediate' vertices.
        var minCost: [[Int]] = Array(repeating: .init(repeating: INF, count: n), count: 1 + k)
        
        for flight in flights {
            if flight[SRC] == src {
                minCost[0][flight[DST]] = min(minCost[0][flight[DST]], flight[PRICE])
            }
        }
        
        minCost[0][src] = 0
        var kk = 1
        while kk <= k {
            for i in 0..<n {
                minCost[kk][i] = minCost[kk - 1][i]
            }
            
            for flight in flights {
                let s = flight[SRC]
                let d = flight[DST]
                let p = flight[PRICE]
                
                minCost[kk][d] = min(minCost[kk][d], minCost[kk - 1][s] + p)
            }
            
            kk += 1 
        }
        
        return minCost[k][dst] == INF ? -1 : minCost[k][dst]
    }
}
