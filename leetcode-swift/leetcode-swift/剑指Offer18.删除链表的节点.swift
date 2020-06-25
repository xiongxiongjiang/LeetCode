//
//  剑指Offer18.删除链表的节点.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/25.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

 返回删除后的链表的头节点。

 注意：此题对比原题有改动

 示例 1:
 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 
 示例 2:
 输入: head = [4,5,1,9], val = 1
 输出: [4,5,9]
 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
  
 说明：
 题目保证链表中节点的值互不相同
 若使用 C 或 C++ 语言，你不需要 free 或 delete 被删除的节点
 */

extension Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        let prev: ListNode? = ListNode(-1)
        prev?.next = head
        var curr = prev
        while curr?.next != nil {
            if curr?.next?.val == val {
                curr?.next = curr?.next?.next
                break
            } else {
                curr = curr?.next
            }
        }
        return prev?.next
    }
}

func testOffer18(s: Solution) {
    let arr = [4, 5, 1, 9]
    ListNode.printNode(node: s.deleteNode(ListNode.buildNode(arr: arr), 1))
}
