import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numHash: [Int:Int] = [:]
        var results: [Int] = []
        for i in 0..<nums.count {
            let key = target - nums[i]
            if let index = numHash[key] {
                results = [index,i]
            } else {
                numHash[nums[i]] = i
            }
        }
        return results
    }
}
