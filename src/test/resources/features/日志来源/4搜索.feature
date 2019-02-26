@logSource
Feature: 日志来源搜索

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline: 按照分组和名称搜索
    Given I choose the "<group>" from the "GroupDropdownList"
    And I wait for loading invisible
    And I will see the special column contains "<name>"
    And I choose the "全部资源" from the "GroupDropdownList"
    And I set the search input with "<name>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | group               | name          |
      | default_SourceGroup | sunxjautotest |

  Scenario Outline: 查看最近几天的日志来源
    When I set the parameter "RecentDays" with value "<recentDays>"
    Then I will see the error message "<message>"

    Examples:
      | recentDays | message      |
      | d          | 请输入数字        |
      | 0          | 请输入大于0的数字    |
      | 32         | 请查询31天以内的使用量 |