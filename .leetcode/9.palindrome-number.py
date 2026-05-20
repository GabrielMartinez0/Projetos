#
# @lc app=leetcode id=9 lang=python
#
# [9] Palindrome Number
#

# @lc code=start
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x<0:
            return False
        main = list(str(x))
        mid = len(main)/2
        i=0
        while i <= mid:
            if(main[i]!=main[-(i+1)]):
                return False
            i=i+1
        return True

        
# @lc code=end

