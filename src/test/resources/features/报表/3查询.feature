@report @all @smoke @reportSmoke
Feature: 报表查询

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: 根据分组查询
    Given I choose the "<group>" from the "GroupList"
    And I wait for loading invisible
    Then I will see the special column contains "<name>"

    Examples:
      | group          | name    |
      | default_Report | 自动化测试用例 |

  Scenario Outline: 根据输入内容查询
    Given I set the parameter "SearchInput" with value "<searchInput>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | searchInput | name    |
      | 自动化         | 自动化测试用例 |

