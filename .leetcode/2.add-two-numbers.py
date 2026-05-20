#
# @lc app=leetcode id=2 lang=python
#
# [2] Add Two Numbers
#

# @lc code=start
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
        
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: Optional[ListNode]
        :type l2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        tempL1 = l1
        tempL2 = l2
        head = None
        carry=0
        while tempL1 or tempL2:
            num1 = tempL1.val or 0
            num2 = tempL2.val or 0
            if(num1 + num2 +carry>=10):
                currentVal = num1+num2+carry-10
                carry=1
            else:
                currentVal = num1+num2+carry
                carry=0
            out = ListNode(currentVal,head)
            print(out)
            head = out
            tempL1 = tempL1.next
            tempL2 = tempL2.next
        if carry:
            out = ListNode(carry,head)
            head = out

        return head
# @lc code=end

