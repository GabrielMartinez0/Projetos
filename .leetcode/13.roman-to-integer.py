#
# @lc app=leetcode id=13 lang=python
#
# [13] Roman to Integer
#

# @lc code=start
class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        table = {
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        }
        out = 0
        i=0
        while i+1 < len(s):
            if table[s[i]]<table[s[i+1]]:
                out -=table[s[i]]
            else:
                out +=table[s[i]]
            i+=1
        out +=table[s[i]]
        
        return out

            


# @lc code=end

