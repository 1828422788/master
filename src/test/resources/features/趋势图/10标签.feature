@trend @tagTrend
Feature: 趋势图标签

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible

  Scenario: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "Tag_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

  Scenario: tag_trend
    When the data name is "Tag_Test" then i click the "标签" button in more menu
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I refresh the website
    And I wait for loading invisible
    And the data name is "Tag_Test" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"


  Scenario: verify_tag
    When the data name is "Tag_Test" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I will see the input element "NameInput" value will be "Tag_Test"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I will see the element "SelectedTag" contains "auto_package"
    And I click the "DeleteTag" button
    And I click the "Complete" button
    Then I wait for "SuccessUpdate" will be visible
    When open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And the data name is "Tag_Test" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............无"


  Scenario Outline: delete_trend
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Tag_Test         |