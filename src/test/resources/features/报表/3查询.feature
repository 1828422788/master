@report @all @smoke @reportSmoke
Feature: 报表查询（RZY-136）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: 根据分组查询
    Given I choose the "<group>" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group          | name     |
      | default_Report | autotest |

  Scenario Outline: 根据输入内容查询
    Given I set the parameter "SearchInput" with value "<searchInput>"
    Then I will see the search result "{'column':'0','name':'<searchInput>'}"

    Examples:
      | searchInput |
      | auto        |

