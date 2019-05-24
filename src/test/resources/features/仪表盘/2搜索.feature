@dashboard @dashboardSmoke
Feature: 仪表盘搜索（RZY-216）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline: 按照名称搜索
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | autotest |

  Scenario: 按照分组搜索
    Given I click the "GroupDropdown" button
    And I wait for "GroupDropdownList" will be visible
    And I choose the "未分组" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'sxjautotest'}"