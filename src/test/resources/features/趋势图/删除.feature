@all @smoke @trend @cleanTrend
Feature: 趋势图删除（RZY-1891）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  @trendSmoke
  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name             |
      | 矩阵热力图sample1(副本) |

  @clean
  Scenario Outline: 趋势图删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name        |
      | 区间图sample0  |
      | 力图sample0   |
      | 桑基图sample0  |
      | 和弦图sample0  |
      | 柱状图sample0  |
      | 面积图sample0  |
      | 条形图sample3  |
      | 条形图sample2  |
      | 饼状图sample3  |
      | 字符云图sample1 |
      | 条形图sample1  |
      | 饼状图sample1  |
      | 力图sample1   |
      | 和弦图sample1  |
      | 散点图sample2  |
      | 柱状图sample2  |
      | 面积图sample2  |
      | 曲线图sample2  |
      | 散点图sample1  |
      | 面积图sample1  |

  @cleanFirst
    Examples:
      | name        |
      | 饼状图sample2  |
      | 单值sample2   |
      | 单值sample1   |
      | 热力地图sample1 |
      | 柱状图sample1  |
      | 曲线图sample1  |
      | 雷达图sample0  |
      | 散点图sample0  |
      | 曲线图sample0  |

  @cleanSecond
    Examples:
      | name                 |
      | pivot_力图sample2      |
      | pivot_chart指令sample0 |
      | 调用链sample            |
      | 矩阵热力图sample1         |
      | 循序图sample1           |
      | 雷达图sample2           |
      | 漏斗图sample1           |
      | 雷达图sample1           |
      | 旭日图sample2           |
      | 水球图sample1           |
      | 单值sample3            |
      | 区划地图sample2          |
      | 区划地图sample1          |
      | 攻击地图sample2          |
      | 攻击地图sample1          |
      | 旭日图sample1           |
      | 区间图sample1           |
      | 桑基图sample1           |
      | 多Y轴sample2           |
      | 多Y轴sample1           |
      | 调用链sample0           |
      | 旭日图sample0           |
      | 条形图sample0           |
      | 玫瑰图sample0           |
      | 矩阵热力图sample0         |
      | 漏斗图sample0           |
      | 循序图sample0           |
      | 字符云图sample0          |
      | 水球图sample0           |
      | 单值sample0            |
      | 区划地图sample0          |
      | 攻击地图sample0          |
      | 热力地图sample0          |
      | 多Y轴sample0           |
      | 饼状图sample0           |
