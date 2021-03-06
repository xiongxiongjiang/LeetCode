//
//  048.旋转图像.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/12.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个 n × n 的二维矩阵表示一个图像。
 将图像顺时针旋转 90 度。

 说明：
 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。

 示例 1:
 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],
 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 
 示例 2:
 给定 matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],
 原地旋转输入矩阵，使其变为:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 */


extension Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if n <= 1 {
            return
        }
        for i in 0..<(n+1)/2 {
            for j in 0..<n/2 {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[n-1-j][i]
                matrix[n-1-j][i] = matrix[n-1-i][n-1-j]
                matrix[n-1-i][n-1-j] = matrix[j][n-1-i]
                matrix[j][n-1-i] = tmp
            } 
        }
        print(matrix)
    }
}

func test048(s: Solution) {
    var matrix = [
      [5, 1,9,11],
      [2, 4,8,10],
      [13,3,6,7],
      [15,14,12,16]
    ]
    s.rotate(&matrix)
}
