@trend @createTrendOther @createTrend
Feature: 趋势图新建_其他

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: others
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I wait for "2000" millsecond

    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                          |
      | Single    | 2549    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>300,\"thumbs-down\",\"thumbs-up\"\) |
      | Radar     | 2633    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city                                   |
      | Funnel    | 2654    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt by apache.clientip \| sort by cnt, apache.clientip \|limit 5 |


  Scenario Outline: others2
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I wait for "2000" millsecond

    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                          |
      | Wordcloud | 2625    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city  |


  Scenario Outline: others_wordcloud_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond

    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Wordcloud   | 分面    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.method \| limit 7 |


  Scenario Outline: single_icon
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") "
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<iconValue>" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 100px"
    And I will see the element "<chartType>Element" style contains "color: rgb(92, 157, 245)"
    And I will see the element "<chartType>Element" contains "124"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | iconValue | caseNum |
      | Single    | icon      | icon    |
      | Single    | cnt       | cnt     |

  Scenario Outline: single_background
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Background" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 100px"
    And I will see the element "<chartType>Element" style contains "color: rgb(255, 255, 255)"
    And I will see the element "<chartType>Element" contains "124"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                              |
      | Single    | backgr  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: single_trend
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AccordingTrend" button
    And I choose the "<timeValue>" from the "ContrastTime" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 100px"
    And I will see the element "<chartType>Element" style contains "color: rgb(255, 255, 255)"
    And I will see the element "<chartType>Element" contains "124"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | timeValue | spl                                                                                                              |
      | Single    | trend   | 一天前       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: single_range
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "NumericField" in config
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I click the "AddRange" button
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
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "<style>"
    And I will see the element "<chartType>Element" contains "<num>"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | minVal1 | maxVal1 | color1 | minVal2 | maxVal2 | color2 | colorFill  | num |  style                   | spl                                                                                                                               |
      | Single    | rangeF  | 0       | 100     | Green  | 100     | 1000    | Red    | Font       | 124 | color: rgb(248, 0, 80)   |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\")                  |
      | Single    | rangeB  | 0       | 100     | Green  | 100     | 1000    | Red    | Background | 99  | color: rgb(255, 255, 255)|starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval cnt = 99 \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: single_1000separator
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "data" from the "NumericField" in config
    And I choose the "name" from the "DisplayField" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "<precision>" from the "Precision" in config
    # Button ThousandSeparator or Background
    And I click the "<buttonSwitch>" button
    And I set the parameter "Unit" with value "个"
    And I click the "<unitPosition>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "<style>"
    And I will see the element "<chartType>Element" contains "<num>"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | precision | unitPosition       | buttonSwitch      | caseNum                  |     style                | num       |spl                                                                                                        |
      | Single    | 1         | UnitPositionBefore | ThousandSeparator | prec1_1000on__before     | color: rgb(251, 173, 8)  | 1,906.6   |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |
      | Single    | 2         | UnitPositionAfter  | Background        | prec2_1000off_back_after | color: rgb(255, 255, 255)| 个        |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |


  Scenario Outline: sparkline
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() by ts | eval time=formatdate(ts,\"hh-mm\") | limit 5 "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
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
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 60px"
    And I will see the element "<chartType>Element" style contains "color: rgb(255, 255, 255)"
    And I will see the element "<chartType>Element" contains "5"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>_<colorFill>"
    And I compare source image "actual/<chartType>_<caseNum>_<colorFill>" with target image "expect/<chartType>_<caseNum>_<colorFill>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_<colorFill>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | colorFill    | caseNum     |
      |   Single      | Background   | Sparkline   |

  Scenario Outline: data_value_display
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() by ts | eval time=formatdate(ts,\"hh-mm\") | limit 5 "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
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
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 60px"
    And I will see the element "<chartType>Element" style contains "<style>"
    And I will see the element "<chartType>Element" contains "个"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<option>"
    And I compare source image "actual/<chartType>_<option>" with target image "expect/<chartType>_<option>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<option>"
    And I set the parameter "DescribeInput" with value "<option>_<color>_<fontValue>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | fontValue          | option         | color    |  style                   |
      |   Single      | meh-rolling-eyes   | 仅数值字段     | Green    | color: rgb(50, 194, 125) |
      |   Single      | tablets            | 仅展示字段     | Orange   | color: rgb(251, 173, 8)  |

  Scenario Outline: sparkline_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() as cnt by ts, apache.method | eval time=formatdate(ts,\"hh-mm\") | eval cnt_2 = cnt*3"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_2" from the "NumericField" in config
    And I choose the "time" from the "DisplayField" in config
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField" in config
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "FontSize" with value "80"
    And I click the "AddRange" button
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
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the element "<chartType>Element" style contains "font-size: 80px"
    And I will see the element "<chartType>Element" style contains "color: rgb(255, 255, 255)"
    And I will see the element "<chartType>Element" contains "6"
    And I wait for "4000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | caseNum          |
      |   Single      | Sparkline_分面   |

  Scenario Outline: ring_onefield
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum  | spl                                                                                                                                                                                   |
      | Ring      | onefield | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_twofields
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
#    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"

    Examples:
      | chartType | caseNum   | spl                                                                                                                                                                                   |
      | Ring      | twofields | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_table
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
#    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum     | rows | columns | spl                                                                                                                                                                                   |
      | Ring      | table_3r_2c | 3    | 2       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |
      | Ring      | table_1r_4c | 1    | 4       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: ring_colors
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
#    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button

    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "0"
    And I set the parameter "MaxRange" with value "0.2"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.2"
    And I set the parameter "MaxRange" with value "0.7"
    And I click the "AddColor" button
    And I click the "Yellow" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.7"
    And I set the parameter "MaxRange" with value "1"
    And I click the "AddColor" button
    And I click the "Green" button

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum            | rows | columns | spl                                                                                                                                                                                   |
      | Ring      | table_1r_3c_colors | 1    | 3       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: liquidfill
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_perc" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "1" from the "Precision" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | percent | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 \| sort by +cnt|

  Scenario Outline: liquidfill_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | 分面    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip, apache.method \| sort by apache.clientip \| limit 2 \| eval cnt = ip_count/10|


  Scenario Outline: radar
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I choose the "<divField>" from the "FieldValue" in config
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue" in config
    And I click the "UnifyMetric" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | divField        | color1   | caseNum | spl                                                                        |
      | Radar     | apache.geo.city | DarkBlue | 2635    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: funnel
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "1000" millsecond
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<countValue>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue" in config
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | countValue | divValue        | color1     | caseNum | spl                                                                      |
      | Funnel    | cnt        | apache.clientip | LightGreen | 2858    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt by apache.geo.city \| sort by cnt, +apache.geo.city |

  Scenario Outline: matrixheatmap
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue" in config
    And I click the "Yaxis" button
    And I choose the "<yValue>" from the "FieldValue" in config
    And I set the parameter "Segments" with value "<segNum>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      | chartType     | xValue          | yValue        | segNum | caseNum | spl                                                                        |
      | Matrixheatmap | count()         | apache.status | 10     | 2660    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      | Matrixheatmap | apache.geo.city | count()       | 5      | 2661    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: chain
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function" in config
    And I choose the "<parentIDvalue>" from the "ParentId" in config
    And I choose the "<childIDvalue>" from the "ChildId" in config
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime" in config
    And I choose the "<duration>" from the "KeepTime" in config
    And I click the "Info" button
    And I move the mouse pointer to the "InfoColumnIcon"
    And I click the "CloseIcon" button
    And I choose the "<duration>" from the "InfoColumn" in config
    And I choose the "<infoValue>" from the "InfoField" in config
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "ChainTableElement" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "ChainTableElement" will be visible

    Examples:
      | chartType | color | precision | function     | parentIDvalue       | childIDvalue  | starttime                | duration            | infoValue                            | caseNum | spl                                                                                                                                                                                                                                                       |
      | Chain     | Green | 1         | dapper.class | dapper.msg.parentId | dapper.msg.id | dapper.msg.timestamp     | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2831    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp \| sort by dapper.msg.duration|
      | Chain     | Red   | 2         | dapper.class | dapper.msg.parentId | dapper.msg.id |                timestamp | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2982    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp \| sort by dapper.msg.duration|


  Scenario Outline: sequence
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "<timeSeq>" from the "FieldValue" in config
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue" in config
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<segmentation>" from the "FieldValue" in config
    And I click the "Mark" button
    And I choose the "<mark>" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    Examples:
      | chartType | timeSeq  | source          | target   | segmentation    | mark    | caseNum | spl                                                                             |
      | Sequence  | hostname | apache.clientip | hostname | apache.clientip | count() | 2805    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 3 |

  Scenario: table
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city | limit 5"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond

    And I wait for "Header" will be visible
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/Table_Test"
    And I compare source image "actual/Table_Test" with target image "expect/Table_Test"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "Table_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'Table_Test'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "Table_Test"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible


  Scenario Outline: chain_tree
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function" in config
    And I choose the "<parentIDvalue>" from the "ParentId" in config
    And I choose the "<childIDvalue>" from the "ChildId" in config
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime" in config
    And I choose the "<duration>" from the "KeepTime" in config
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue" in config
    And I click the "Info" button
    And I choose the "<infoValue>" from the "InfoField" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision" in config
    And I choose the "tree" from the "TracingType" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "ChainTreeElement" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | color | precision | function     | parentIDvalue       | childIDvalue  | starttime                | duration            | infoValue                            | caseNum   | spl                                                                                                                                                                                                                                                       |
      | Chain     | Green | 1         | dapper.class | dapper.msg.parentId | dapper.msg.id | dapper.msg.timestamp     | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2831_tree | starttime=\"now/d\" endtime=\"now/d+24h\" tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp \| sort by dapper.msg.duration|
      | Chain     | Red   | 2         | dapper.class | dapper.msg.parentId | dapper.msg.id |                timestamp | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2982_tree | starttime=\"now/d\" endtime=\"now/d+24h\" tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp \| sort by dapper.msg.duration|

  Scenario Outline: network
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.go.city | limit 10"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Indicators" button
    And I click the "AddIndicator" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "5"
    And I set the parameter "MaxRange" with value "7"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "7"
    And I set the parameter "MaxRange" with value "8"
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "<repValue>"
    And I click the "AddColor" button
    And I click the "<color_1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_1"
    And I compare source image "actual/<chartType>_1" with target image "expect/<chartType>_1"
    And I click the Circle "Click<node>" button
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_2"
    And I compare source image "actual/<chartType>_2" with target image "expect/<chartType>_2"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>"
    And I set the parameter "DescribeInput" with value "in<color>_out<color_1>_<repValue>_<node>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button under some element

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible
    And I click the "Click<node>" button

    Examples:
      |  chartType    | color   | color_1 | repValue |  node    |
      |  NetworkNode  | Red     | Orange  | 20       |  Beijing |


  Scenario Outline: sunburst
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "SunElement" will be visible
    And I will see the element "SunElement" contains "T_1"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>"
    And I compare source image "actual/<chartType>" with target image "expect/<chartType>"
    Then I click the "NextButton" button under some element
    And I wait for "NameInput" will be visible
    And I click the "BackButton" button under some element
    And I wait for "Chart" will be visible
    Then I click the "NextButton" button under some element
    And I wait for "2000" millsecond

    When I set the parameter "NameInput" with value "<chartType>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
    | chartType  |  spl  |
    | sunburst   |  \| makeresults count=10 \| eval app=\"test_1\" \| eval tag=\"T_1\" \| append [[ \| makeresults count=10 \| eval app=\"test_2\" \| eval tag=\"T_2\"]] \| chart rendertype=\"sunburst\" count() over tag by app|
