//
//  009. 回文数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:

 输入: 121
 输出: true
 示例 2:

 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:

 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:

 你能不将整数转为字符串来解决这个问题吗？
 */


extension Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x >= 0 && x <= 9 {
            return true
        }
        var nums = [Int]()
        var num = x
        while num >= 10 {
            let y = num % 10
            num = num / 10
            nums.append(y)
        }
        nums.append(num)
        if nums.first == 0 {
            return false
        }
        var z = 0
        for i in 0..<nums.count {
            z = z * 10 + nums[i]
        }
        return z == x
    }
}

func test009(s: Solution) {
    print(s.isPalindrome(1001))
}
