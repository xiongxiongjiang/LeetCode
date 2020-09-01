//
//  701.二叉搜索树中的插入操作.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定二叉搜索树（BST）的根节点和要插入树中的值，将值插入二叉搜索树。 返回插入后二叉搜索树的根节点。 保证原始二叉搜索树中不存在新值。

 注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。 你可以返回任意有效的结果。

 例如,

 给定二叉搜索树:
         4
        / \
       2   7
      / \
     1   3
 和 插入的值: 5
 
 你可以返回这个二叉搜索树:

          4
        /   \
       2     7
      / \   /
     1   3 5
 
 或者这个树也是有效的:
 
          5
        /   \
       2     7
      / \
     1   3
          \
           4
 */

extension Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if val > root.val {
            root.right = insertIntoBST(root.right, val)
        } else {
            root.left = insertIntoBST(root.left, val)
        }
        return root
    }
    
    func insertIntoBST2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var node = root
        while node != nil {
            if val > node!.val {
                if node?.right != nil {
                    node = node?.right
                } else {
                    node?.right = TreeNode(val)
                    return root
                }
            } else {
                if node?.left != nil {
                    node = node?.left
                } else {
                    node?.left = TreeNode(val)
                    return root
                }
            }
        }
        return TreeNode(val)
    }

}
