@dragAndDrop @dragAndDropOrder @trend
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
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible


  Scenario Outline: drag_and_drop_order_line
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<button_dim>_<button>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | button           | unit | min | max | color  |
      |  Line      |  AscendingOrder  | ConnectEmptyData |  个  |  1  | 28  | Orange |

  Scenario Outline: drag_and_drop_order_pile
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "1500" millsecond
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I click the "ElementInCompare" button
    And I click the "Pile" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_Pile"
    And I compare source image "actual/拖拽_<chartType>_Pile" with target image "expect/拖拽_<chartType>_Pile"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_Pile"
    And I set the parameter "DescribeInput" with value "<button_dim>_<button>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | button           | unit | min | max | color  |
      |  Area      |  DescendingOrder | Smooth           | pcs. |     | 25  | Yellow |
      |  Column    |  AscendingOrder  |                  | r.   | 1   |     | Orange |

  Scenario Outline: drag_and_drop_order_scatter
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I drag the element "Clientip" to the "Bubbles"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "1500" millsecond
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I click the "RightPosition" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<button_dim>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | unit | min | max | color  |
      |  Scatter   |  FirstLabel      |  个  | 0.5 |  10 | Yellow |

  Scenario Outline: drag_and_drop_compare
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I click the "CompareButton" button
    And I wait for "1000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "CompareField" button
    And I click the "<comparePeriod>" button
    And I click the "Clientip" button

    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I click the "RightPosition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "<SPLcheck>"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_对比"
#    And I compare source image "actual/拖拽_<chartType>_对比" with target image "expect/拖拽_<chartType>_对比"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比"
    And I set the parameter "DescribeInput" with value "<button>_<unit>_<min>_<max>_<color>_RightPosition"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | comparePeriod | button           | unit | min | max | color  | SPLcheck |
      |  Line      | Yesterday     | ConnectEmptyData |  个  | 1   | 30  | Orange | starttime="now/d" endtime="now" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="当前" \| append [[ starttime="now/d-1d" endtime="now-1d" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="环比" ]] |
      |  Area      | LastWeek      | Smooth           | pcs. |     | 28  | Yellow | starttime="now/d" endtime="now" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="当前" \| append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="同比一周" ]]   |
      |  Column    | LastMonth     |                  | r.   | 1   |     | Green  | starttime="now/d" endtime="now" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="当前" \| append [[ starttime="now/d-1M" endtime="now-1M" tag:sample04061424_chart\|stats count(apache.clientip) by apache.clientip \| eval _compare="同比一月" ]]        |
      # There is no Compare button for Scatter chart

  Scenario Outline: drag_and_drop_order_area_no_val
    And I drag the element "Clientip" to the "Dimensions"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I click the "<label>" button
    And I hide the element "Panel"
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible
    And I click the "<position>" button

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count() by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_无数值"
    And I compare source image "actual/拖拽_<chartType>_无数值" with target image "expect/拖拽_<chartType>_无数值"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_无数值"
    And I set the parameter "DescribeInput" with value "<button_dim>_<label>_<position>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | button_dim         |  label         | position        |
      |  Area      | DescendingOrder    |  FirstLabel    | RightPosition   |

  Scenario Outline: drag_and_drop_order_table
    And I drag the element "Clientip" to the "Dimensions"
    And I click the "<chartType>" button
    And I wait for "3000" millsecond
    And I wait for "OtherChart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count() by apache.clientip"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/拖拽_<chartType>_1"
    And I compare source image "actual/拖拽_chartType>_1" with target image "expect/拖拽_<chartType>_1"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_1"
    And I set the parameter "DescribeInput" with value "Table"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Table     |

  Scenario Outline: drag_and_drop_order_table_compare
    And I drag the element "Method" to the "Dimensions"
    And I drag the element "Method" to the "Values"
    And I click the "<chartType>" button
    And I wait for "3000" millsecond
    And I wait for "OtherChart" will be visible
    And I wait for "2000" millsecond
    And I click the "CompareButton" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "CompareField" will be visible
    And I click the "CompareField" button
    And I click the "LastWeek" button
    And I click the "Clientip" button
    And I wait for "2000" millsecond
    And I wait for "OtherChart" will be visible

    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "starttime="now/d" endtime="now" tag:sample04061424_chart|stats count(apache.method) by apache.method | eval _compare="当前" | append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart|stats count(apache.method) by apache.method | eval _compare="同比一周" ]]"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/拖拽_<chartType>_对比_1"
    And I compare source image "actual/拖拽_<chartType>_对比_1" with target image "expect/拖拽_<chartType>_对比_1"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比_1"
    And I set the parameter "DescribeInput" with value "Table"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Table     |