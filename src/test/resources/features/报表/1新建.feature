@report @all
Feature: 报表新建（RZY-116）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: RZY-1602:改为曲线图sample2
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Line" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Right" button
    And I click the "DescendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I set the parameter "Unit" with value "吨"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Max" with value "10"
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @first @reportSmoke
    Examples: 保存成功
      | name               | describe | reportGroup    | reportType | email                     | subject                       | hour | minute | chartLists | layout  |
      | 改为曲线图sample2(WORD) | AutoTest | default_Report | WORD       | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第一种布局方式 | 11   | 00     | 曲线图sample0 | Layout1 |

  @smoke @reportSmoke
    Examples:
      | name              | describe | reportGroup    | reportType | email                     | subject                       | hour | minute | chartLists | layout  |
      | 改为曲线图sample2(URL) | AutoTest | default_Report | URL        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第一种布局方式 | 11   | 05     | 曲线图sample0 | Layout1 |

  @smoke @reportSmoke
  Scenario: RZY-2665:改为饼状图sample3
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "RZY-2665:改为饼状图sample3"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "default_Report" from the "ReportGroup"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>, 第一种布局方式"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "03"
    And I click the "NextButton" button
    And I choose the "饼状图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Pie" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "Layout1" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @first @reportSmoke
  Scenario Outline: 改为散点图雷达图sample2
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "散点图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Scatter" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Horizontal" button
    And I click the "DescendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I set the parameter "Unit" with value "g"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "11"
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I set the parameter "bubbleSizeInput" with value "count()"
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Purple" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "雷达图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Radar" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "SwitchButton" button
    And I click the "Indicator" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.status"
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples: 保存成功
      | name            | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 改为散点图雷达图sample2 | AutoTest | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第二种布局方式 | 11   | 10     | Layout2 |

  @smoke @reportSmoke
  Scenario Outline: 改为柱状图sample2+和弦图sample1+桑基图sample1报表
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "柱状图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Column" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Horizontal" button
    And I click the "DescendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I set the parameter "Unit" with value "克"
    And I set the parameter "Min" with value "1"
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Pile" button
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Purple" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "和弦图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Relation" button
    And I click the "Chord" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.x_forward"
    And I click the "target" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Weight" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "桑基图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Relation" button
    And I click the "Sankey" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.x_forward"
    And I click the "target" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Weight" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Purple" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name                                       | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)3 | AutoTest | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第3种布局方式 | 11   | 15     | Layout3 |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)5 | AutoTest | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第5种布局方式 | 11   | 20     | Layout5 |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)6 | AutoTest | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第6种布局方式 | 11   | 25     | Layout6 |

  @smoke @reportSmoke
  Scenario Outline: 改为力图sample1+区间图sample1+多Y轴图sample2+热力地图sample2+攻击地图sample1+区划地图sample2报表，crontab11：30执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoTest"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Crontab" with value "0 30 11 * * ?"
    And I click the "NextButton" button
    And I choose the "力图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Relation" button
    And I click the "Force" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.x_forward"
    And I click the "target" button
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Weight" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "区间图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Compound" button
    And I click the "Rangeline" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "ts"
    And I click the "Yaxis" button
    And I set the parameter "ActualValueInput" with value "count"
    And I set the parameter "PredictValueInput" with value "_predict_count"
    And I set the parameter "TopLimitInput" with value "upper95"
    And I set the parameter "LowerLimitInput" with value "lower95"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "多Y轴sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Compound" button
    And I click the "Multiaxis" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.resp_len"
    And I click the "Horizontal" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "max(apache.resp_len)"
    And I choose the "面积图" from the "Type"
    And I set the parameter "Unit" with value "面"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170k"
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "min(apache.resp_len)"
    And I choose the "柱状图" from the "Type"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "sum(apache.status)"
    And I choose the "散点图" from the "Type"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Max" with value "49k"
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.status"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "热力地图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Heatmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.geo.city"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "攻击地图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Attackmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I set the parameter "LongitudeInput" with value "client_lat"
    And I set the parameter "LatitudeInput" with value "client_lon"
    And I click the "Target" button
    And I set the parameter "FieldValueInput" with value "gw_address"
    And I set the parameter "LongitudeInput" with value "gw_lat"
    And I set the parameter "LatitudeInput" with value "gw_lon"
    And I click the "Weight" button
    And I set the parameter "FieldValueInput" with value "cnt"
    And I click the "Region" button
    And I click the "China" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "区划地图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Regionmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.geo.province"
    And I click the "Region" button
    And I click the "China" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name                                                                          | reportGroup    | reportType | email                     | subject                       | layout  |
      | 改为力图sample1+区间图sample1+多Y轴图sample2+热力地图sample2+攻击地图sample1+区划地图sample2报表(PDF) | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第8种布局方式 | Layout8 |

  @reportSmoke
  Scenario: 改为单值sample2+水球图sample1
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "改为单值sample2+水球图sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I choose the "default_Report" from the "ReportGroup"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>, 第4种布局方式"
    And I set the parameter "Crontab" with value "0 35 11 * * ?"
    And I click the "NextButton" button
    And I choose the "单值sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "a_"
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I choose the "一天前" from the "CompareTime"
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I set the parameter "FieldValueInput" with value "icon"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "水球图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Liquidfill" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "Layout4" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @reportSmoke
  Scenario: 改为字符云图sample1报表(EXCEL)
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "改为字符云图sample1报表(EXCEL)"
    And I set the parameter "Describe" with value "AutoTest"
    And I choose the "default_Report" from the "ReportGroup"
    And I choose the "EXCEL" from the "ReportType"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>, 第4种布局方式"
    And I set the parameter "Crontab" with value "0 40 11 * * ?"
    And I click the "NextButton" button
    And I choose the "字符云图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Wordcloud" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I click the "Layout4" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
  Scenario Outline: 改为面积图sample2+漏斗图sample1+矩阵热力图sample1+字符云图sample1报表，11：12执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"

    And I click the "NextButton" button
    And I choose the "面积图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Area" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.status"
    And I click the "Vertical" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValueInput" with value "cnt"
    And I set the parameter "Unit" with value "克"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "0"
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "ts"
    And I click the "Pile" button
    And I click the "Example" button
    And I click the "NoneExample" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Purple" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond

    And I choose the "漏斗图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Funnel" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond

    And I choose the "矩阵热力图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Matrixheatmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Horizontal" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValueInput" with value "count()"
    And I set the parameter "Segments" with value "10"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond

    And I choose the "字符云图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Wordcloud" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name                                               | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 改为面积图sample2+漏斗图sample1+矩阵热力图sample1+字符云图sample1报表 | AutoTest | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第4种布局方式 | 11   | 45     | Layout4 |

  Scenario Outline: 执行计划为crontab
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Crontab" with value "<crontab>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "<result>"

    Examples: 保存失败
      | name          | describe | runningUser | reportGroup    | reportType | email | subject | crontab     | chartLists | layout  | result                        |
      | sunxjautotest |          | owner       | default_Report | PDF        |       | test    | 0 ? * * * ? | AutoTest1  | Layout1 | 无效参数, 参数：[crontab]\n错误码: FE_7 |

  @second @reportSmoke
  Scenario: 改为热力地图sample1+攻击地图sample1+区划地图sample2报表
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "改为热力地图sample1+攻击地图sample1+区划地图sample2报表"
    And I set the parameter "Describe" with value "第6种布局方式"
    And I choose the "default_Report" from the "ReportGroup"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I set the parameter "EmailInput" with value "sun.xiaojing@yottabyte.cn"
    And I click the "Email1" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "30"
    And I click the "NextButton" button
    And I choose the "热力地图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Heatmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.geo.city"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "攻击地图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Attackmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I set the parameter "LongitudeInput" with value "client_lat"
    And I set the parameter "LatitudeInput" with value "client_lon"
    And I click the "target" button
    And I set the parameter "FieldValueInput" with value "gw_address"
    And I set the parameter "LongitudeInput" with value "gw_lat"
    And I set the parameter "LatitudeInput" with value "gw_lon"
    And I click the "Weight" button
    And I set the parameter "FieldValueInput" with value "cnt"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "区划地图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Regionmap" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValueInput" with value "apache.geo.province"
    And I click the "Region" button
    And I click the "China" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "Layout6" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @second @reportSmoke
  Scenario: 改为玫瑰图sample3+条形图sample3+旭日图sample2报表
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "改为玫瑰图sample3+条形图sample3+旭日图sample2报表"
    And I set the parameter "Describe" with value "第7种布局方式"
    And I choose the "default_Report" from the "ReportGroup"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "35"
    And I click the "NextButton" button
    And I choose the "玫瑰图sample0" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Rose" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "条形图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Bar" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I wait for "Scrollbar" will be invisible
    And I choose the "展示全部" from the "ShowLabel"
    And I choose the "柱状内中央" from the "Label"
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "旭日图sample0" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ChartType" button
    And I will see the "trend.CreatePage" page
    And I click the "Sunburst" button
    Then I will see the "report.CreatePage" page
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I set the parameter "FieldValueInput" with value "count()"
    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValueInput" with value "apache.clientip"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "Layout7" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @second @reportSmoke
  Scenario: RZY-1599:选择超过10个
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "test"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "1"
    And I set the parameter "Minute" with value "3"
    And I click the "NextButton" button
    And I click the "Chart" button
    And I click the "FirstLi" button
    And I wait for "Badge1" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge2" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge3" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge4" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge5" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge6" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge7" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge8" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge9" will be visible
    And I click the "FirstLi" button
    And I wait for "Badge10" will be visible
    And I click the "FirstLi" button
    Then I will see the success message "每个用户最多保存十个趋势图"

  Scenario Outline: 执行计划为定时（保存失败）
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "<layout>" button
    And I click the "Save" button
    Then I will see the success message "<result>"

    Examples: 保存失败
      | name  | describe | runningUser | reportGroup    | reportType | email                     | subject                                    | hour | minute | chartLists | layout  | result    |
      | 自动化测试 |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     |            | Layout1 | 报表内容 不能为空 |

  Scenario Outline: 执行下一步失败
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    Then I click the "NextButton" button
    Then I will see the success message "<result>"

    Examples:
      | name | describe | runningUser | reportGroup    | reportType | email | subject | hour | minute | result    |
      |      |          |             |                |            |       |         |      |        | 名称 不能为空   |
      | test |          |             | default_Report |            |       |         |      |        | 邮件主题 不能为空 |
      | test |          |             | default_Report |            |       | test    |      |        | 请输入小时     |
      | test |          |             | default_Report |            |       | test    | 11   |        | 请输入分钟     |

  Scenario Outline: 执行crontab失败
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    Then I set the parameter "Crontab" with value "<crontab>"
    Then I click the "NextButton" button
    Then I will see the success message "<result>"

    Examples:
      | name          | describe | runningUser | reportGroup    | reportType | email | subject | crontab | result                 |
      | sunxjautotest |          | owner       | default_Report | PDF        |       | test    |         | crontab模式下, 执行计划不能为零或空 |