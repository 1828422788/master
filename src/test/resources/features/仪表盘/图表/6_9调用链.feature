@dashboard32 @dashboardChart
Feature: 仪表盘_6_9_调用链

  @dashboard @dashboardSmoke
  Scenario: 上传日志
    Given open the "localUpload.ListPage" page for uri "/sources/input/os/"
    When I set the parameter "AppName" with value "zipkin"
    And I set the parameter "Tag" with value "zipkin"
    And I upload a file with name "/src/test/resources/testdata/log/zipkin.txt"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    And I will see the element "VerifyText" contains "上传完成"
    And I wait for "5000" millsecond

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name |
      | 调用链  |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | name   |
      | appname:zipkin \| parse \"^(?<datetime>\\\d{4}\/\\\d\\\d\/\\\d\\\d \\\d\\\d:\\\d\\\d:\\\d\\\d.\\\d{3})\\\s\\\[(?<threadname>\\\S+)\\\]\\\s(?<level>\\\S+)\\\s+(?<functionname>\\\S+)\\\s\\\S+\\\s\\\S+\\\s(?<jsonstring>.*)\" \| jpath input=jsonstring output=traceid path=\"traceId\" \| jpath input=jsonstring output=spanid path=\"id\" \| jpath input=jsonstring output=parentid path=\"parentId\" \| jpath input=jsonstring output=binnaryannotations path=\"binaryAnnotations[*].value\" \| jpath input=jsonstring output=duration path=\"duration\" \| jpath input=jsonstring output=modulename path=\"name\" \| where mvindex(duration, 0)>0 && mvindex(traceid,0)==\"511f8756ce1d0b8a\" \| jpath input=jsonstring output=timestamp path=\"timestamp\" \| table spanid, parentid, duration, timestamp, binnaryannotations, modulename | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘调用链"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name       |
      | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为调用链 RZY-RZY-3404
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I wait for "500" millsecond
    And I choose the "modulename" from the "function"
    And I wait for "1000" millsecond
    And I choose the "parentid" from the "ParentId"
    And I wait for "1000" millsecond
    And I choose the "spanid" from the "ChildId"
    And I click the "Time" button
    And I choose the "timestamp" from the "StartTime"
    And I wait for "1000" millsecond
    And I choose the "duration" from the "KeepTime"
    And I click the "Divide" button
    And I choose the "modulename" from the "FieldValue"
    And I click the "Info" button
    And I choose the "binnaryannotations" from the "InfoField"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I wait for "500" millsecond
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: trace表格展示优化 RZY-4855
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘调用链" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
#    And I click the "SettingChart" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "appname:zipkin | parse "(?<jsonstring>\{.*\})$" | jpath input=jsonstring output=traceid path="traceId" | jpath input=jsonstring output=spanid path="id" | jpath input=jsonstring output=parentid path="parentId" | jpath input=jsonstring output=binnaryannotations path="binaryAnnotations[*].endpoint" | jpath input=jsonstring output=annotations path="annotations[*].endpoint" | jpath input=jsonstring output=duration path="duration" | jpath input=jsonstring output=modulename path="name" | where mvindex(duration, 0)>0 && mvindex(traceid,0)=="511f8756ce1d0b8a" | jpath input=jsonstring output=timestamp path="timestamp" | eval annotations=tostring(annotations) | eval binnaryannotations=tostring(binnaryannotations) | table spanid, parentid, duration, timestamp, binnaryannotations, modulename, annotation"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "CallChainText" button
    And I click the "ShowDetails" button
    And I wait for "CallChainDetails" will be visible
    And I wait for "2000" millsecond
    Then take part of "CallChainDetails" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name       |   image             |
      | 仪表盘调用链 | 调用链_trace表格优化   |

  @dashboard @dashboardSmoke
  Scenario: 调用链table折叠 RZY-4858
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘调用链"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "2000" millsecond
    And I click the Circle "FoldIcon" button
    Then I will see the "CallChainTextChildNode" doesn't exist
    And I click the Circle "FoldIcon" button
    Then I wait for "CallChainTextChildNode" will be visible

  @dashboard @dashboardSmoke
  Scenario Outline: 展示修改为-tree RZY-RZY-4837
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I click the "Exhibition" button
    And I choose the "tree" from the "TracingType"
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: 再次添加相同图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name       |
      | 仪表盘调用链 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为调用链，显示为tree验证显示正常
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "SecondChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "SecondSetting" button under some element
    And I wait for "500" millsecond
    And I choose the "modulename" from the "function"
    And I wait for "1000" millsecond
    And I choose the "parentid" from the "ParentId"
    And I wait for "1000" millsecond
    And I choose the "spanid" from the "ChildId"
    And I click the "Time" button
    And I choose the "timestamp" from the "StartTime"
    And I wait for "1000" millsecond
    And I choose the "duration" from the "KeepTime"
    And I click the "Divide" button
    And I choose the "modulename" from the "FieldValue"
    And I click the "Info" button
    And I choose the "binnaryannotations" from the "InfoField"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I wait for "500" millsecond
    And I click the "Red" button
    And I choose the "tree" from the "TracingType"
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SecondSetting" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And I wait for "SecondCallChainText" will be visible

    Examples:
      | name       |
      | 仪表盘调用链 |

#  @cleanDashboard
#  Scenario Outline: 删除仪表盘
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    Then I will see the success message "删除仪表盘成功"
#
#    Examples:
#      | name   |
#      | 仪表盘调用链 |
#
#  @cleanDashboard
#  Scenario Outline: 删除仪表盘所建趋势图
#    Given open the "trend.ListPage" page for uri "/trend/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    And I will see the success message "删除成功"
#
#    Examples:
#      | name   |
#      | 仪表盘调用链 |