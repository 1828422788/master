@dragAndDrop @dragAndDropDimension @trend
Feature: 趋势图_拖拽_维度

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
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible

  Scenario Outline: drag_and_drop_dimensions
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Method" to the "Values"
    And I drag the element "Method" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I choose the "<label>" from the "ShowLabel"

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.method) by apache.method"
    When I click the "CloseSPL" button
    And I wait for "500" millsecond
    And I wait for "<element>" will be visible
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>_<label>"
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
    And I wait for "<element>" will be visible

    Examples:
      |  chartType | color  | label      | element             |
      |  Pie       | Orange | 不展示     | PieNoLabelsElement  |
      |  Rose      | Red    | 展示全部   | PieElement          |
      |  Bar       | Yellow | 只展示名称 | BarElement          |

  Scenario Outline: 火焰图
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I "checked" the checkbox which name is "apache.status" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Method" to the "Dimensions"
    And I drag the element "Status" to the "Dimensions"
    And I wait for "2000" millsecond
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible

    And I click the "Exhibition" button
    And I click the "<drill>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.method,apache.status"
    When I click the "CloseSPL" button
    And I click the Circle "Status405" button
    And I wait for "<element>" will be visible
    And I click the "HideElement" button
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_<drill>"
    And I compare source image "actual/拖拽_<chartType>_<drill>" with target image "expect/拖拽_<chartType>_<drill>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_<drill>"
    And I set the parameter "DescribeInput" with value "<chartType>_<drill>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_<drill>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_<drill>"
    Then I will see the "trend.CreatePage" page
    And I wait for "FlameElement" will be visible
    And I click the Circle "Status405" button
    And I wait for "<element>" will be visible

    @trendSmoke
    Examples:
      | chartType | drill    | element    |
      | Flame     | DrillIn  | BackToChart|

    Examples:
      | chartType | drill    | element    |
      | Flame     | DrillOut | Status405  |

  Scenario Outline: drag_and_drop_sunburst
    And I "checked" the checkbox which name is "apache.geo.province" in trend page
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoProvince" to the "Dimensions"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "2000" millsecond
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible

    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count() by apache.geo.province,apache.geo.city"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I wait for "SunElement" will be visible
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
    And I wait for "SunElement" will be visible

    Examples:
      | chartType | color    |
      | Sunburst  | DarkBlue |