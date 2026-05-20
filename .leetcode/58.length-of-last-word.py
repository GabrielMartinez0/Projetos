#
# @lc app=leetcode id=58 lang=python
#
# [58] Length of Last Word
#

# @lc code=start
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        if len(s)<= 1:
            return len(s)
        a=1
        b=0

        while s[-a] == " ":
            a+=1
        b = a
        while s[-b] != " " and b < len(s):
            b+=1
        if s[-b] !=" ":
            b+=1
        return b-a

# @lc code=end

