// 874. Walking Robot Simulation
// Solved
// Medium
// Topics: Array, Hash Table, Simulation
// Companies

// A robot on an infinite XY-plane starts at point (0, 0) facing north. The robot can receive a sequence of these three 
// possible types of commands:
//      -2: Turn left 90 degrees.
//      -1: Turn right 90 degrees.
//      1 <= k <= 9: Move forward k units, one unit at a time.
// Some of the grid squares are obstacles. The ith obstacle is at grid point obstacles[i] = (xi, yi). 
// If the robot runs into an obstacle, then it will instead stay in its current location and move on to the next command.
// 
// Return the maximum Euclidean distance that the robot ever gets from the origin squared (i.e. if the distance is 5, return 25).
// 
// Note:
//      North means +Y direction.
//      East means +X direction.
//      South means -Y direction.
//      West means -X direction.
//      There can be obstacle in [0,0].

// Example 1:
// Input: commands = [4,-1,3], obstacles = []
// Output: 25
// Explanation: The robot starts at (0, 0):
//      1. Move north 4 units to (0, 4).
//      2. Turn right.
//      3. Move east 3 units to (3, 4).
//      The furthest point the robot ever gets from the origin is (3, 4), which squared is 32 + 42 = 25 units away.
//
// Example 2: 
// Input: commands = [4,-1,4,-2,4], obstacles = [[2,4]]
// Output: 65
// Explanation: The robot starts at (0, 0):
//      1. Move north 4 units to (0, 4).
//      2. Turn right.
//      3. Move east 1 unit and get blocked by the obstacle at (2, 4), robot is at (1, 4).
//      4. Turn left.
//      5. Move north 4 units to (1, 8).
//      The furthest point the robot ever gets from the origin is (1, 8), which squared is 12 + 82 = 65 units away.
//
// Example 3:
// Input: commands = [6,-1,-1,6], obstacles = []
// Output: 36
// Explanation: The robot starts at (0, 0):
//      1. Move north 6 units to (0, 6).
//      2. Turn right.
//      3. Turn right.
//      4. Move south 6 units to (0, 0).
//      The furthest point the robot ever gets from the origin is (0, 6), which squared is 62 = 36 units away.

// Constraints:
// 1 <= commands.length <= 10^4
// commands[i] is either -2, -1, or an integer in the range [1, 9].
// 0 <= obstacles.length <= 10^4
// -3 * 10^4 <= x_i, y_i <= 3 * 10^4
// The answer is guaranteed to be less than 2^31.


// Time complexity: O(n * m)
// Memory complexity: O(obstacles.count)
class Solution {
    struct Coord: Hashable {
        var x: Int
        var y: Int

        static func + (left: Coord, right: Coord) -> Coord {
            Coord(x: left.x + right.x, y: left.y + right.y)
        }

        static func += (left: inout Coord, right: Coord) {
            left.x += right.x
            left.y += right.y
        }

        var distance: Int {
           x * x + y * y
        }

        mutating func rotate(toLeft: Bool) {
            let dirToLeft = toLeft ? -1 : 1

            if x == 1 {
                x = 0
                y = dirToLeft
            } else if x == -1 {
                x = 0
                y = -dirToLeft
            } else if y == 1 {
                x = -dirToLeft
                y = 0
            } else if y == -1 {
                x = dirToLeft
                y = 0
            }
        }
    }

    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var obstacles = obstacles.reduce(into: Set()) { result, item in
            result.insert(Coord(x: item[0], y: item[1]))
        }

        var direction = Coord(x: 0, y: 1)
        var current = Coord(x: 0, y: 0)
        var maxDistance = 0

        for command in commands {
            if command > 0 {
                for _ in 0..<command {
                    let nextPosition = current + direction
                    if obstacles.contains(nextPosition) {
                        maxDistance = max(maxDistance, current.distance)
                        continue
                    }

                    current += direction
                }
            } else {
                direction.rotate(toLeft: command == -1)
                maxDistance = max(maxDistance, current.distance)
            }
        }
        maxDistance = max(maxDistance, current.distance)

        return maxDistance
    }
}