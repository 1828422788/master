@dashboard @dashboardSmoke
Feature: 仪表盘搜索（RZY-216）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: 按照名称搜索
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "<name>"
    Then I will see the search result "{'column':'0','name':'FirstAutoTest','contains':'no'}"

    Examples:
      | name       |
      | UIautotest |

  Scenario: 删除资源标签
    When the data name is "UIautotest" then i click the "标签" button
    And I click the "RemoveTagIcon" button
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario: 按照资源分组搜索
    When I choose the "AutoTest" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "FirstAutoTest"
    Then I will see the search result "{'column':'0','name':'UIautotest','contains':'no'}"

  Scenario: 验证资源标签删除成功
    Then I will see the data "UIautotest" values "{'column':'3','name':''}"
