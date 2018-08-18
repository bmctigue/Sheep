import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let subArr: [Int] = []
        let results:[[Int]] = []
        let nums = candidates.sorted()
        return backTrack(arr: nums, remainder: target, start: 0, subArr: subArr, results: results)
    }
    
    func backTrack(arr: [Int], remainder: Int, start: Int, subArr: [Int], results: [[Int]]) -> [[Int]] {
        guard remainder >= 0 else {
            return results
        }
        var results = results
        var subArr = subArr
        let sorted = subArr.sorted()
        if remainder == 0 && !results.contains(sorted) {
            results.append(sorted)
            return results
        }
        for i in start..<arr.count {
            subArr.append(arr[i])
            results = backTrack(arr: arr, remainder: remainder - arr[i], start: start, subArr: subArr, results: results)
            subArr.remove(at: subArr.count - 1)
        }
        return results
    }
}

//let candidates = [2,3,6,7]
//let target = 7

let candidates = [2,3,5]
let target = 8

let solution = Solution()

print(solution.combinationSum(candidates, target))
