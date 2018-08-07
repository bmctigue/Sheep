import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = abs(x)
        
        if x == 0 {
            return 0
        }
        
        var rev = 0
        while num > 0 {
            let r = num % 10
            rev = (rev * 10) + r
            num = num / 10
        }
        
        if rev > Int32.max {
            return 0
        }
        
        let sign = abs(x)/x
        rev = rev * sign
        return rev
    }
}

//let x = 123
//let x = -123
let x = 120
let solution = Solution()

print(solution.reverse(x))
print(Int32.max)
2147483647
1534236469
