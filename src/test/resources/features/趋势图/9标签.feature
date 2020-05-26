@all @trend @tagTrend
Feature: 趋势图标签

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "Tag_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

  Scenario: tag_trend
    When the data name is "Tag_Test" then i click the "标签" button
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "EnsureButton" button
    Then I will see the success message "更新成功"
    And I refresh the website
    #column 2 is user, column 3 is tag
    Then I will see the data "Tag_Test" values "{'column':'3','name':'auto_package'}"


  Scenario: verify_tag
    When the data name is "Tag_Test" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I will see the input element "NameInput" value will be "Tag_Test"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I cancel selection "auto_package" from the "GroupField"
    And I click the "NextButton" button
    Then I wait for "SuccessUpdate" will be visible
    When open the "trend.ListPage" page for uri "/trend/"
    Then I will see the data "Tag_Test" values "{'column':'3','name':'无'}"


  Scenario Outline: delete_trend
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Tag_Test         |

