@dragAndDrop @dragAndDropMap @trend
Feature: 趋势图_拖拽_地图

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
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    And I "checked" the checkbox which name is "apache.geo.province" in trend page
    And I "checked" the checkbox which name is "apache.geo.country" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible

  Scenario Outline: drag_and_drop_heatmap
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Heatmap   |

  Scenario Outline: drag_and_drop_regionmap
    And I drag the element "<element>" to the "Values"
    And I drag the element "<element>" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "<region>" button
    And I click the "<switch>" button

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "<spl>"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_<region>"
    And I compare source image "actual/拖拽_<chartType>_<region>" with target image "expect/拖拽_<chartType>_<region>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_<region>"
    And I set the parameter "DescribeInput" with value "<chartType>_<region>_<switch>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType   | element     |  region     |  switch    | spl     |
      |  Regionmap   | GeoCountry  |  World      | UseBubbles | tag:sample04061424_chart \| stats count(apache.geo.country) by apache.geo.country   |
      |  Regionmap   | GeoProvince |  China      | ShowLabels | tag:sample04061424_chart \| stats count(apache.geo.province) by apache.geo.province |