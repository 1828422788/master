@alert @all
Feature: 监控最新状态

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page

  Scenario: 展开/收起重复告警
    When I click the expand button "Expand" if exist
    And I click the "Retract" button
    Then take a screenshot

  Scenario Outline: 搜索最新状态
    Given search from "<dropdownMenu>" then I will see the result "{'column':'<num>','name':'<name>'}"

    Examples:
      | dropdownMenu                      | num | name          |
      | {'GroupDropdown':'default_Alert'} | 3   | default_Alert |
      | {'StatusDropdown':'待处理'}          | 6   | 待处理           |

    #已处理没有数据时要做校验