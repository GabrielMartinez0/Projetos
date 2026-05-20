#
# @lc app=leetcode id=1 lang=python
#
# [1] Two Sum
#

# @lc code=start
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        temp = nums
        i=0
        while i < len(temp)-1:
            j=i+1
            while j < len(temp):
                if(temp[i]+temp[j]==target):
                    return [i,j]
                j=j+1
            i=i+1


# @lc code=end

