@dragAndDrop @dragAndDropTimechart
Feature: 拖拽生成趋势图图表类型

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: drag_and_drop_timechart
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "timestamp" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Timestamp" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I set the parameter "Span" with value "20m"
    And I hide the element "Panel"
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | timechart span=20m count(apache.clientip)"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "trend_拖拽/<chartType>_timechart"
    And I wait for "2000" millsecond
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_timechart"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Line      |
      |  Area      |
      |  Scatter   |
      |  Column    |