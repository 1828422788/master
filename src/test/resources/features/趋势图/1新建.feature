Feature: 趋势图新建

  @first @trendSmoke
  Scenario Outline: 单值sample1（RZY-2550）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I click the "<colourFilling>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2550"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "单值sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "55"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name               | spl                                                                                            | colourFilling |
      | RZY-2550:单值sample1 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | Background    |

  @first @trendSmoke
  Scenario Outline: 单值sample2（RZY-2551）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I choose the "<time>" from the "CompareTime"
    And I click the "<exhibition>" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2551"
    And I click the "Save" button

    Examples:
      | name               | spl                                                                                            | time | exhibition |
      | RZY-2551:单值sample2 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | 一天前  | Percent    |

  Scenario Outline: 序列图sample1（RZY-2477、2005、2491、2499、2522）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I click the "<chartType>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @first @trendSmoke
    Examples:
      | name                | spl                                                                          | chart | chartType | reportName   | hour | minute | num  |
      | RZY-2477:曲线图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Order | Line      | 曲线图sample1报表 | 11   | 50     | 2477 |
      | RZY-2005:柱状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Order | Column    | 柱状图sample1报表 | 12   | 05     | 2005 |

  @all @smoke @trendSmoke @trend
    Examples:
      | name                | spl                                                                                                                      | chart | chartType | reportName   | hour | minute | num  |
      | RZY-2491:面积图sample1 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 | Order | Area      | 面积图sample1报表 | 11   | 55     | 2491 |
      | RZY-2499:散点图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Order | Scatter   | 散点图sample1报表 | 12   | 00     | 2499 |

  @second @trendSmoke
    Examples:
      | name                | spl                                                                                                                                                                             | chart    | chartType | reportName    | hour | minute | num  |
      | RZY-2522:多Y轴sample1 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound | Multiaxis | 多Y轴图sample1报表 | 12   | 10     | 2522 |

  Scenario Outline: 热力地图、旭日图sample1（RZY-2539、2851）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I click the "<type>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "40"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @second @trendSmoke
    Examples:
      | name                | spl                                                                          | chart     | type     | num  |
      | RZY-2851:旭日图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Sunburst | 2851 |

  @first @trendSmoke
    Examples:
      | name                 | spl                                                    | chart | type    | num  |
      | RZY-2539:热力地图sample1 | tag:sample04061424 \| stats count() by apache.geo.city | Map   | Heatmap | 2539 |

  Scenario Outline: 水球图sample1、字符云图sample1、饼状图sample2（RZY-2563、RZY-2626、RZY-2663）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @first @trendSmoke
    Examples:
      | name                | spl                                                                          | chartType | type | colour | hour | minute | num  |
      | RZY-2663:饼状图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie  | Yellow | 13   | 07     | 2663 |

  @third @trendSmoke
    Examples:
      | name                 | spl                                                          | chartType | type      | colour | hour | minute | num  |
      | RZY-2626:字符云图sample1 | tag:*display \| stats count() by apache.clientip \| limit 10 | Other     | Wordcloud | Orange | 13   | 05     | 2626 |

  @second @trendSmoke
    Examples:
      | name                | spl                                                          | chartType | type       | colour | hour | minute | num  |
      | RZY-2563:水球图sample1 | tag:*display \| stats count() by apache.clientip \| limit 10 | Other     | Liquidfill | Orange | 13   | 00     | 2563 |

  @second @trendSmoke
  Scenario Outline: 雷达图sample1、漏斗图sample1（RZY-2635、2658）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "<type>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                        | type   | hour | minute | num  |
      | RZY-2635:雷达图sample1 | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10 | Radar  | 13   | 10     | 2635 |
      | RZY-2658:漏斗图sample1 | tag:*display \| stats count() by apache.clientip \| limit 8                | Funnel | 13   | 15     | 2658 |

  @second @trendSmoke
  Scenario Outline: 雷达图sample2（RZY-2646）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Radar" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Divide" button
    And I click the "SwitchButton" button
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2646"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                        |
      | RZY-2646:雷达图sample2 | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10 |

  @second @trendSmoke
  Scenario Outline: 循序图sample1（RZY-2631）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Sequence" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "timestamp" from the "SettingSelect"
    And I click the "Source" button
    And I choose the "sequence.from" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "sequence.to" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "sequence.msgid" from the "SettingSelect"
    And I click the "Mark" button
    And I choose the "sequence.relatemsg" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2631"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "20"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                                         |
      | RZY-2631:循序图sample1 | tag:seq_test \| table timestamp,sequence.from,sequence.to,sequence.relatemsg,sequence.msgid |

  @second @trendSmoke
  Scenario Outline: 单值sample3（RZY-2552）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "300"
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "search"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2552"
    And I click the "Save" button

    Examples:
      | name               | spl                                                                                            |
      | RZY-2552:单值sample3 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") |

  @second @trendSmoke
  Scenario Outline: 矩阵热力图sample1（RZY-2661）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "<type>" button
    And I click the "Setting" button under some element
    And I click the "Horizontal" button under some element
    And I click the "Generate" button under some element
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2661"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "25"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                  | spl                                                         | type          |
      | RZY-2661:矩阵热力图sample1 | tag:*display \| stats count() by apache.clientip \| limit 8 | Matrixheatmap |

  @second @trendSmoke
  Scenario Outline: RZY-2962:pivot_调用链sample1
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:gf_dapper* AND dapper.msg.traceId:"511f8756ce1d0b8a" dapper.msg.duration:>0  | table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Tracing" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "dapper.class" from the "SettingSelect"
    And I choose the "dapper.msg.parentId" from the "ParentId"
    And I choose the "dapper.msg.id" from the "ChildId"
    And I click the "Time" button
    And I choose the "dapper.msg.timestamp" from the "SettingSelect"
    And I choose the "dapper.msg.duration" from the "KeepTime"
    And I click the "Info" button
    And I choose the "dapper.msg.binaryAnnotations[].value" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2962"
    And I click the "Save" button

    Examples:
      | name               |
      | RZY-2962:调用链sample |

  @second @trendSmoke
  Scenario Outline: RZY-3080:pivot_chart指令sample0
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "| makeresults count = 10 | eval app = "test" | eval tag = "t" | append [[ | makeresults count = 10 | eval app = "rcl" | eval tag = "r" ]] | chart rendertype = "sunburst" count() over tag by app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/3080"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "10"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                    |
      | RZY-3080:chart指令sample0 |

  @second @trendSmoke
  Scenario Outline: RZY-3085:pivot_力图sample2
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Relation" button
    And I click the "Force" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.x_forward" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "SettingSelect"
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "500"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/3085"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "10"
    And I set the parameter "Minute" with value "05"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name               |
      | RZY-3085:力图sample2 |

  @second @trendSmoke
  Scenario Outline: 攻击地图sample1（RZY-2542）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I choose the "client_lat" from the "Longitude"
    And I choose the "client_lon" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "SettingSelect"
    And I choose the "gw_lat" from the "Longitude"
    And I choose the "gw_lon" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2542"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "攻击地图sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "45"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                 | spl                                                                                                                                                                                                                                                                                           |
      | RZY-2542:攻击地图sample1 | tag:sample04061424 \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |

  @second @trendSmoke
  Scenario Outline: 攻击地图sample2（RZY-2543）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I choose the "client_lat" from the "Longitude"
    And I choose the "client_lon" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "SettingSelect"
    And I choose the "gw_lat" from the "Longitude"
    And I choose the "gw_lon" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Region" button
    And I click the "China" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2543"
    And I click the "Save" button

    Examples:
      | name                 | spl                                                                                                                                                                                                                                                                                           |
      | RZY-2543:攻击地图sample2 | tag:sample04061424 \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |

  @second @trendSmoke
  Scenario Outline: 区划地图sample1（RZY-2546）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Region" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2546"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "区划地图sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                 | spl                                                                                           |
      | RZY-2546:区划地图sample1 | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |

  @second @trendSmoke
  Scenario Outline: 区划地图sample2（RZY-2547）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Divide" button
    And I choose the "apache.geo.province" from the "SettingSelect"
    And I click the "Region" button
    And I click the "China" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2547"
    And I click the "Save" button

    Examples:
      | name                 | spl                                                                                           |
      | RZY-2547:区划地图sample2 | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |

  @second @trendSmoke
  Scenario Outline: 多Y轴图sample2（RZY-2523）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I choose the "max(apache.resp_len)" from the "SettingSelect"
    And I choose the "面积图" from the "Type"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170k"
    And I click the "AddField" button
    And I choose the "min(apache.resp_len)" from the "FiledValue2"
    And I choose the "柱状图" from the "Type"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I click the "AddField" button
    And I choose the "sum(apache.status)" from the "FiledValue3"
    And I choose the "散点图" from the "Type"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Max" with value "49k"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2523"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                                                                                                                             | chartType | chart     | tag        | order          |
      | RZY-2523:多Y轴sample2 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound  | Multiaxis | Horizontal | AscendingOrder |

  @second @trendSmoke
  Scenario Outline: 区间图sample1（RZY-2516）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "ts" from the "SettingSelect"
    And I click the "Yaxis" button
    And I choose the "count" from the "SettingSelect"
    And I choose the "_predict_count" from the "Predict"
    And I choose the "upper95" from the "TopLimit"
    And I choose the "lower95" from the "LowerLimit"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2516"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "35"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                                                                        | chartType | chart     | reportName   |
      | RZY-2516:区间图sample1 | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts | Compound  | Rangeline | 区间图sample1报表 |

  Scenario Outline: 条形图、旭日图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状内中央" from the "Label"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button

  @second @trendSmoke
    Examples:
      | name                | spl                                                                          | chartType | type     | colour | num  |
      | RZY-2856:旭日图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Sunburst | Orange | 2856 |

  @all @smoke @trendSmoke @trend
    Examples:
      | name                | spl                                                                          | chartType | type | colour | num  |
      | RZY-2679:条形图sample3 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar  | Yellow | 2679 |

  Scenario Outline: 和弦桑基力图sample1（RZY-2506、2508、2512）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.x_forward" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "<startColour>" button
    And I click the "<colour>" button
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @second @trendSmoke
    Examples:
      | name                | spl                                                                                                                                                                                                            | chartType | chart  | reportName   | startColour | colour | hour | minute | num  |
      | RZY-2512:桑基图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Sankey | 桑基图sample1报表 | StartColour | Purple | 12   | 20     | 2512 |

  @all @smoke @trendSmoke @trend
    Examples:
      | name                | spl                                                                                                                                                                                                            | chartType | chart | reportName   | startColour | colour | hour | minute | num  |
      | RZY-2506:和弦图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Chord | 和弦图sample1报表 |             |        | 12   | 15     | 2506 |
      | RZY-2508:力图sample1  | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Force | 力图sample1报表  |             |        | 12   | 25     | 2508 |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 序列图（RZY-2479、2483、2500）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Order" button
    And I click the "<chart>" button
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button under some element
    And I click the "<connectEmptyData>" button under some element
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Group" button
    And I click the "<pile>" button
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                                                                      | chart  | tag        | order           | unit | smooth | connectEmptyData | min | max | pile | position       | colour | num  |
      | RZY-2479:曲线图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Line   | Right      | DescendingOrder | 吨    | Smooth | ConnectEmptyData |     | 10  |      | SecondPosition | Green  | 2479 |
      | RZY-2483:面积图sample2 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 | Area   | Vertical   | AscendingOrder  | 克    | Smooth | ConnectEmptyData | 0   |     | Pile | NoneExample    | Purple | 2483 |
      | RZY-2500:柱状图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Column | Horizontal | DescendingOrder | 克    |        |                  | 1   |     | Pile | SecondPosition | Purple | 2500 |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 散点图sample2（RZY-2492）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Order" button
    And I click the "<chart>" button
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2492"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                          | chart   | tag        | order           | unit | smooth | connectEmptyData | min | max | position      | colour |
      | RZY-2492:散点图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Scatter | Horizontal | DescendingOrder | g    |        |                  | 1   | 11  | FirstPosition | Purple |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 饼状图sample1、条形图sample1（RZY-2504、2677）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<num>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                          | chartType | chart | reportName   | hour | minute | num  |
      | RZY-2504:饼状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie   | 饼状图sample1报表 | 12   | 30     | 2504 |
      | RZY-2677:条形图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar   | 条形图sample1报表 | 12   | 32     | 2677 |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 饼状图sample3（RZY-2664）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2664"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                          | chartType | type | colour |
      | RZY-2664:饼状图sample3 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie  | Orange |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 条形图sample2（RZY-2678）
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状外左侧" from the "Label"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2678"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "12"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                | spl                                                                          | chartType | type | colour |
      | RZY-2678:条形图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar  | Orange |

  @all @smoke @trendSmoke @trend
  Scenario Outline: RZY-3117、3129、3131、3133
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<chartName>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "9"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                                     | spl                                                                                                                                                                                                            | chartName | minute |
      | RZY-3117:pivot_timechart_line_sample0    | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype="line" count() min(apache.resp_len) by apache.status     | 3117      | 30     |
      | RZY-3129:pivot_timechart_area_sample0    | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area" count() min(apache.resp_len) by apache.status     | 3129      | 31     |
      | RZY-3131:pivot_timechart_scatter_sample0 | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="scatter"  count() min(apache.resp_len) by apache.status | 3131      | 32     |
      | RZY-3133:pivot_timechart_column_sample0  | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="column" count() min(apache.resp_len) by apache.status   | 3133      | 33     |

  @all @smoke @trendSmoke @trend
  Scenario Outline: RZY-3118、3130、3132、3135
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Right" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "0"
    And I set the parameter "Max" with value "1000"
    And I click the "Example" button
    And I click the "<example>" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<canvasName>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to window "报表"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "9"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | spl                                                                                                                                                                                                            | name                                     | smooth | connectEmptyData | example       | position       | canvasName | minute |
      | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype="line"  count() min(apache.resp_len) by apache.status    | RZY-3118:pivot_timechart_line_sample1    | Smooth | ConnectEmptyData | RightPosition | ThirdPosition  | 3118       | 05     |
      | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area"  count() min(apache.resp_len) by apache.status    | RZY-3130:pivot_timechart_area_sample1    | Smooth | ConnectEmptyData | RightPosition | SecondPosition | 3130       | 06     |
      | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="scatter"  count() min(apache.resp_len) by apache.status | RZY-3132:pivot_timechart_scatter_sample1 |        |                  | NoneExample   |                | 3132       | 07     |
      | tag:"sample04061424_display" \| timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="column" count() min(apache.resp_len) by apache.status   | RZY-3135:pivot_timechart_column_sample1  |        |                  | RightPosition | FirstPosition  | 3135       | 08     |

  @trendSmoke
  Scenario: RZY-2098:pivot_统计地图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "RZY-2098:pivot_统计地图"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:vendors_461 | geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Geostatsmap" button
    And I wait for loading invisible
    And I display the element "ChartTypePopover"
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/2098"
    And I click the "Save" button

  @trendSmoke
  Scenario Outline: 3171所需趋势图
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "趋势图3171用"
    And I set the parameter "Logtype" with value "test"
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I set the parameter "<inputElement>" with value "<timeFormat>"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "multivalue"
    And I set the parameter "Tag" with value "multivalue"
    Then I click the "NextButton" button

    Examples:
      | logSample                                                                                                                                                                                                                                                                  | regex                  | parseRule | sourceField | inputElement | timeFormat |
      | <134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0  \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \| | .*?:\s+(?<portinfo>.*) | CSV解析     | portinfo    | Separate     | \s*\\\|\s* |

  @trendSmoke
  Scenario: 上传日志
    Given open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "multivalue"
    And I set the parameter "Tag" with value "multivalue"
    And I upload a file with name "/src/test/resources/testdata/log/multivalue.txt"
    Then I click the "UploadButton" button

  @trendSmoke
  Scenario Outline: RZY-3171、3192
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And take part of "Container" with name "trend/<num>"
    And I click the "Save" button

    Examples:
      | name                     | spl                                                                           | num  |
      | RZY-3171:多值sample0       | tag:multivalue \| table logtype,test.portinfo                                 | 3171 |
      | RZY-3192:pivot_多值mvrange | tag:"sample04061424" \| eval base=mvrange(1,6,2) \| table base, apache.status | 3192 |

  Scenario: RZY-3100:pivot_透视表timechart_sample0
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "RZY-3100:透视表timechart_sample0"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "TableHeader" will be visible
    And I "checked" the checkbox which name is "timestamp"
    And I click the "NextButton" button
    And I drag the element "DragText" to the "XField"


