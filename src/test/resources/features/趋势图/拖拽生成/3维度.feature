@dragAndDrop @dragAndDropDimension @trend
Feature: 拖拽生成趋势图_维度

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Method" to the "Values"


  Scenario Outline: drag_and_drop_dimensions
    And I click the "<chartType>" button
    And I wait for "CompareBy" will be visible
    And I drag the element "Method" to the "CompareBy"
    Then I wait for "Chart" will be visible
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.method) by apache.method"
    When I click the "CloseSPL" button
    And I wait for "500" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color  |
      |  Pie       | Orange |
      |  Rose      | Red    |
      |  Bar       | Yellow |