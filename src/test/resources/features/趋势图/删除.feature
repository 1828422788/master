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
      | name         |
      | AutoTest20   |
      | AutoTest21   |
      | AutoTest22   |
      | AutoTest23   |
      | AutoTest24   |
      | AutoTest25   |
      | AutoTest26   |
      | AutoTest27   |
      | AutoTest28   |
      | AutoTest29   |
      | AutoTest30   |
      | AutoTest2    |
      | AutoTest3    |
      | AutoTest4    |
      | AutoTest6    |
      | AutoTest7    |
      | AutoTest8    |
      | AutoTest1(1) |
      | 旭日图          |

  @clean
    Examples:
      | name         |
      | 曲线图AutoTest  |
      | 面积图AutoTest  |
      | 散点图AutoTest  |
      | 柱状图AutoTest  |
      | 饼状图AutoTest  |
      | 玫瑰图AutoTest  |
      | 条形图AutoTest  |
      | 和弦图AutoTest  |
      | 桑基图AutoTest  |
      | 力图AutoTest   |
      | 多Y轴图AutoTest |
      | 区间图AutoTest  |