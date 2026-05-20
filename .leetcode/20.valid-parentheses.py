#
# @lc app=leetcode id=20 lang=python
#
# [20] Valid Parentheses
#

# @lc code=start
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        data = []
        maps= {
            ")":"(",
            "}":"{",
            "]":"["
        }
        
        for char in s:
            if char in "({[":
                data.append(char)
            else:
                if len(data)==0:
                    return False
                charMain = data.pop()
                if(charMain != maps[char]):
                    return False
        if(len(data)==0):
            return True
        return False
                
# @lc code=end

