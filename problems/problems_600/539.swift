// 539. Minimum Time Difference
// Solved
// Medium
// Topics
// Companies
// 
// Given a list of 24-hour clock time points in "HH:MM" format, return the minimum minutes difference between any 
// two time-points in the list.
 
// Example 1:
// Input: timePoints = ["23:59","00:00"]
// Output: 1
//
// Example 2:
// Input: timePoints = ["00:00","23:59","00:00"]
// Output: 0

// Constraints:
// 2 <= timePoints.length <= 2 * 10^4
// timePoints[i] is in the format "HH:MM".


// Time complexity: O(n + k * log(k)), n > k
// Memory complexity: O(k)
class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var setMinutes = Set<Int>()
        let dayMinutes = 24 * 60

        for time in timePoints {
            let hoursMinute = time.split(separator: ":").map { Int($0)! }
            let minutes = hoursMinute[0] * 60 + hoursMinute[1]

            if !setMinutes.insert(minutes).0 {
                return 0
            }
        }


        var minMinutes = 24 * 60
        let sortedMinutes = setMinutes.sorted { $0 < $1 }

        for idx in 0..<(sortedMinutes.count - 1) {
            minMinutes = min(minMinutes, sortedMinutes[idx + 1] - sortedMinutes[idx])
            minMinutes = min(minMinutes, dayMinutes + sortedMinutes[0] - sortedMinutes[idx + 1])
        }

        return minMinutes
    }
}