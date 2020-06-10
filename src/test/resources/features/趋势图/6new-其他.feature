@all @trend @createTrendOther @createTrend
Feature: 趋势图新建-其他
# sample04061424_chart for Yesterday

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
@funnel
  Scenario Outline: others
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "1000" millsecond
    And I click the "Type" button

    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                          |
      | Single    | 2549    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>300,\"thumbs-down\",\"thumbs-up\"\) |
      | Radar     | 2633    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city                                   |
      | Funnel    | 2654    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt by apache.clientip \| sort by cnt, apache.clientip \|limit 5 |


  Scenario Outline: others2
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "1000" millsecond
    And I click the "Type" button

    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                          |
      | Wordcloud | 2625    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city  |

  Scenario Outline: single_icon
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") "
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | iconValue | caseNum |
      | Single    | icon      | icon    |
      | Single    | cnt       | cnt     |


  Scenario Outline: single_font
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\"  tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\")"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "<fontValue>"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | fontValue         | caseNum |
      | Single    | font-awesome-flag | font1   |
      | Single    | font-awesome      | font2   |

  Scenario Outline: single_background
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | spl                                                                                                              |
      | Single    | backgr  | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: single_trend
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | timeValue | spl                                                                                                              |
      | Single    | trend   | 一天前       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt\>1000000,\"thumbs-down\",\"thumbs-up\") |

  Scenario Outline: single_range
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum | minVal1 | maxVal1 | color1 | minVal2 | maxVal2 | color2 | colorFill  | spl                                                                                                                               |
      | Single    | rangeF  | 0       | 100     | Green  | 100     | 1000    | Red    | Font       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\)                  |
      | Single    | rangeB  | 0       | 100     | Green  | 100     | 1000    | Red    | Background | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval cnt = 99 \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: single_1000separator
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | precision | unitPosition       | buttonSwitch      | caseNum                  | spl                                                                                                        |
      | Single    | 1         | UnitPositionBefore | ThousandSeparator | prec1_1000on__before     | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |
      | Single    | 2         | UnitPositionAfter  | Background        | prec2_1000off_back_after | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |

  Scenario Outline: second_title
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AddColor" button
    And I click the "Purple" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<iconValue>" from the "FieldValue" in config
    And I click the "SecondTitle" button
    And I set the parameter "TitleName" with value "二级title"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | iconValue | caseNum     | spl                                                                                                              |
      | Single    | icon      | secondTitle | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: sparkline
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() by ts | eval time=formatdate(ts,\"hh-mm\") | limit 5 "
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count()" from the "NumericField"
    And I choose the "time" from the "DisplayField"
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "60"
    And I click the "AddColor" button
    And I click the "Purple" button
    And I click the "<colorFill>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>_<colorFill>"
    And I compare source image "actual/<chartType>_<caseNum>_<colorFill>" with target image "expect/<chartType>_<caseNum>_<colorFill>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_<colorFill>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | colorFill    | caseNum     |
      |   Single      | Background   | Sparkline   |
      |   Single      | Font         | Sparkline   |


  Scenario Outline: sparkline_facet
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart | bucket timestamp span=30m as ts | stats count() as cnt by ts, apache.method | eval time=formatdate(ts,\"hh-mm\") | eval cnt_2 = cnt*3"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_2" from the "NumericField"
    And I choose the "time" from the "DisplayField"
    And I click the "Sparkline" button
    And I choose the "ts" from the "SparklineField"
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue"
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "4000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | caseNum          |
      |   Single      | Sparkline_分面   |

  Scenario Outline: ring_onefield
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum  | spl                                                                                                                                                                                   |
      | Ring      | onefield | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_twofields
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum   | spl                                                                                                                                                                                   |
      | Ring      | twofields | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_table
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum     | rows | columns | spl                                                                                                                                                                                   |
      | Ring      | table_3r_2c | 3    | 2       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |
      | Ring      | table_1r_4c | 1    | 4       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: ring_colors
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button

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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | caseNum            | rows | columns | spl                                                                                                                                                                                   |
      | Ring      | table_1r_3c_colors | 1    | 3       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: liquidfill
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | percent | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |

  @facet
  Scenario Outline: liquidfill_facet
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | 分面    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip, apache.method \| sort by apache.clientip \| limit 2 \| eval cnt = ip_count/10|


  Scenario Outline: radar
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | divField        | color1   | caseNum | spl                                                                        |
      | Radar     | apache.geo.city | DarkBlue | 2635    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
@funnel
  Scenario Outline: funnel
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | countValue | divValue        | color1     | caseNum | spl                                                                      |
      | Funnel    | cnt        | apache.clientip | LightGreen | 2858    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt by apache.geo.city \| sort by cnt, +apache.geo.city |

  Scenario Outline: matrixheatmap
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType     | xValue          | yValue        | segNum | caseNum | spl                                                                        |
      | Matrixheatmap | count()         | apache.status | 10     | 2660    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      | Matrixheatmap | apache.geo.city | count()       | 5      | 2661    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: chain
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | color | precision | function     | parentIDvalue       | childIDvalue  | starttime                | duration            | infoValue                            | caseNum | spl                                                                                                                                                                                                                                                       |
      | Chain     | Green | 1         | dapper.class | dapper.msg.parentId | dapper.msg.id | dapper.msg.timestamp     | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2831    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp |
      | Chain     | Red   | 2         | dapper.class | dapper.msg.parentId | dapper.msg.id |                timestamp | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2982    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp |


  Scenario Outline: sequence
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | timeSeq  | source          | target   | segmentation    | mark    | caseNum | spl                                                                             |
      | Sequence  | hostname | apache.clientip | hostname | apache.clientip | count() | 2805    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 3 |

  Scenario: table
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city | limit 5"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "StatisticalChart" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/Table_Test"
    And I compare source image "actual/Table_Test" with target image "expect/Table_Test"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "Table_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

  Scenario Outline: chain_tree
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chartType | color | precision | function     | parentIDvalue       | childIDvalue  | starttime                | duration            | infoValue                            | caseNum   | spl                                                                                                                                                                                                                                                       |
      | Chain     | Green | 1         | dapper.class | dapper.msg.parentId | dapper.msg.id | dapper.msg.timestamp     | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2831_tree | starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp |
      | Chain     | Red   | 2         | dapper.class | dapper.msg.parentId | dapper.msg.id |                timestamp | dapper.msg.duration | dapper.msg.binaryAnnotations[].value | 2982_tree | starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp |


