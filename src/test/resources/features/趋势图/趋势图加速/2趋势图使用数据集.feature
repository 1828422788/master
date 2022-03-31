@trend @acceleration @accelerationDataset
Feature: 趋势图加速_2趋势图使用数据集

  Scenario: 新建数据集all_
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "数据集-1"
    And I set the parameter "Alias" with value "数据集-1"
    And I set the parameter "Spl" with value "tag:sample04061424_chart"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible

  Scenario: 创建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for "Loading" will be invisible
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "DatasetChart" button
    And I click the "ZhanKai" button
    And I wait for "DataSetPosition" will be visible
    And I will see the element "DataSetPosition" contains "tag:sample04061424_chart"
    When I set the parameter "SearchInput" with value "* | stats count() by tag"
    And I click the "DateEditor" button
    And I click the "OneDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "趋势图_数据集"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I wait for "1500" millsecond
    When I will see the "Accelerate" is clickable
    And I click the "Accelerate" button
    Then I will see the "trend.ListPage" page
    And I switch the "AccelerationSwitch" button to "enable"
    And I choose the "1 天" from the "TimeRange"
    Then I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message contains "开启加速成功"

  Scenario: 展示趋势图（chart）
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "趋势图_数据集"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'0','name':'趋势图_数据集'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I will see the element "ChartName" contains "趋势图_数据集"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I will see the text "sample04061424_chart" exist in page
    And I will see the text "sample04061424_display" is not existed in page

  Scenario: 修改数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "Loading" will be invisible
    When the data name is "数据集-1" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I set the parameter "EditYuJu" with value "tag:sample04061424_display"
    And I click the "rootSave" button

  Scenario: 展示趋势图（display）
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "趋势图_数据集"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'0','name':'趋势图_数据集'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I will see the element "ChartName" contains "趋势图_数据集"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I will see the text "sample04061424_display" exist in page
    And I will see the text "sample04061424_chart" is not existed in page

  Scenario: 修改数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "Loading" will be invisible
    When the data name is "数据集-1" then i click the "删除" button in more menu
    Then I will see the message "确定删除该数据集？"
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button

  Scenario: 展示趋势图（没有数据集）
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "趋势图_数据集"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'0','name':'趋势图_数据集'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I will see the element "ChartName" contains "趋势图_数据集"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I will see the text "sample04061424_display" exist in page
    And I will see the text "sample04061424_chart" exist in page

  Scenario: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "趋势图_数据集"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'0','name':'趋势图_数据集'}" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [趋势图_数据集] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"