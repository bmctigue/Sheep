
// Definition for an interval.
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
 }

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        if intervals.count == 1 || intervals.isEmpty {
            return true
        }
        let sorted = intervals.sorted(by: { $0.start < $1.start})
        for i in 1..<sorted.count {
            print(sorted[i].start)
            print(sorted[i].end)
            if sorted[i].start < sorted[i-1].end {
                return false
            }
        }
        
        return true
    }
}

let int1 = Interval(0,30)
let int2 = Interval(5,10)
let int3 = Interval(15,20)
let intervals: [Interval] = [int1,int2,int3]

let int4 = Interval(7,10)
let int5 = Interval(2,4)
//let intervals: [Interval] = [int4,int5]

let solution = Solution()

print(solution.canAttendMeetings(intervals))
