//
//  028. 实现 strStr().swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 实现 strStr() 函数。

 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

 示例 1:
 输入: haystack = "hello", needle = "ll"
 输出: 2
 
 示例 2:
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 
 说明:
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 */

extension Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hc = haystack.count
        let nc = needle.count
        if nc == 0 {
            return 0
        }
        if nc > hc {
            return -1
        }
        let hArr = Array(haystack)
        let nArr = Array(needle)
        var i = 0, j = 0
        while i < hc && j < nc {
            if hArr[i] == nArr[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1
                j = 0
            }
        }
        return j == nc ? i - j : -1
    }
    
}

func test028(s: Solution) {
//    let haystack = "hello"
//    let needle = "ll"
    
//    let haystack = "mississippi"
//    let needle = "issipi"
    
//    let haystack = "a"
//    let needle = "a"
    
    let haystack = "ppmippssissippi"
    let needle = "ppi"
    print(s.strStr(haystack, needle))
}

