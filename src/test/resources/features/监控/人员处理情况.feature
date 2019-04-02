@alert @alertSmoke
Feature: 监控人员处理情况

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "WorkLoads" button
    And I wait for loading invisible
    Then I will see the "alert.WorkLoadPage" page

  Scenario Outline: 按名称搜索
    When search "{'input':'<name>'}" and I will see the column number "1" contains "<name>"

    Examples:
      | name  |
      | owner |

  @second
  Scenario: 返回监控首页（RZY-494）
    When I click the "ReturnButton" button
    Then the page's title will be "监控"

  Scenario: 检查高级告警数量为0时，高级告警及时率是否为100%（RZY-493）
    When the data name is "{'column':'3','name':'0'}" then the result is "{'column':'5','name':'100%'}"

