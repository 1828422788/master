@galaxee
Feature: 数据大屏条形图

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建条形图，默认配置
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "条形图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "BarHorizontal" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 条形图修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I wait for "BarHorizontal" will be visible
    And I click the "BarHorizontal" button
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
    And I click the "TagWordColor" button
    And I set the parameter "ColorInput" with value "#DFFE19"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "TagBold"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "300"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 条形图  |

  Scenario Outline: 增加切分字段
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I wait for "BarHorizontal" will be visible
    And I click the "BarHorizontal" button
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
    And I click the "TagWordColor" button
    And I set the parameter "ColorInput" with value "#DFFE19"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "TagBold"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "600"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Add" button
    And I choose the "apache.method" from the "LastDivideField"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/条形图"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 条形图  |
