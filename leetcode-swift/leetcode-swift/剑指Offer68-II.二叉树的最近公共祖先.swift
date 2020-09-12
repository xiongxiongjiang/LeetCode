//
//  剑指Offer68-II.二叉树的最近公共祖先.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/9.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]

示例 1:
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出: 3
解释: 节点 5 和节点 1 的最近公共祖先是节点 3。

示例 2:
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出: 5
解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 

说明:
所有节点的值都是唯一的。
p、q 为不同节点且均存在于给定的二叉树中。
 
注意：本题与主站 236 题相同：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */


extension Solution {

    /*
     递归解析：
     
     终止条件：
     - 当越过叶节点，则直接返回 null ；
     - 当 root 等于 p,q ，则直接返回 root ；
     
     递推工作：
     - 开启递归左子节点，返回值记为 left ；
     - 开启递归右子节点，返回值记为 right ；
     
     返回值： 根据 left 和 right ，可展开为四种情况；
     - 当 left 和 right 同时为空 ：说明 root 的左 / 右子树中都不包含 p,q ，返回 null ；
     - 当 left 和 right 同时不为空 ：说明 p,q 分列在 root 的 异侧 （分别在 左 / 右子树），因此 root 为最近公共祖先，返回 root ；
     - 当 left 为空 ，right 不为空 ：p,q 都不在 root 的左子树中，直接返回 right 。具体可分为两种情况：
        - p,q 其中一个在 root 的 右子树 中，此时 right 指向 p（假设为 p ）；
        - p,q 两节点都在 root 的 右子树 中，此时的 right 指向 最近公共祖先节点 ；
     - 当 left 不为空 ， right 为空 ：与情况 3. 同理；
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, q: TreeNode?) -> TreeNode? {
        /*
         - 当越过叶节点，则直接返回 null ；
         - 当 root 等于 p,q ，则直接返回 root ；
         */
        if root == nil || root?.val == p?.val || root?.val == q?.val {
            return root
        }
        /*
         - 开启递归左子节点，返回值记为 left ；
         - 开启递归右子节点，返回值记为 right ；
         */
        let left = lowestCommonAncestor(root?.left, p, q: q)
        let right = lowestCommonAncestor(root?.right, p, q: q)
        // 当 left 和 right 同时为空 ：说明 root 的左 / 右子树中都不包含 p,q ，返回 null ；
        if left == nil && right == nil {
            return nil
        }
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        return root
    }
    
}

func testOffer68II(s: Solution) {
    let codec = Codec()
    let root = codec.deserialize("3,5,1,6,2,0,8,null,null,7,4")
    let node = s.lowestCommonAncestor(root, TreeNode(5), q: TreeNode(4))
    print(node?.val ?? 0)
}
