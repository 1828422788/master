@dragAndDrop @dragAndDropDataset @dragAndDropCreate
Feature: 趋势图_选择数据集

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    When I click the "NewTrendFromDataset" button

  Scenario:  single_dataset
    When I click the "SingleDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    When I click the "Dataset_1" button
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "TableBody" will be visible
    And I choose the "apache.clientip" from the "ColumnField" in config
    And I choose the "不等于" from the "Operator" in config
    And I set the parameter "Value" with value "221.226.97.92"
    And I click the "Apply" button
    And I wait for "Message" will be visible
    Then I will see the element "Message" contains "应用成功"
    When I click the "NextButton" button

    And I wait for "Dimensions" will be visible
    And I drag the element "Timestamp" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "Line" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | where(apache.clientip!="221.226.97.92") | timechart count(apache.clientip) by apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/Line_dataset"
    And I compare source image "actual/Line_dataset" with target image "expect/Line_dataset"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "Line_dataset"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible



