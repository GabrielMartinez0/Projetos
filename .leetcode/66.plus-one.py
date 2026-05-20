#
# @lc app=leetcode id=66 lang=python
#
# [66] Plus One
#

# @lc code=start
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        i=1
        carry = 1
        while carry == 1:
            if i==len(digits) and digits[-i] == 9:
                digits.insert(0,0)
                
            if digits[-i] + 1 >= 10:
                digits[-i] -= 9
            else:
                digits[-i] += 1
                carry = 0
            i+=1
        return digits
# @lc code=end

