//
//  GuessGame.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

//  374. Guess Number Higher or Lower
//  Easy
//  Topics: Binary Search, Interactive

//  We are playing the Guess Game. The game is as follows:
//
//  I pick a number from 1 to n. You have to guess which number I picked.
//
//  Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.
//
//  You call a pre-defined API int guess(int num), which returns three possible results:
//  - -1: Your guess is higher than the number I picked (i.e. num > pick).
//  - 1: Your guess is lower than the number I picked (i.e. num < pick).
//  - 0: your guess is equal to the number I picked (i.e. num == pick).
//
//  Return the number that I picked.

//  Example 1:
//  Input: n = 10, pick = 6
//  Output: 6
//
//  Example 2:
//  Input: n = 1, pick = 1
//  Output: 1
//
//  Example 3:
//  Input: n = 2, pick = 1
//  Output: 1
 
//  Constraints:
//  1 <= n <= 2^31 - 1
//  1 <= pick <= n

public class GuessGame {
    private var pick: Int
    private var n: Int
    
    init(_ n: Int, pick: Int) {
        self.pick = pick
        self.n = n
    }
    
    func guess(_ num: Int) -> Int {
        if pick == num { return 0 }
        if pick < num { return -1 }
        return 1
    }
}

public final class GuessGamePlayer: GuessGame {
    // Approach: Binary Search
    // Time complexity: O(log n) = 4 ms
    // Space complexity: O(1) = 14.78 MB
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        var current = (right + left) / 2
        
        while true {
            let result = guess(current)
            
            if result == 0 { return current }
            if result == -1 {
                right = current - 1
            } else {
                left = current + 1
            }
            
            current = (right + left) / 2
        }
    }
}
