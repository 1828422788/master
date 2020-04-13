@all @trend @createTrendOther @createTrend
Feature: 趋势图新建-其他
# 28
# sample04061424_chart for Today
# uncomment comparison

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: others
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Single      | 2549    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>300,\"thumbs-down\",\"thumbs-up\"\) |
      |   Wordcloud   | 2625    | tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Radar       | 2633    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   Funnel      | 2654    | tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5 |

  Scenario Outline: single_icon
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<iconValue>" from the "FieldValue"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |   iconValue  |  caseNum  |   spl   |
      |   Single      |    icon      |   icon    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      |    cnt       |   cnt     | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |


  Scenario Outline: single_font
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |   fontValue       |  caseNum  |   spl   |
      |   Single      | font-awesome-flag |   font1   | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      | font-awesome      |   font2   | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: single_background
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Single      |   backgr  | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: single_trend
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AccordingTrend" button
    And I choose the "<timeValue>" from the "ContrastTime"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |  caseNum  | timeValue    |   spl   |
      |   Single      |   trend   | 一天前        |tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: single_range
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |  caseNum  | minVal1 | maxVal1  |  color1  | minVal2 | maxVal2  |  color2  | colorFill     |   spl   |
      |   Single      |   rangeF  | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Font         |tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      |   rangeB  | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Background   |tag:sample04061424_chart \| stats count\(\) as cnt \| eval cnt = 99 \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: single_1000separator
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "data" from the "NumericField"
    And I choose the "name" from the "DisplayField"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "<precision>" from the "Precision"
    # Button ThousandSeparator or Background
    And I click the "<buttonSwitch>" button
    And I set the parameter "Unit" with value "个"
    And I click the "<unitPosition>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | precision |  unitPosition       |  buttonSwitch     |  caseNum                |   spl   |
      |   Single      |   1       |  UnitPositionBefore | ThousandSeparator |prec1_1000on__before     |  tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |
      |   Single      |   2       |  UnitPositionAfter  | Background        |prec2_1000off_back_after |  tag:sample04061424_chart \| stats count() as cnt \| eval data = cnt*cnt*cnt/1000 \| eval name = \"result\" |


  Scenario Outline: ring_onefield
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  onefield |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_twofields
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  twofields|tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: ring_table
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |    caseNum   | rows    |  columns  |   spl   |
      |   Ring        | table_3r_2c  |  3      |   2       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |
      |   Ring        | table_1r_4c  |  1      |   4       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: ring_colors
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue"
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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |    caseNum          | rows    |  columns  |   spl   |
      |   Ring        | table_1r_3c_colors  |  1      |   3       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline: liquidfill
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_perc" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "1" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    |   caseNum  |   spl   |
      |   Liquidfill  |  percent   | tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |


  Scenario Outline: radar
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I choose the "<divField>" from the "FieldValue"
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue"
    And I click the "UnifyMetric" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | divField       | color1   | caseNum  |   spl   |
      |   Radar       | apache.geo.city| DarkBlue | 2635     | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: funnel
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "1000" millsecond
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<countValue>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue"
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
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType    | countValue |  divValue      |  color1   |caseNum  |   spl   |
      |   Funnel      |  count()   | apache.clientip|LightGreen |2858    | tag:sample04061424_chart \|  stats count() by apache.clientip \| limit 5 |

  Scenario Outline: matrixheatmap
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue"
    And I click the "Yaxis" button
    And I choose the "<yValue>" from the "FieldValue"
    And I set the parameter "Segments" with value "<segNum>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap |  count()        | apache.status |  10    |2660    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |  Matrixheatmap | apache.geo.city |    count()    |  5     |2661    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: chain
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function"
    And I choose the "<parentIDvalue>" from the "ParentId"
    And I choose the "<childIDvalue>" from the "ChildId"
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime"
    And I choose the "<duration>" from the "KeepTime"
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue"
    And I click the "Info" button
    And I choose the "<infoValue>" from the "InfoField"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | color  | precision |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     | Green  | 1         |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2831    |tag:dapper_auto AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, collector_recv_timestamp|
      |  Chain     | Red    | 2         |dapper.class | dapper.msg.parentId  | dapper.msg.id |collector_recv_timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2982    |tag:dapper_auto AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, collector_recv_timestamp|


  Scenario Outline: sequence
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "<timeSeq>" from the "FieldValue"
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue"
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<segmentation>" from the "FieldValue"
    And I click the "Mark" button
    And I choose the "<mark>" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  timeSeq  |  source         | target    |   segmentation    | mark   | caseNum |   spl   |
      |  Sequence  | hostname  | apache.clientip | hostname  |  apache.clientip  | count()|  2805   |tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 3|

  Scenario: table
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.city | limit 5"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "StatisticalChart" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "trend/Table_Test"
#    Then I compare source image "src/test/resources/expect/趋势图/Table_Test.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/Table_Test.png"
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "Table_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible