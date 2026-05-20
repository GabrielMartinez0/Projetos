#
# @lc app=leetcode id=14 lang=python
#
# [14] Longest Common Prefix
#

# @lc code=start
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        out = ""
        if len(strs) == 1:
            return strs[0]
        if "" in strs:
            return ""
        temp = sorted(strs,key=len)
        
        minLen = len(temp[0])

        for j in range(minLen):
            for i in range(len(strs)-1):
                if strs[i][j] != strs[i+1][j]: 
                    return out
            out += strs[i][j]
        return out
        
# @lc code=end