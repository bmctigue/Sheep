import Foundation

class Solution {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var results: [[Int]] = []
        
        for i in 0..<words.count {
            for j in 0..<words.count {
                if i != j {
                    let combined = words[i] + words[j]
                    if isPalindrome(s: combined) {
                        results.append([i,j])
                    }
                }
            }
        }
        return results
    }

    func isPalindrome(s: String) -> Bool {
        if s.count < 2 {
            return true
        }
        let start = s.index(s.startIndex, offsetBy: 0)
        let end = s.index(s.endIndex, offsetBy: -1)
        if s[start] != s[end] {
            return false
        }
        if s.count > 2 {
            let subStart = s.index(s.startIndex, offsetBy: 1)
            let subEnd = s.index(s.endIndex, offsetBy: -2)
            let subString = String(s[subStart...subEnd])
            return isPalindrome(s: subString)
        }
        return true
    }
}

let s = "a"
//let s = "abcd"
//let s = "slddls"
let solution = Solution()

//print(solution.isPalindrome(s: s))

let words = ["abcd","dcba","lls","s","sssll"]
print(solution.palindromePairs(words))
