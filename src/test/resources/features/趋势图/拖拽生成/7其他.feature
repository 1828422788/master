@dragAndDrop @dragAndDropOther @trend
Feature: 趋势图_拖拽_其他

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond


  Scenario Outline: drag_and_drop_single1
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I set the parameter "FontSize" with value "<size>" using step buttons
    And I click the "<button>" button
    And I wait for "AddColorSingleChart" will be visible
    And I click the "AddColorSingleChart" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_<button>"
    And I compare source image "actual/拖拽_<chartType>_<button>" with target image "expect/拖拽_<chartType>_<button>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "<color>_<size>_<button>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color  | size | button     |
      |  Single    | Green  | 80  | Background |

  Scenario Outline: drag_and_drop_single2
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I click the "AccordingTrend" button
    And I set the parameter "FontSize" with value "<size>" using step buttons
    And I click the "Absolute" button
    And I choose the "<timeValue>" from the "ContrastTime" in config

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_trend"
    And I compare source image "actual/拖拽_<chartType>_trend" with target image "expect/拖拽_<chartType>_trend"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_trend"
    And I set the parameter "DescribeInput" with value "<size>_<timeValue>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | size | timeValue   |
      |  Single    | 80   | 一天前      |

  Scenario Outline: drag_and_drop_single3
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I click the "AccordingArea" button
    And I wait for "1000" millsecond
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "<minVal1>"
    And I set the parameter "MaxRange" with value "<maxVal1>"
    And I click the "AddRange" button
    And I wait for "1000" millsecond
    And I set the parameter "MinRange" with value "<minVal2>"
    And I set the parameter "MaxRange" with value "<maxVal2>"
    And I set the parameter "FontSize" with value "<size>" using step buttons
    And I wait for "RangeColor" will be visible
    And I click the "RangeColor" button
    And I wait for "<color2>" will be visible
    And I click the "<color2>" button
    And I wait for "1000" millsecond

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.clientip)"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_area"
    And I compare source image "actual/拖拽_<chartType>_area" with target image "expect/拖拽_<chartType>_area"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_area"
    And I set the parameter "DescribeInput" with value "<size>_<minVal2>_<maxVal2>_<color2>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | size | minVal1 | maxVal1 | minVal2| maxVal2| color2 |
      |  Single    | 80   | 1       | 123     | 123    | 126    | Purple |

  Scenario Outline: 单值4
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.resp_len" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Resplen" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "平均值" from the "TypeFunction"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I click the "<tab>" button
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I set the parameter "<field>" with value "<text>"
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "2" from the "Precision"
    And I set the parameter "FontSize" with value "80" using step buttons

    And I wait for "AddColorSingleChart" will be visible
    And I click the "AddColorSingleChart" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "ThousandSeparator" button
    And I set the parameter "Unit" with value "个"
    And I set the parameter "UnitFontSize" with value "36" using step buttons
    And I click the "UnitPosition<position>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats avg(apache.resp_len)"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I will see the element "SingleElement" contains "<content>"
    And I will see the element "SingleElement" style contains "<style>"
    And I will see the element "SingleElement" style contains "font-size: <size>px"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_<tab>"
    And I compare source image "actual/拖拽_<chartType>_<tab>" with target image "expect/拖拽_<chartType>_<tab>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_<tab>"
    And I set the parameter "DescribeInput" with value "<size>_prec.2_<position>个_<text>_<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_<tab>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_<tab>"
    Then I will see the "trend.CreatePage" page
    And I will see the element "SingleElement" contains "<content>"
    And I will see the element "SingleElement" style contains "<style>"
    And I will see the element "SingleElement" style contains "font-size: <size>px"

    Examples:
      |  chartType | size | position  | tab          | button        | field      | text               | color  | content     | style             |
      |  Single    | 36   | After     | Icon         | AccordingName | IconName   | font-awesome-flag  | Green  | 个          | rgb(50, 194, 125) |

    @trendSmoke
    Examples:
      |  chartType | size | position  | tab          | button        | field      | text               | color  | content     | style             |
      |  Single    | 80   | Before    | SecondTitle  |               | TitleName  |  二级title         | Purple | 4,448.09    | rgb(161, 20, 249) |

  Scenario Outline: drag_and_drop_single5
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | eval icon_value = \"quidditch\""
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.resp_len" in trend page
    And I "checked" the checkbox which name is "icon_value" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Resplen" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "Icon" button
    And I wait for "1000" millsecond
    And I click the "AccordingField" button
    And I click the "ChartType" button
    And I wait for "2000" millsecond
    And I will see the "IconField" is display
    And I drag the element "IconValue" to the "IconField"
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I set the parameter "FontSize" with value "<size>" using step buttons

    And I wait for "AddColorSingleChart" will be visible
    And I click the "AddColorSingleChart" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | eval icon_value = "quidditch" | stats count(apache.resp_len) by icon_value"
    When I click the "CloseSPL" button
    Then I wait for "Chart" will be visible
    And I will see the element "SingleElement" contains "124"
    And I will see the element "SingleElement" style contains "<style>"
    And I will see the element "SingleElement" style contains "font-size: <size>px"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_IconField"
    And I compare source image "actual/拖拽_<chartType>_IconField" with target image "expect/拖拽_<chartType>_IconField"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_IconField"
    And I set the parameter "DescribeInput" with value "<size>_quidditch_<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | size | color  | style             |
      |  Single    | 80   | Green  | rgb(50, 194, 125) |

  @trendSmoke
  Scenario Outline: 环形比例图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | eval value1 = apache.resp_len/5000 | eval value2 = apache.resp_len/10000"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "value1" in trend page
    And I "checked" the checkbox which name is "value2" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Value1" to the "Values"
    And I drag the element "Value2" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "平均值" from the "TypeFunction"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I click the "SecondElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "平均值" from the "TypeFunction"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I wait for "AddColorSingleChart" will be visible
    And I click the "AddColorSingleChart" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I choose the "1" from the "Precision"

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | eval value1 = apache.resp_len/5000 | eval value2 = apache.resp_len/10000 | stats avg(value1),avg(value2)"
    When I click the "CloseSPL" button
    And I will see the text "avg(value1)" exist in page
    And I will see the text "avg(value2)" exist in page
    And I will see the text "展示数据" is not existed in page
    And I will see the text "对比数据" is not existed in page
    Then I wait for "Chart" will be visible
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "65.3%"
    And I will see the element "<chartType>Element_2" contains "28.2%"
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_1"
    And I compare source image "actual/拖拽_<chartType>_1" with target image "expect/拖拽_<chartType>_1"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_1"
    And I set the parameter "DescribeInput" with value "<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_1'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_1"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element_1" will be visible
    And I will see the text "展示数据" is not existed in page
    And I will see the text "对比数据" is not existed in page
    And I will see the text "avg(value1)" exist in page
    And I will see the text "avg(value2)" exist in page
    And I will see the element "<chartType>Element_1" contains "65.3%"
    And I will see the element "<chartType>Element_2" contains "28.2%"

    Examples:
      |  chartType | color  |
      |  Ring      | Green  |

  Scenario Outline: drag_and_drop_ring_interval
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | eval value1 = apache.resp_len/5000 | eval value2 = apache.resp_len/10000"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "value1" in trend page
    And I "checked" the checkbox which name is "value2" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Value1" to the "Values"
    And I drag the element "Value2" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    Then I wait for "Chart" will be visible
    And I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "平均值" from the "TypeFunction"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I click the "SecondElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "平均值" from the "TypeFunction"
    And I wait for "1000" millsecond
    And I click the "HideElement" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I click the "AccordingArea" button
    And I wait for "1000" millsecond
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "0"
    And I set the parameter "MaxRange" with value "0.6"
    And I click the "AddRange" button
    And I wait for "1000" millsecond
    And I set the parameter "MinRange" with value "0.6"
    And I set the parameter "MaxRange" with value "0.8"
    And I wait for "RangeColor" will be visible
    And I click the "RangeColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "AddRange" button
    And I wait for "1000" millsecond
    And I set the parameter "MinRange" with value "0.8"
    And I set the parameter "MaxRange" with value "1"
    And I wait for "RangeColor" will be visible
    And I click the "RangeColor" button
    And I wait for "Red" will be visible
    And I click the "Red" button
    And I wait for "1000" millsecond

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | eval value1 = apache.resp_len/5000 | eval value2 = apache.resp_len/10000 | stats avg(value1),avg(value2)"
    When I click the "CloseSPL" button
    And I will see the text "展示数据" is not existed in page
    And I will see the text "对比数据" is not existed in page
    And I will see the text "avg(value1)" exist in page
    And I will see the text "avg(value2)" exist in page
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_2"
    And I compare source image "actual/拖拽_<chartType>_2" with target image "expect/拖拽_<chartType>_2"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_2"
    And I set the parameter "DescribeInput" with value "<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color  |
      |  Ring      | Orange  |

  @trendSmoke
  Scenario Outline: 字符云图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
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
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
#    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

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
      |  chartType |  color  |
      |  Wordcloud |  Purple |

  @trendSmoke
  Scenario Outline: 漏斗图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I click the "<tab>" button
    And I click the "<button>" button
    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>_<button>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

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
      |  chartType |  color  |  button        |   tab     |
      |  Funnel    |  Orange | RightPosition  | Example   |

  @trendSmoke
  Scenario Outline: 雷达图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "CompareBy" will be visible
    And I drag the element "GeoCity" to the "CompareBy"
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
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<color>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

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
      |  chartType |  color    |
      |  Radar     |  DarkBlue |

  Scenario Outline: drag_and_drop_radar_unify_metric
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "CompareBy" will be visible
    And I drag the element "GeoCity" to the "CompareBy"
    And I wait for "2000" millsecond
    And I click the "Indicator" button
    And I wait for "1000" millsecond
    And I click the "UnifyMetric" button
    And I click the "Example" button
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I click the "Exhibition" button
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_Switch"
    And I compare source image "actual/拖拽_<chartType>_Switch" with target image "expect/拖拽_<chartType>_Switch"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_Switch"
    And I set the parameter "DescribeInput" with value "<color>_<button>_Switch"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  color    |  button        |
      |  Radar     |  DarkBlue | RightPosition  |

  Scenario Outline: drag_and_drop_radar_compare
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "<compareWith1>" from the "CompareField" in config
    And I click the "HideElement" button
    And I wait for "2000" millsecond

    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "<compareWith2>" from the "CompareField" in config
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I click the "Example" button
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I click the "<color>" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "starttime="now/d" endtime="now" tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city| eval _compare="当前" | append [[ starttime="now/d-1d" endtime="now-1d" tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city| eval _compare="环比" ]] | append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city| eval _compare="同比一周" ]]"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_对比"
#    And I compare source image "actual/拖拽_<chartType>_对比" with target image "expect/拖拽_<chartType>_对比"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比"
    And I set the parameter "DescribeInput" with value "<color>_<button>_<compareWith1>_<compareWith2>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  color    |  button        | compareWith1 | compareWith2 |
      |  Radar     |  DarkBlue | RightPosition  | 环比         | 上周同比值   |

  @trendSmoke
  Scenario Outline: 矩阵热力图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.geo.city" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "GeoCity" to the "Values"
    And I drag the element "GeoCity" to the "Dimensions"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I click the "Xaxis" button
    And I wait for "1000" millsecond
    And I click the "ThirdLabel" button
    And I click the "Exhibition" button
    And I will see the input element "Segments" value will be "10"
    And I set the parameter "Segments" with value "<segments>" using step buttons
    And I click the "Example" button
    And I wait for "1000" millsecond
    And I click the "RightPosition" button

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.geo.city) by apache.geo.city"
    When I click the "CloseSPL" button
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<chartType>_<segments>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

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
      |  chartType     | segments   |
      |  Matrixheatmap | 5          |

  Scenario Outline: drag_and_drop_order_table
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "tag:sample04061424_chart | stats count(apache.clientip)"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_2"
#    And I compare source image "actual/拖拽_<chartType>_2" with target image "expect/拖拽_<chartType>_2"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_2"
    And I set the parameter "DescribeInput" with value "Table"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |
      |  Table     |

  Scenario Outline: drag_and_drop_order_table_compare
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Values"
    And I wait for "<chartType>" will be visible
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    When I click the "ElementInValues" button
    And I wait for "Panel" will be visible
    And I choose the "上周同比值" from the "CompareField" in config
    And I click the "HideElement" button
    And I wait for "2000" millsecond

    And I click the "HideElement" button
    And I click the "CheckSPL" button
    And I wait for "SPL" will be visible
    And I will see the element "SPL" contains "starttime="now/d" endtime="now" tag:sample04061424_chart | stats count(apache.clientip) | eval _compare="当前" | append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart | stats count(apache.clientip) | eval _compare="同比一周" ]]"
    When I click the "CloseSPL" button
    And I wait for "Header" will be visible
    And I will see the text "当前" exist in page
    And I will see the text "同比一周" exist in page
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>_对比_2"
#    And I compare source image "actual/拖拽_<chartType>_对比_2" with target image "expect/拖拽_<chartType>_对比_2"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_对比_2"
    And I set the parameter "DescribeInput" with value "Table_上周同比值"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'拖拽_<chartType>_对比_2'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "拖拽_<chartType>_对比_2"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I will see the text "当前" exist in page
    And I will see the text "同比一周" exist in page


    Examples:
      |  chartType |
      |  Table     |