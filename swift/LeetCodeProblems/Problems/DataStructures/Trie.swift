//
//  Trie.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 07.03.2024.
//

//  208. Implement Trie (Prefix Tree)
//  Medium
//  Topics: Hash Table, String, Design, Trie

//  A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys 
//  in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
//
//  Implement the Trie class:
//  - Trie() Initializes the trie object.
//  - void insert(String word) Inserts the string word into the trie.
//  - boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
//  - boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix,
//    and false otherwise.

//  Example 1:
//  Input
//      ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
//      [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
//  Output
//      [null, null, true, false, true, null, true]
//
//  Explanation
//      Trie trie = new Trie();
//      trie.insert("apple");
//      trie.search("apple");   // return True
//      trie.search("app");     // return False
//      trie.startsWith("app"); // return True
//      trie.insert("app");
//      trie.search("app");     // return True

//  Constraints:
//  1 <= word.length, prefix.length <= 2000
//  word and prefix consist only of lowercase English letters.
//  At most 3 * 10^4 calls in total will be made to insert, search, and startsWith.

protocol TrieProtocol {
    func insert(_ word: String)
    
    func search(_ word: String) -> Bool
    
    func startsWith(_ prefix: String) -> Bool
}

//  Approach: Double Linked List, Stack
//  Time complexity:
//    - O(n)    -> for 1 call of insert(), search(), startsWith()
//    - 146 ms  -> for all calls
//  Space complexity:
//    - O(1) where n - tree depth   -> for 1 call of insert(), search(), startsWith()
//    - 23.22 MB                    -> for all calls
final class Trie {
    class Node {
        var nodes = [Character:Node]()
        var isWord = false
    }
    
    private var root = Node()

    init() { }
    
    func insert(_ word: String) {
        if let addedNode = go(word, addNodes: true) {
            addedNode.isWord = true
        }
    }
    
    func search(_ word: String) -> Bool {
        guard let foundNode = go(word) else { return false }
        
        return foundNode.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard go(prefix) != nil else { return false }
        
        return true
    }
    
    private func go(_ word: String, addNodes: Bool = false) -> Node? {
        var tmp = root
        for char in word {
            if let next = tmp.nodes[char] {
                tmp = next
                continue
            }
            
            if addNodes {
                let next = Node()
                tmp.nodes[char] = next
                tmp = next
            } else { return nil }
        }
        
        return tmp
    }
}


extension Trie {
    private func search(node: Node, chars: inout [Character], idx: Int) -> Bool {
        var tmp = node
        var idx = idx
        
        while idx < chars.count {
            if let next = tmp.nodes[chars[idx]] {
                tmp = next
            } else if chars[idx] == "." {
                for keyVal in tmp.nodes {
                    if search(node: keyVal.value, chars: &chars, idx: idx + 1) {
                        return true
                    }
                }
                
                return false
            } else {
                return false
            }
            
            idx += 1
        }
        
        return tmp.isWord
    }
    
    func searchMatched(_ word: String) -> Bool {
        var chars = Array(word)
        
        return search(node: root, chars: &chars, idx: 0)
    }
}
