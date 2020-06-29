//
//  122.买卖股票的最佳时机II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/10.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 设计一个算法来计算你所能获取的最大利润。你可以  尽可能地完成更多  的交易（多次买卖一支股票）。
 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 示例 1:
 输入: [7,1,5,3,6,4]
 输出: 7
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
 
 示例 2:
 输入: [1,2,3,4,5]
 输出: 4
 解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
      因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
 
 示例 3:
 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
  
 提示：
 1 <= prices.length <= 3 * 10 ^ 4
 0 <= prices[i] <= 10 ^ 4
 */

extension Solution {
    
    //贪心算法
    func maxProfit2(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        var profit = 0
        for i in 1..<prices.count {
            let tmp = prices[i] - prices[i - 1]
            //只有赚的情况才买入
            profit = tmp > 0 ? profit + tmp : profit
        }
        return profit
    }
    
    //动态规划
    func maxProfit3(_ prices: [Int]) -> Int {
        let count = prices.count
        if count <= 1 {
            return 0
        }
        //dp[i][j] i 表示第i天，j=1表示持有，j=0表示不持有
        //对于第i天有两种情况：
        // 1)持有 可能是i-1天持有，然后不变。或者第i-1天不持有，然后第i天买入
        // 2)不持有 可能是第i-1天不持有，然后不变。或者第i-1天持有，然后第i天卖出
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<count {
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
        }
        return dp[count - 1][0]
    }
}

func test122(s: Solution) {
    let prices = [7,1,5,3,6,4]
    print(s.maxProfit3(prices))
}
