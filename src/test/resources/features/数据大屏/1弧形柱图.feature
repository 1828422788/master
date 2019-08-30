@galaxee
Feature: 数据大屏弧形柱图

  Background:
    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的弧形柱图
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "弧形柱图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "ArcBar" button
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
    And I choose the "apache.clientip" from the "RadialAxis"
    And I choose the "count()" from the "AngleAxis"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "ArcBar" button
    And I click the "RadiusAxis" button
    And I set the parameter "RadiusAxisSize" with value "20"
    And I click the "RadiusAxisColor" button
    And I set the parameter "ColorInput" with value "#41F1F1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "RadiusAxisBold"
    And I choose the "倾斜" from the "RadiusAxisAngle"
    And I click the "AngleAxisHeader" button
    And I set the parameter "AngleAxisSize" with value "20"
    And I click the "AngleAxisColor" button
    And I set the parameter "ColorInput" with value "#E3A6F2"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "AngleAxisBold"
    And I click the "PolarCoordinates" button
    And I set the parameter "PolarXaxis" with value "40%"
    And I set the parameter "PolarYaxis" with value "60%"
    And I set the parameter "PolarRadius" with value "70%"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "300"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "RadialAxis"
    And I choose the "count()" from the "AngleAxis"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 弧形柱图 |

  Scenario Outline: 增加分组
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "ArcBar" button
    And I click the "RadiusAxis" button
    And I set the parameter "RadiusAxisSize" with value "20"
    And I click the "RadiusAxisColor" button
    And I set the parameter "ColorInput" with value "#41F1F1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "RadiusAxisBold"
    And I choose the "倾斜" from the "RadiusAxisAngle"
    And I click the "AngleAxisHeader" button
    And I set the parameter "AngleAxisSize" with value "20"
    And I click the "AngleAxisColor" button
    And I set the parameter "ColorInput" with value "#E3A6F2"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "AngleAxisBold"
    And I click the "PolarCoordinates" button
    And I set the parameter "PolarXaxis" with value "40%"
    And I set the parameter "PolarYaxis" with value "60%"
    And I set the parameter "PolarRadius" with value "70%"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "600"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "RadialAxis"
    And I choose the "count()" from the "AngleAxis"
    And I click the "AddGroup" button
    And I choose the "apache.method" from the "Group"
    And I switch the "Pile" button to "enable"
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
      | 弧形柱图 |