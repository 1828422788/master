@dashboard6_09 @dashboardChart
Feature: 仪表盘_6_09_调用链

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘调用链"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘调用链"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为调用链 RZY-RZY-3404
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
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
    And I cancel all selections from the "InfoColumn" except value "binnaryannotations"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I wait for "500" millsecond
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "Setting" button
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

  Scenario Outline: trace表格展示优化 RZY-4855
    When the chart title is "仪表盘调用链" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
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
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name       |   image             |
      | 仪表盘调用链 | 调用链_trace表格优化   |

  Scenario: 调用链table折叠 RZY-4858
    And I click the Circle "FoldIcon" button
    Then I will see the "CallChainTextChildNode" doesn't exist
    And I click the Circle "FoldIcon" button
    Then I wait for "CallChainTextChildNode" will be visible

  Scenario Outline: 展示修改为-tree RZY-RZY-4837
    And I click the "ChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I click the "Exhibition" button
    And I choose the "tree" from the "TracingType"
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 仪表盘调用链 |

  Scenario Outline: 再次添加相同图表
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for loading invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name       |
      | 仪表盘调用链 |

  Scenario Outline: 修改为调用链，显示为tree验证显示正常
    And I click the "SecondChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Chain" button
    And I wait for "1000" millsecond
    And I click the "SecondSetting" button
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
    And I cancel all selections from the "InfoColumn" except value "binnaryannotations"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I wait for "500" millsecond
    And I click the "Red" button
    And I choose the "tree" from the "TracingType"
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SecondSetting" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And I wait for "SecondCallChainText" will be visible

    Examples:
      | name       |
      | 仪表盘调用链 |