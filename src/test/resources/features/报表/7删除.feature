@report @all @smoke @reportSmoke
Feature: 报表删除（RZY-131）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "DeleteEnsure" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'自动化测试用例','contains':'n'}"

    Examples:
      | name      |
      | autotest  |
      | 自动化测试     |
      | autotest1 |
      | autotest2 |
      | autotest3 |

  @clean
    Examples:
      | name                   |
      | 柱状饼状玫瑰图报表(PDF)3        |
      | 柱状饼状玫瑰图报表(PDF)5        |
      | 柱状饼状玫瑰图报表(PDF)6        |
      | 面积图散点图报表(PDF)          |
      | 曲线图类型报表(word)          |
      | 条形和弦桑基力图报表(URL)        |
      | 条形和弦桑基力图报表(PDF)7       |
      | 条形和弦桑基力图报表(PDF)4       |
      | 条形和弦桑基区间多Y轴力图报表(PDF)   |
      | 条形和弦桑基区间多Y轴力图报表(excel) |
