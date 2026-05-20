#
# @lc app=leetcode id=35 lang=python
#
# [35] Search Insert Position
#

# @lc code=start
class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        i=0
        while i < len(nums):
            if nums[i] >= target:
                return i
            i+=1
        return len(nums)
        
# @lc code=end

