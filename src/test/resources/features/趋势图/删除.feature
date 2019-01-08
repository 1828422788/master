@all @smoke @trend @trendSmoke
Feature: 趋势图删除（RZY-1891）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name          |
      | 曲线图sample2(1) |

  @clean
  Scenario Outline: 趋势图删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name         |
      | 曲线图sample0   |
      | 曲线图sample1   |
      | 曲线图sample2   |
      | 面积图sample0   |
      | 面积图sample1   |
      | 面积图sample2   |
      | 散点图sample0   |
      | 散点图sample1   |
      | 散点图sample2   |
      | 柱状图sample0   |
      | 柱状图sample1   |
      | 柱状图sample2   |
      | 和弦图sample0   |
      | 和弦图sample1   |
      | 桑基图sample0   |
      | 桑基图sample1   |
      | 力图sample0    |
      | 力图sample1    |
      | 饼状图sample0   |
      | 饼状图sample1   |
      | 区间图sample0   |
      | 区间图sample1   |
      | 多Y轴sample0   |
      | 多Y轴sample1   |
      | 多Y轴sample2   |
      | 热力地图sample0  |
      | 热力地图sample1  |
      | 攻击地图sample0  |
      | 攻击地图sample1  |
      | 攻击地图sample2  |
      | 区划地图sample0  |
      | 区划地图sample1  |
      | 区划地图sample2  |
      | 单值sample0    |
      | 单值sample1    |
      | 单值sample2    |
      | 单值sample3    |
      | 水球图sample0   |
      | 水球图sample1   |
      | 字符云图sample0  |
      | 字符云图sample1  |
      | 雷达图sample0   |
      | 雷达图sample1   |
      | 雷达图sample2   |
      | 漏斗图sample0   |
      | 漏斗图sample1   |
      | 循序图sample0   |
      | 循序图sample1   |
      | 矩阵热力图sample0 |
      | 矩阵热力图sample1 |