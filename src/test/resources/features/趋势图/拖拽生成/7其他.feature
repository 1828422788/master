@dragAndDrop @dragAndDropOther
Feature: 拖拽生成趋势图_其他

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
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.status" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible


  Scenario Outline: drag_and_drop_single1
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    Then I wait for "OtherChart" will be visible
    And I set the parameter "FontSize" with value "<size>"
    And I click the "<button>" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "OtherChart" will be visible
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_<button>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "<color>_<size>_<button>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color  | size | button     |
      |  Single    | Green  | 100  | Background |

  Scenario Outline: drag_and_drop_single2
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    Then I wait for "OtherChart" will be visible
    And I click the "AccordingTrend" button
    And I set the parameter "FontSize" with value "<size>"
    And I click the "Absolute" button
    And I choose the "<timeValue>" from the "ContrastTime" in config

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "OtherChart" will be visible
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_trend"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_trend"
    And I set the parameter "DescribeInput" with value "<size>_<timeValue>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | size | timeValue   |
      |  Single    | 100  | 一天前      |

  Scenario Outline: drag_and_drop_single3
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    Then I wait for "OtherChart" will be visible
    And I click the "AccordingArea" button
    And I set the parameter "FontSize" with value "<size>"
    And I set the parameter "MinRange" with value "<minVal1>"
    And I set the parameter "MaxRange" with value "<maxVal1>"
    And I click the "AddRange" button
    And I wait for "1000" millsecond
    And I set the parameter "MinRange" with value "<minVal2>"
    And I set the parameter "MaxRange" with value "<maxVal2>"
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color2>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color2>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "OtherChart" will be visible
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_area"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_area"
    And I set the parameter "DescribeInput" with value "<size>_<minVal2>_<maxVal2>_<color2>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | size | minVal1 | maxVal1 | minVal2| maxVal2| color2 |
      |  Single    | 100  | 1       | 123     | 123    | 126    | Purple |

  Scenario Outline: drag_and_drop_other
    And I drag the element "GeoCity" to the "Values"
    And I click the "<chartType>" button
    And I wait for "CompareByField" will be visible
    And I drag the element "GeoCity" to the "CompareByField"
    And I wait for "2000" millsecond
    Then I wait for "OtherChart" will be visible
    And I click the "<button>" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>_<button>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  color  |  button        |
      |  Wordcloud |  Purple |                |
      |  Funnel    |  Orange | RightPosition  |

  Scenario Outline: drag_and_drop_radar
    And I drag the element "Status" to the "Values"
    And I drag the element "Status" to the "Dimensions"
    And I click the "<chartType>" button
    And I wait for "CompareBy" will be visible
    And I drag the element "GeoCity" to the "CompareBy"
    Then I wait for "OtherChart" will be visible
    And I click the "<button>" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.status) by apache.status,apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>_<button>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  color    |  button        |
      |  Radar     |  DarkBlue | RightPosition  |

  Scenario Outline: drag_and_drop_radar_compare
    And I drag the element "Status" to the "Values"
    And I drag the element "Status" to the "Dimensions"
    And I click the "<chartType>" button
    And I click the "CompareButton" button
    And I wait for "2000" millsecond
    Then I wait for "OtherChart" will be visible
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "CompareField" will be visible
    And I click the "CompareField" button
    And I click the "Yesterday" button
    And I click the "LastWeek" button
    And I click the "Clientip" button
    And I wait for "2000" millsecond
    Then I wait for "OtherChart" will be visible
    And I click the "<button>" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "starttime="now/d" endtime="now" tag:sample04061424_chart|stats count(apache.status) by apache.status | eval _compare="当前" | append [[ starttime="now/d-1d" endtime="now-1d" tag:sample04061424_chart|stats count(apache.status) by apache.status | eval _compare="环比" ]] | append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart|stats count(apache.status) by apache.status | eval _compare="同比一周" ]]"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_对比"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比"
    And I set the parameter "DescribeInput" with value "<color>_<button>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  color    |  button        |
      |  Radar     |  DarkBlue | RightPosition  |

  Scenario Outline: drag_and_drop_order_table
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "3000" millsecond
    And I wait for "OtherChart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip)"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_2"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_2"
    And I set the parameter "DescribeInput" with value "Table"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Table     |

  Scenario Outline: drag_and_drop_order_table_compare
    And I drag the element "Clientip" to the "Values"
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
    And I will see the element "SPL" contains "starttime="now/d" endtime="now" tag:sample04061424_chart|stats count(apache.clientip) | eval _compare="当前" | append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart|stats count(apache.clientip) | eval _compare="同比一周" ]]"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "OtherChart" with name "actual/<chartType>_对比_2"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比_2"
    And I set the parameter "DescribeInput" with value "Table"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Table     |