@trend @copyTrend
Feature: 趋势图复制(RZY-1889)

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible

  @trendSmoke
  Scenario: 新建趋势图
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "AllResources" button
    And I click the "ZhanKai" button
    And I wait for "DataSetPosition" will be visible
    And I will see the element "DataSetPosition" contains "*"
    And I click the "SearchConfig" button
    And I wait for "FenPianQuYang" will be visible
    And I set the parameter "FenPianQuYang" with value "150"
    And I click the "CloseWindow" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "ScatterChart" button
    And I click the "Settings" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "cnt" from the "BubbleSize"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "Copy_Test"
    And I choose the "test_app" from the "AppField"
    And I wait for "2000" millsecond
    And I set the parameter "TagInput" with value "auto_package"
    And I click the "SelectAddedTag" button
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

  @trendSmoke
  Scenario: 复制
    When the data name is "Copy_Test" then i click the "复制" button in more menu
    And I wait for "Ensure" will be visible
    Then I will see the message "复制成功"
    When I click the "Ensure" button
    And I wait for "3000" millsecond
    Then I will see the search result contains "{'column':'0','name':'Copy_Test_副本'}"

  Scenario: global_tag_app
    When I choose the "auto_package" from the "TagFilter"
    And I click the "HideElement" button
    And I wait for loading invisible
    And I choose the "test_app" from the "AppDropdown"
    And I wait for loading invisible
    When I will see the data "{'column':'0','name':'Copy_Test_副本'}" values "{'column':'3','name':'test_app'}"
    Then I will see the data "{'column':'0','name':'Copy_Test_副本'}" values "{'column':'4','name':'auto_package'}"
    And I wait for "2000" millsecond
    Then I will see the data "{'column':'0','name':'Copy_Test'}" values "{'column':'4','name':'auto_package'}"
    When I will see the data "{'column':'0','name':'Copy_Test'}" values "{'column':'3','name':'test_app'}"
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  @trendSmoke
  Scenario: 验证
    And I will see the data "{'column':'0','name':'Copy_Test_副本'}" values "{'column':'4','name':'auto_package'}"
    And I will see the data "{'column':'0','name':'Copy_Test_副本'}" values "{'column':'3','name':'test_app'}"
    When the data name is "Copy_Test_副本" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "ZhanKai" button
    And I wait for "DataSetPosition" will be visible
    And I will see the element "DataSetPosition" contains "*"
    And I click the "SearchConfig" button
    And I will see the input element "FenPianQuYang" value will be "5000"
    And I click the "CloseWindow" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And I click the "NextButton" button

    And I will see the input element "NameInput" value will be "Copy_Test_副本"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I will see the element "SelectedApp" contains "test_app"
    And I will see the element "SelectedTag" contains "auto_package"
    And I click the "Complete" button
    Then I wait for "SuccessUpdate" will be visible

  @trendSmoke
  Scenario Outline: 删除
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Copy_Test        |
    | Copy_Test_副本  |

