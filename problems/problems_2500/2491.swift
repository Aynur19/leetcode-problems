// 2491. Divide Players Into Teams of Equal Skill
// Solved
// Medium
// Topics: Array, Hash Table, Two Pointers, Sorting
// Companies

// You are given a positive integer array skill of even length n where skill[i] denotes the skill of the ith player. 
// Divide the players into n / 2 teams of size 2 such that the total skill of each team is equal.
// 
// The chemistry of a team is equal to the product of the skills of the players on that team.
// 
// Return the sum of the chemistry of all the teams, or return -1 if there is no way to divide the players into teams 
// such that the total skill of each team is equal.

// Example 1:
// Input: skill = [3,2,5,1,3,4]
// Output: 22
// Explanation: 
//      Divide the players into the following teams: (1, 5), (2, 4), (3, 3), where each team has a total skill of 6.
//      The sum of the chemistry of all the teams is: 1 * 5 + 2 * 4 + 3 * 3 = 5 + 8 + 9 = 22.
//
// Example 2:
// Input: skill = [3,4]
// Output: 12
// Explanation: 
//      The two players form a team with a total skill of 7.
//      The chemistry of the team is 3 * 4 = 12.
//
// Example 3:
// Input: skill = [1,1,2,3]
// Output: -1
// Explanation: 
//      There is no way to divide the players into teams such that the total skill of each team is equal.

// Constraints:
// 2 <= skill.length <= 10^5
// skill.length is even.
// 1 <= skill[i] <= 1000


// Hint
// 1. Try sorting the skill array.
//
// 2. It is always optimal to pair the weakest available player with the strongest available player.


// Time complexity: O(n log n)
// Memory complexity: O(n)
class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        var sortedSkills = skill.reduce(into: [Int:Int]()) { result, item in
            result[item, default: 0] += 1
        }.sorted { $0.key < $1.key }

        var (left, right) = (0, sortedSkills.count - 1)
        var totalSkill = sortedSkills[left].key + sortedSkills[right].key
        var chemistries = 0

        while left <= right {
            let currentSkill = sortedSkills[left].key + sortedSkills[right].key
            if currentSkill != totalSkill { return -1 }

            chemistries += sortedSkills[left].key * sortedSkills[right].key

            sortedSkills[left].value -= 1 
            sortedSkills[right].value -= 1

            if sortedSkills[left].value == 0 { 
                left += 1 
            }

            if sortedSkills[right].value == 0 { 
                right -= 1 
            }
        }

        return chemistries
    }
}
