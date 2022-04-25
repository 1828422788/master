@dashboard @dashboard02
Feature: 仪表盘02搜索

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: 按照名称搜索（RZY-216）
    Given I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'FirstAutoTest','contains':'no'}"

    Examples:
      | name       |
      | UIautotest |

  Scenario: 删除资源标签（RZY-4774）
    When the data name is "UIautotest" then i click the "标签" button in more menu
    And I click the "RemoveDashboardTagIcon" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"

  Scenario: 按照资源分组搜索（RZY-4475）
    When I choose the "AutoTest" from the "TagFilter"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'UIautotest','contains':'no'}"

  Scenario: 按照所属应用搜索（RZY-4474）
    When I choose the "test_app" from the "AppFilter"
    And I wait for loading invisible
    Then I will see the search result contains "FirstAutoTest"
    Then I will see the search result contains "UIautotest"

  Scenario: 验证资源标签删除成功
    And I click the dashboard icon which name is "UIautotest"
    Then I will see the text "资源标签..............无" exist in page