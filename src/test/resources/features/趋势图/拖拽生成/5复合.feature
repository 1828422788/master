@dragAndDrop @dragAndDropCompound @trend
Feature:趋势图_拖拽_复合

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
    When I "checked" the checkbox which name is "apache.resp_len" in trend page
    And I "checked" the checkbox which name is "apache.method" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible

  @trendSmoke
  Scenario Outline: 多y轴图
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Resplen" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "Values2" will be visible
    And I drag the element "Resplen" to the "Values2"

    And I wait for "EditFirstField" will be visible
    And I click the "EditFirstField" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "3000"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_1>" from the "TypeChartField" in config
    And I choose the "平均值" from the "TypeFunction" in config
    And I click the "EditColor" button
    And I wait for "<color_1>" will be visible
    And I click the "<color_1>" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond

    And I wait for "EditSecondField" will be visible
    And I click the "EditSecondField" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues2" will be visible
    When I click the "ElementInValues2" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_2>" from the "TypeChartField" in config
    And I choose the "去重" from the "TypeFunction" in config
    And I click the "Smooth" button
    And I click the "EditColor" button
    And I wait for "<color_2>" will be visible
    And I click the "<color_2>" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I click the "Xaxis" button
    And I click the "AscendingOrder" button
    And I click the "Example" button
    And I click the "RightPosition" button
    And I click the "Exhibition" button
    And I will see the "AddColor" doesn't exist

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats avg(apache.resp_len),dc(apache.resp_len) by apache.clientip"
    When I click the "CloseSPL" button
    And I wait for "AreaChartElement" will be visible
    And I wait for "ColumnChartElement" will be visible
    And I will see the element "FieldAxis_1" contains "avg(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "0 柱"
    And I will see the element "MaxAxis_1" contains "3K 柱"
    And I will see the element "FieldAxis_2" contains "dc(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "2 面"
    And I will see the element "Legend" contains "avg(apache.resp_len)"
    And I will see the element "Legend" contains "dc(apache.resp_len)"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_柱面"
    And I compare source image "actual/拖拽_<chartType>_柱面" with target image "expect/拖拽_<chartType>_柱面"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_柱面"
    And I set the parameter "DescribeInput" with value "<chart_1><color_1>_<chart_2><color_2>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_柱面'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_柱面"
    Then I will see the "trend.CreatePage" page
    And I wait for "AreaChartElement" will be visible
    And I wait for "ColumnChartElement" will be visible

    Examples:
      |  chartType |  chart_1  | chart_2  | color_1 | color_2 |
      |  Multiaxis |  柱状图   | 面积图   | Purple  | Green   |

  Scenario Outline: drag_and_drop_multiaxis_2
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Resplen" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I drag the element "Resplen" to the "Values2"

    And I wait for "EditFirstField" will be visible
    And I click the "EditFirstField" button
    And I set the parameter "Unit" with value "曲"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "15"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_1>" from the "TypeChartField" in config
    And I choose the "计数" from the "TypeFunction" in config
    And I click the "EditColor" button
    And I wait for "<color_1>" will be visible
    And I click the "<color_1>" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond

    And I wait for "EditSecondField" will be visible
    And I click the "EditSecondField" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value "0"
    And I set the parameter "Max" with value "9000"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues2" will be visible
    When I click the "ElementInValues2" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_2>" from the "TypeChartField" in config
    And I choose the "最大值" from the "TypeFunction" in config
    And I click the "EditColor" button
    And I wait for "<color_2>" will be visible
    And I click the "<color_2>" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button

    And I click the "Xaxis" button
    And I click the "DescendingOrder" button
    And I click the "Exhibition" button
    And I will see the "AddColor" doesn't exist

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.resp_len),max(apache.resp_len) by apache.clientip"
    When I click the "CloseSPL" button
    And I wait for "LineChartElement" will be visible
    And I wait for "ScatterChartElement" will be visible
    And I will see the element "FieldAxis_1" contains "count(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "1 曲"
    And I will see the element "MaxAxis_1" contains "15 曲"
    And I will see the element "FieldAxis_2" contains "max(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "0 散"
    And I will see the element "MaxAxis_2" contains "9K 散"
    And I will see the element "Legend" contains "count(apache.resp_len)"
    And I will see the element "Legend" contains "max(apache.resp_len)"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_曲散"
    And I compare source image "actual/拖拽_<chartType>_曲散" with target image "expect/拖拽_<chartType>_曲散"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_曲散"
    And I set the parameter "DescribeInput" with value "<chart_1><color_1>_<chart_2><color_2>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_曲散'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_曲散"
    Then I will see the "trend.CreatePage" page
    And I wait for "LineChartElement" will be visible
    And I wait for "ScatterChartElement" will be visible
    And I will see the element "FieldAxis_1" contains "count(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "1 曲"
    And I will see the element "MaxAxis_1" contains "15 曲"
    And I will see the element "FieldAxis_2" contains "max(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "0 散"
    And I will see the element "MaxAxis_2" contains "9K 散"
    And I will see the element "Legend" contains "count(apache.resp_len)"
    And I will see the element "Legend" contains "max(apache.resp_len)"

    Examples:
      |  chartType |  chart_1  | chart_2  | color_1 | color_2 |
      |  Multiaxis |  曲线图   | 散点图   | Orange  | Red     |

  Scenario Outline: drag_and_drop_multiaxis_3
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Resplen" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I drag the element "Resplen" to the "Values2"
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    
    And I wait for "EditFirstField" will be visible
    And I click the "EditFirstField" button
    And I set the parameter "Unit" with value "曲"
    And I set the parameter "Max" with value "15"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_1>" from the "TypeChartField" in config
    And I choose the "计数" from the "TypeFunction" in config
    And I will see the "EditColor" doesn't exist
    And I click the "ConnectEmptyData" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond

    And I wait for "EditSecondField" will be visible
    And I click the "EditSecondField" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Max" with value "8000"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "ElementInValues2" will be visible
    When I click the "ElementInValues2" button
    And I wait for "Panel" will be visible
    And I choose the "<chart_2>" from the "TypeChartField" in config
    And I choose the "平均值" from the "TypeFunction" in config
    And I will see the "EditColor" doesn't exist
    And I set the parameter "AreaTransparency" with value "0.3" using step buttons
    And I click the "Smooth" button
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I click the "Xaxis" button
    And I click the "DescendingOrder" button
    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "2000" millsecond

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.resp_len),avg(apache.resp_len) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I will see the element "FieldAxis_1" contains "count(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "0 曲"
    And I will see the element "MaxAxis_1" contains "15 曲"
    And I will see the element "FieldAxis_2" contains "avg(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "0 面"
    And I will see the element "MaxAxis_2" contains "8K 面"
    And I will see the element "Legend" contains "GET"
    And I will see the element "Legend" contains "POST"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_对比"
    And I compare source image "actual/拖拽_<chartType>_对比" with target image "expect/拖拽_<chartType>_对比"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比"
    And I set the parameter "DescribeInput" with value "<chart_1>_<chart_2>_<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  chart_1  | chart_2  | color   |
      |  Multiaxis |  曲线图   | 面积图   | Red     |