@galaxee
Feature: 数据大屏区间图

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认区间图
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "区间图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Range" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ts" from the "XaxisField"
    And I choose the "c" from the "ActualField"
    And I choose the "_predict_c" from the "ForecastField"
    And I choose the "upper95" from the "UpperField"
    And I choose the "lower95" from the "LowerField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Range" button
    And I click the "XaxisHeader" button
    And I set the parameter "XaxisWordSize" with value "20"
    And I click the "XaxisWordColor" button
    And I set the parameter "ColorInput" with value "#4BED79"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "XaxisWordBold"
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
    And I switch the "XaxisSeparator" button to "enable"
    And I click the "YaxisHeader" button
    And I set the parameter "YaxisWordSize" with value "20"
    And I click the "YaxisWordColor" button
    And I set the parameter "ColorInput" with value "#67E02B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "YaxisWordBold"
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
    And I switch the "YaxisSeparator" button to "disable"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#C50E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "500"
    And I click the "Data" button
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ts" from the "XaxisField"
    And I choose the "c" from the "ActualField"
    And I choose the "_predict_c" from the "ForecastField"
    And I choose the "upper95" from the "UpperField"
    And I choose the "lower95" from the "LowerField"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/区间图"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 区间图  |