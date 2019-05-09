#@alert @all @smoke @alertSmoke
Feature: 监控搜索（RZY-458）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 按输入框检索
    When I set the parameter "SearchInputElement" with value "<searchInput>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<searchInput>'}"

    Examples:
      | searchInput        |
      | RZY-436：SPL统计监控步骤1 |

  Scenario Outline: 按分组检索
    Given search from "{'DropdownMenu':'<group>'}" then I will see the result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group         | name              |
      | default_Alert | RZY-435:连续统计监控步骤5 |