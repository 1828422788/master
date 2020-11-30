@all @trend @trendMulti
Feature: 趋势图批量操作

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

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
    And I click the "TrendMultiButton" button
    And I "checked" the checkbox which name is "test_multi_1" in trend list page
    And I "checked" the checkbox which name is "test_multi_2" in trend list page
    And I "checked" the checkbox which name is "test_multi_3" in trend list page
    And I click the "SelectAction" button
    And I click the "MultiTag" button
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "EnsureButton" button
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario: verify_tag
    Then I will see the data "test_multi_1" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_2" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_3" values "{'column':'4','name':'auto_package'}"

  Scenario: multi_delete
    And I click the "TrendMultiButton" button
    And I "checked" the checkbox which name is "test_multi_1" in trend list page
    And I "checked" the checkbox which name is "test_multi_2" in trend list page
    And I "checked" the checkbox which name is "test_multi_3" in trend list page
    And I click the "SelectAction" button
    And I click the "MultiDelete" button
    Then I will see the message "您选中的 3 个资源将被删除，是否继续？"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario Outline: verify_delete
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      |   name          |
      |  test_multi_1   |
      |  test_multi_2   |
      |  test_multi_3   |





