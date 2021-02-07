@reportCreateCharts @allReports @reportChartsWORD
Feature: 报表新建_编辑_序列word
#5

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now

  Scenario Outline: new_report_trend_Order_button
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<order>_<unit>_<button>_<min>_<max>_<legendPosition>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.clientip,apache.method" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"
    And I click the "<button>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart | label        | order           |  unit  |  button        | min |   max  | legendPosition |  name    |
      |  WORD       | LineChart | FirstLabel   |                 |   个   |  Smooth        |  1  |   25   | FirstPosition  |LineChart |
      |  WORD       | AreaChart | SecondLabel  | AscendingOrder  |  pcs.  |ConnectEmptyData|     |   20   | SecondPosition |AreaChart |


# Save two times to save parameters
  Scenario Outline: new_report_trend_Order_Pile
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<order>_<unit>_Pile_<min>_<max>_<legendPosition>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.clientip,apache.method" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"
    And I click the "Pile" button

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button
    ###
    And I click the "EditButton" button
    And I click the "EnsureButton" button
    ###
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart | label      | order           | unit | min | max | legendPosition |  name          |
      |  WORD       |   AreaChart | ThirdLabel | DescendingOrder | pcs. | 2   | 25  | ThirdPosition  |AreaChart_Pile  |
      |  WORD       | ColumnChart | ThirdLabel | DescendingOrder | 个   | 0   | 20  | ThirdPosition  |ColumnChart_Pile|

  Scenario Outline: new_report_trend_Order_bubbles
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<unit>_Bubbles_<legendPosition>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.clientip,apache.method" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"

    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I set the parameter "BubbleSize" with value "count()"

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart    | label       | unit | legendPosition |  name        |
      |  WORD       | ScatterChart | SecondLabel | 个   | FirstPosition  |ScatterChart  |

  Scenario Outline: new_report_trend_timechart
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<unit>_<button>_<min>_<max>_<color>"
    And I set the value "<SPL>" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Yaxis" button
    And I set the parameter "unit" with value "<unit>"
    And I click the "<button>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"


    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart   |  unit  |  button        | min |   max  | color  |  name     | SPL   |
      |  WORD       | ColumnChart |   个   |                |     |   35   | Green  |Timechart1 | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| timechart sep="sep分格" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="column" count() min(apache.resp_len) by apache.status|
      |  WORD       | LineChart   |  pcs   |  Smooth        |  4  |   32   | Red    |Timechart2 | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype="line"  count() min(apache.resp_len) by apache.status |



