@alert @all @smoke @alertSmoke
Feature: 监控搜索（RZY-458）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I set the parameter "SearchInputElement" with value "<searchInput>"
    Then I will see the search result "{'column':'0','name':'<searchInput>'}"

    Examples:
      | searchInput |
      | RZY-436：SPL统计监控（不展示监控趋势图）    |

  Scenario Outline:
    Given search from "{'DropdownMenu':'<group>'}" then I will see the result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group         | name     |
      | default_Alert | RZY-436：SPL统计监控（不展示监控趋势图） |