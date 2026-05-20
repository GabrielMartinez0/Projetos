#
# @lc app=leetcode id=26 lang=python
#
# [26] Remove Duplicates from Sorted Array
#

# @lc code=start
class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        exist = []
        count = 0
        i=0
        while i < len(nums):
            if nums[i] not in exist:
                count+=1
                exist.append(nums[i])
            else:
                nums.pop(i)
                i-=1
            i += 1
        return count
# @lc code=end