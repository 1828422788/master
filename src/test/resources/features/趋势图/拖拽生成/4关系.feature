@dragAndDrop @dragAndDropConnection @trend
Feature: 趋势图_拖拽_序列

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.geo.province" in trend page
    And I "checked" the checkbox which name is "apache.method" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Method" to the "Dimensions"
    And I drag the element "GeoProvince" to the "Dimensions"
    And I wait for "2000" millsecond

  Scenario Outline: drag_and_drop_connection
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond

    And I wait for "AddColor" will be visible
    And I will see the text "<text>" exist in page
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.method,apache.geo.province"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>_<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color   | text  |
      |  Chord     | Red     |       |
      |  Sankey    | Orange  | 多级  |

  Scenario Outline: drag_and_drop_force
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond

    And I will see the input element "Repulsion" value will be "8"
    And I click the "Increase10" button
    And I will see the input element "Repulsion" value will be "18"
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.method,apache.geo.province"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>_<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color   |
      |  Force     | Purple  |