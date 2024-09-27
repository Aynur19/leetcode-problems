# 440. K-th Smallest in Lexicographical Order
# Solved
# Hard
# Topics: Trie
# Companies

# Given two integers n and k, return the kth lexicographically smallest integer in the range [1, n].

# Example 1:
# Input: n = 13, k = 2
# Output: 10
# Explanation: The lexicographical order is [1, 10, 11, 12, 13, 2, 3, 4, 5, 6, 7, 8, 9], so the second smallest number is 10.
#
# Example 2:
# Input: n = 1, k = 1
# Output: 1

# Constraints:
# 1 <= k <= n <= 10^9


# Help: https://www.youtube.com/watch?v=qzEDndBdWlg&ab_channel=CodeCrusaders
# Time ccomplexity: O((log n)^2)
# Memory complexity: O(1)
class Solution:
    def findKthNumber(self, n: int, k: int) -> int:
        current = 1
        k = k - 1

        while k > 0:
            steps = self.countSteps(n=n, current=current, next=current + 1)

            if steps <= k:
                current += 1
                k -= steps
            else:
                current *= 10
                k -= 1

        return current

    def countSteps(self, n: int, current: int, next: int) -> int:
        steps = 0

        while current <= n:
            steps += min(n + 1, next) - current
            current *= 10
            next *= 10

        return steps
        