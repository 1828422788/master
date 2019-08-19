Feature: 数据大屏散点图

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的散点图
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "散点图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Scatter" button
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "Xaxis"
    And I choose the "count()" from the "Yaxis"
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改参数设置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Scatter" button
    And I click the "XaxisHeader" button
    And I set the parameter "XaxisWordSize" with value "20"
    And I click the "XaxisWordColor" button
    And I set the parameter "ColorInput" with value "#CF3131"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "XaxisWordBold"
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
    And I click the "YaxisHeader" button
    And I set the parameter "YaxisWordSize" with value "20"
    And I click the "YaxisWordColor" button
    And I set the parameter "ColorInput" with value "#19B535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "YaxisWordBold"
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "300"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "Xaxis"
    And I choose the "count()" from the "Yaxis"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 散点图  |

  Scenario Outline: 增加分组
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Scatter" button
    And I click the "XaxisHeader" button
    And I set the parameter "XaxisWordSize" with value "20"
    And I click the "XaxisWordColor" button
    And I set the parameter "ColorInput" with value "#85F4FB"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "XaxisWordBold"
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
    And I click the "YaxisHeader" button
    And I set the parameter "YaxisWordSize" with value "20"
    And I click the "YaxisWordColor" button
    And I set the parameter "ColorInput" with value "#F7C5C3"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "YaxisWordBold"
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#F2F18F"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "600"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "Xaxis"
    And I choose the "count()" from the "Yaxis"
    And I click the "AddGroup" button
    And I choose the "apache.method" from the "Group"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 散点图  |