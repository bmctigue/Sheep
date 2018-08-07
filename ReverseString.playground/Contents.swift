//: Playground - noun: a place where people can play

import Foundation

func reverse(_ s: String) -> String {
    return reverse(s: s, i: 0, results: "")
}

func reverse(s: String, i: Int, results: String) -> String {
    
    if i == s.count {
        return results
    }
    
    var results = results
    results = reverse(s: s, i: i+1, results: results)
    
    let index = s.index(s.startIndex, offsetBy: i)
    results.append(String(s[index]))
    return results
}

let s = "a"
//let s = "abcd"
print(reverse(s))
