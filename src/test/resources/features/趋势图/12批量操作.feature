@all @trend @trendMulti
Feature: 趋势图批量操作

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "MultiButton" will be visible

  Scenario Outline: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "SearchButton" button under some element
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

  Examples:
    |   name          |
    |  test_multi_1   |
    |  test_multi_2   |
    |  test_multi_3   |

  Scenario: multi_tag
    And I click the "MultiButton" button under some element
    And I "checked" the checkbox which name is "test_multi_1" in trend list page
    And I "checked" the checkbox which name is "test_multi_2" in trend list page
    And I "checked" the checkbox which name is "test_multi_3" in trend list page
    And I click the "SelectAction" button under some element
    And I click the "MultiTag" button
    And I wait for "EnsureButton" will be visible
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "Finish" button under some element

  Scenario: verify_tag
    Then I will see the data "test_multi_1" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_2" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_3" values "{'column':'4','name':'auto_package'}"

  Scenario: multi_delete
    And I click the "MultiButton" button under some element
    And I "checked" the checkbox which name is "test_multi_1" in trend list page
    And I "checked" the checkbox which name is "test_multi_2" in trend list page
    And I "checked" the checkbox which name is "test_multi_3" in trend list page
    And I click the "SelectAction" button under some element
    And I click the "MultiDelete" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "您选中的 3 个资源将被删除，是否继续？"
    And I click the "Cancel" button
    When the data name is "{'column':'1','name':'test_multi_3'}" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "确认删除 [test_multi_3] ?"
    When I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "SelectAction" button under some element
    And I click the "MultiDelete" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "Finish" button under some element

  Scenario: verify_delete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible
#    Then I will see the search result "{'column':'0','name':'test_multi_1','contains':'no'}"
#    Then I will see the search result "{'column':'0','name':'test_multi_2','contains':'no'}"
#    Then I will see the search result "{'column':'0','name':'test_multi_3','contains':'no'}"

  Scenario Outline: prompt
    And I click the "MultiButton" button under some element
    And I click the "SelectAction" button under some element
    And I click the "<button>" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "请至少选择一个资源进行操作"

  Examples:
    | button       |
    | MultiDelete  |
    | MultiTag     |