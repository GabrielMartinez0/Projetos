#
# @lc app=leetcode id=69 lang=python
#
# [69] Sqrt(x)
#

# @lc code=start
class Solution(object):
    def mySqrt(self, x):
        """
        :type x: int
        :rtype: int
        """
        out = 0

        while True:
            square = out*out
            if square < x:
                out += 1
            elif square == x:
                return out
            elif square > x:
                return out-1
# @lc code=end

