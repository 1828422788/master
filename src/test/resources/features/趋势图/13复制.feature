@trend @copyTrend
Feature: 趋势图复制(RZY-1889)

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I wait for "2000" millsecond
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "AllResources" button
    And I click the "ZhanKai" button
    And I wait for "DataSetPosition" will be visible
    And I will see the element "DataSetPosition" contains "*"
    And I set the parameter "FenPianQuYang" with value "150"
    And I click the "SearchButton" button under some element
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Order" button under some element
    And I click the "ScatterChart" button under some element
    And I click the "Settings" button under some element
    And I click the "Bubble" button under some element
    And I click the "AccordingField" button under some element
    And I choose the "cnt" from the "BubbleSize" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "Copy_Test"
    And I set the parameter "TagInput" with value "auto_package"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "test_app" from the "AppField" in config
    And I click the "FinishButton" button under some element
    Then I wait for "SuccessCreate" will be visible

  Scenario: copy_trend
    And I wait for "2000" millsecond
    When the data name is "Copy_Test" then i click the "复制" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "复制成功"
    When I click the "EnsureButton" button
    And I wait for "3000" millsecond
    Then I will see the search result contains "{'column':'0','name':'Copy_Test(副本)'}"

  Scenario: global_tag_app
    And I wait for "2000" millsecond
    When I choose the "auto_package" from the "TagDropdown"
    And I wait for "Loading" will be invisible
    And I choose the "test_app" from the "AppDropdown"
    And I wait for "Loading" will be invisible
    Then I will see the data "{'column':'0','name':'Copy_Test'}" values "{'column':'4','name':'auto_package'}"
    When I will see the data "{'column':'0','name':'Copy_Test'}" values "{'column':'3','name':'test_app'}"
    Then I will see the data "{'column':'0','name':'Copy_Test(副本)'}" values "{'column':'4','name':'auto_package'}"
    When I will see the data "{'column':'0','name':'Copy_Test(副本)'}" values "{'column':'3','name':'test_app'}"
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  Scenario: verify_copy
    And I wait for "2000" millsecond
    And I will see the data "{'column':'0','name':'Copy_Test(副本)'}" values "{'column':'4','name':'auto_package'}"
    And I will see the data "{'column':'0','name':'Copy_Test(副本)'}" values "{'column':'3','name':'test_app'}"
    When the data name is "Copy_Test(副本)" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I wait for loading invisible
    And I wait for "5000" millsecond
    And I wait for loading invisible
    And I click the "ZhanKai" button
    And I wait for "DataSetPosition" will be visible
    And I will see the element "DataSetPosition" contains "*"
    And I will see the input element "FenPianQuYang" value will be "5000"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And I click the "NextButton" button under some element

    And I will see the input element "NameInput" value will be "Copy_Test(副本)"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I cancel selection "test_app" from the "AppField"
    And I will see the element "SelectedTag" contains "auto_package"
    And I click the "FinishButton" button under some element
    Then I wait for "SuccessUpdate" will be visible

  Scenario Outline: delete_copy
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Copy_Test        |
    | Copy_Test(副本)  |

