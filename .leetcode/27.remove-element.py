#
# @lc app=leetcode id=27 lang=python
#
# [27] Remove Element
#

# @lc code=start
class Solution(object):
    def removeElement(self, nums, val):
        """
        :type nums: List[int]
        :type val: int
        :rtype: int
        """
        count = 0
        i=0
        while i < len(nums):
            if nums[i] == val:
                nums.pop(i)
                i-=1
            else:
                count+=1
            i += 1
        return count
        
# @lc code=end

