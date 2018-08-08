import Foundation

class Solution {
    func pourWater(_ heights: [Int], _ V: Int, _ K: Int) -> [Int] {
        var heights = heights
        for _ in 0..<V {
            let minIndex = getFirstHoleLeft(heights: heights, K: K)
            if minIndex != K {
                heights[minIndex] += 1
            } else {
                heights[getFirstHoleRight(heights: heights, K: K)] += 1
            }
        }
        return heights
    }

    func getFirstHoleLeft(heights: [Int], K: Int) -> Int {
        var min = heights[K]
        var minIndex = K
        
        for j in stride(from: K-1, to: -1, by: -1) {
            if heights[j] <= min {
                if heights[j] < min {
                    minIndex = j
                }
                min = heights[j]
            } else {
                break
            }
        }
        return minIndex
    }

    func getFirstHoleRight(heights: [Int], K: Int) -> Int {
        var min = heights[K]
        var minIndex = K
        
        for j in K+1..<heights.count {
            if heights[j] <= min {
                if heights[j] < min {
                    minIndex = j
                }
                min = heights[j]
            } else {
                break
            }
        }
        return minIndex
    }
}

//let heights = [2,1,1,2,1,2,2]
//let V = 4
//let K = 3

//let heights = [1,2,3,4]
//let V = 2
//let K = 2

let heights = [3,1,3]
let V = 5
let K = 1

let solution = Solution()
print(solution.pourWater(heights, V, K))


