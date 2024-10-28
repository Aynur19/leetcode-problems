// 2458. Height of Binary Tree After Subtree Removal Queries
// Solved
// Hard
// Topics: Array, Tree, Depth-First Search, Breadth-First Search, Binary Tree
// Companies
// 
// Description:
//     You are given the root of a binary tree with n nodes. Each node is assigned a unique value from 1 to n. 
//     You are also given an array queries of size m.
// 
//     You have to perform m independent queries on the tree where in the ith query you do the following:
//     - Remove the subtree rooted at the node with the value queries[i] from the tree. 
//       It is guaranteed that queries[i] will not be equal to the value of the root.
// 
//     Return an array answer of size m where answer[i] is the height of the tree after performing the ith query.
// 
//     Note:
//     - The queries are independent, so the tree returns to its initial state after each query.
//     - The height of a tree is the number of edges in the longest simple path from the root to some node in the tree.
// 
// Example 1:
// Input: root = [1,3,4,2,null,6,5,null,null,null,null,null,7], queries = [4]
// Output: [2]
// Explanation: The diagram above shows the tree after removing the subtree rooted at node with value 4.
//     The height of the tree is 2 (The path 1 -> 3 -> 2).
// 
// Example 2:
//     Input: root = [5,8,9,2,1,3,7,4,6], queries = [3,2,4,8]
//     Output: [3,2,3,2]
//     Explanation: We have the following queries:
//         - Removing the subtree rooted at node with value 3. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 4).
//         - Removing the subtree rooted at node with value 2. The height of the tree becomes 2 (The path 5 -> 8 -> 1).
//         - Removing the subtree rooted at node with value 4. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 6).
//         - Removing the subtree rooted at node with value 8. The height of the tree becomes 2 (The path 5 -> 9 -> 3).
// 
// Constraints:
//     The number of nodes in the tree is n.
//     2 <= n <= 10^5
//     1 <= Node.val <= n
//     All the values in the tree are unique.
//     m == queries.length
//     1 <= m <= min(n, 10^4)
//     1 <= queries[i] <= n
//     queries[i] != root.val


// Help: https://algo.monster/liteproblems/2458
// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
        var nodeLevelDict = [Int: Int]()
        _ = calculateDepth(node: root, dict: &nodeLevelDict)

        var result = [Int: Int]()

        func dfs(node: TreeNode?, depth: Int, maxVisibleVal: Int) {
            guard let node = node else { return }

            let depth = depth + 1
            result[node.val] = maxVisibleVal

            let leftMaxVisibleVal = max(maxVisibleVal, depth + (nodeLevelDict[node.right?.val ?? -1] ?? 0))
            dfs(node: node.left, depth: depth, maxVisibleVal: leftMaxVisibleVal)

            let rightMaxVisibleVal = max(maxVisibleVal, depth + (nodeLevelDict[node.left?.val ?? -1] ?? 0))
            dfs(node: node.right, depth: depth, maxVisibleVal: rightMaxVisibleVal)
        }

        dfs(node: root, depth: -1, maxVisibleVal: 0)

        return queries.compactMap { result[$0] }
    }

    func calculateDepth(node: TreeNode?, dict: inout [Int: Int]) -> Int {
        guard let node = node else { return 0 }

        let left = calculateDepth(node: node.left, dict: &dict)
        let right = calculateDepth(node: node.right, dict: &dict)
        let current = max(left, right) + 1
        
        dict[node.val] = current
        return current
    }
}