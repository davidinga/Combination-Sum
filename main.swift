/*
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the 
frequency
 of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 

Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
Example 2:

Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
Example 3:

Input: candidates = [2], target = 1
Output: []
 

Constraints:

1 <= candidates.length <= 30
2 <= candidates[i] <= 40
All elements of candidates are distinct.
1 <= target <= 40
Accepted
1.4M
Submissions
*/

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else { return [] }
    var result: [[Int]] = []
    var slate: [Int] = []

    func helper(_ slate: inout [Int], _ sum: Int, _ i: Int) {
        if sum == target {
            result.append(slate)
            return
        }

        if i >= candidates.count { return }

        if sum > target { return }

        helper(&slate, sum, i + 1)

        var sum = sum
        var currCount = 0

        while sum <= target {
            slate.append(candidates[i])
            sum += candidates[i]
            helper(&slate, sum, i + 1)
            currCount += 1
        }

        slate.removeLast(currCount)
    }

    helper(&slate, 0, 0)

    return result
}