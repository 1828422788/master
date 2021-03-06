@dragAndDrop @dragAndDropConnection @trend
Feature: 趋势图_拖拽_关系

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.geo.province" in trend page
    And I "checked" the checkbox which name is "apache.method" in trend page
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Method" to the "Dimensions"
    And I drag the element "GeoProvince" to the "Dimensions"
    And I wait for "2000" millsecond

  @trendSmoke
  Scenario Outline: 和弦图_桑基图
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond

    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I will see the text "<text>" exist in page
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.method,apache.geo.province"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>_<color>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      |  chartType | color   | text  |
      |  Chord     | Red     |       |
      |  Sankey    | Orange  | 多级  |

  @trendSmoke
  Scenario Outline: 力图
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond

    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "25" using step buttons
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.method,apache.geo.province"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
#    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>_<color>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      |  chartType | color   |
      |  Force     | Purple  |