@all @logDisplay @logDisplayOther
Feature: 日志展现_其他_单值

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: others(RZY-2303)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Single      | 2303    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |


  Scenario Outline: icon(RZY-2799)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<iconValue>" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<iconValue>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<iconValue>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>_<iconValue>"

    Examples:
      |  chartType    |   iconValue  |  caseNum  |   spl   |
      |   Single      |    icon      |   2799    |  tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |
      |   Single      |    cnt       |   2799    |  tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: background(RZY-2800)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Background" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Single      |   2800    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: trend(RZY-1369)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I set the parameter "FontSize" with value "150"
    And I choose the "<timeValue>" from the "ContrastTime" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |  caseNum  | timeValue    |   spl   |
      |   Single      |   1369    | 一天前        |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |


  Scenario Outline: backgr(RZY-1370)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "NumericField" in config
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "FontSize" with value "100"
    And I set the parameter "MinRange" with value "<minVal1>"
    And I set the parameter "MaxRange" with value "<maxVal1>"
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "<minVal2>"
    And I set the parameter "MaxRange" with value "<maxVal2>"
    And I click the "AddColor" button
    And I click the "<color2>" button
    And I click the "<colorFill>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>"

    Examples:
      |  chartType    |  caseNum  | minVal1 | maxVal1  |  color1  | minVal2 | maxVal2  |  color2  | colorFill     |   spl   |
      |   Single      |   1370    | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Font         | tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |
      |   Single      |   1370    | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Background   | tag:sample04061424_chart \| stats count() as cnt \| eval cnt = 99 \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: simple_number_view(RZY-4193,4194,4195,4196,4197)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "data" from the "NumericField" in config
    And I choose the "name" from the "DisplayField" in config
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "<precision>" from the "Precision" in config
    # Button ThousandSeparator or Background
    And I click the "<buttonSwitch>" button
    And I set the parameter "Unit" with value "个"
    And I click the "<unitPosition>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    | precision |  unitPosition       |  buttonSwitch     |  caseNum                |
      |   Single      |   1       |  UnitPositionBefore | ThousandSeparator |prec1_1000on__before     |
      |   Single      |   2       |  UnitPositionAfter  | Background        |prec2_1000off_back_after |

  Scenario Outline: sparkline
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() by ts | eval time=formatdate(ts,\"hh-mm\") | limit 5 "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count()" from the "NumericField" in config
    And I choose the "time" from the "DisplayField" in config
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField" in config
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "60"
    And I click the "AddColor" button
    And I click the "Purple" button
    And I click the "<colorFill>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>_<colorFill>"

    Examples:
      |  chartType    | colorFill    | caseNum     |
      |   Single      | Background   | Sparkline   |


  Scenario Outline: sparkline_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() as cnt by ts, apache.method | eval time=formatdate(ts,\"hh-mm\") | eval cnt_2 = cnt*3"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_2" from the "NumericField" in config
    And I choose the "time" from the "DisplayField" in config
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "FontSize" with value "80"
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "7"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "7"
    And I set the parameter "MaxRange" with value "10"
    And I click the "AddColor" button
    And I click the "Green" button
    And I click the "Background" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    | caseNum          |
      |   Single      | Sparkline_分面   |

  Scenario Outline: data_value
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() by ts | eval time=formatdate(ts,\"hh-mm\") | limit 5 "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count()" from the "NumericField" in config
    And I choose the "time" from the "DisplayField" in config
    And I choose the "<option>" from the "DisplayedOnChart" in config
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField" in config
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "60"
    And I set the parameter "Unit" with value "个"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "<fontValue>"
    And I click the "SecondTitle" button
    And I set the parameter "TitleName" with value "二级title"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<option>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>_<option>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>_<option>"

    Examples:
      |  chartType    | caseNum     | fontValue          | option         | color    |
      |   Single      | display     | air-freshener      | 两者同时展示   | Red      |
      |   Single      | display     | meh-rolling-eyes   | 仅数值字段     | Green    |
      |   Single      | display     | tablets            | 仅展示字段     | Orange   |
