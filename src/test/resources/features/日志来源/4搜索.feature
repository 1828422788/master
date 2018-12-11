@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源搜索

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given I choose the "<group>" from the "GroupDropdownList"
    And I will see the special column contains "<name>"
    And I choose the "全部资源" from the "GroupDropdownList"
    And I set the search input with "<name>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | group               | name          |
      | default_SourceGroup | sunxjautotest |

