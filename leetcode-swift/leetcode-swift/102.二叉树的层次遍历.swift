//
//  102. 二叉树的层次遍历.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
 */

extension Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var stack = [TreeNode]()
        var res = [[Int]]()
        stack.append(root)
        while stack.isEmpty == false {
            var level = [Int]() //存放该层所有数值
            for _ in 0..<stack.count {
                let node = stack.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
}

/*
   3
  / \
 9  20
   /  \
  15   7
 */

func test102(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    let node1 = TreeNode(10)
    nodeB.left = node1
    let node2 = TreeNode(12)
    nodeD.left = node2
    
    print(s.levelOrder(nodeA))
}
