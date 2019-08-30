@galaxee
Feature: 数据大屏环形占比图

  Background:
    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的环形占比图
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "环形占比图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Percent" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "num" from the "DataField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改环形占比图配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Percent" button
    And I click the "Title" button
    And I set the parameter "TitleSize" with value "38"
    And I click the "TitleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "Monocycle" button
    And I click the "MonocycleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "60%"
    And I set the parameter "OuterRadius" with value "80%"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "500"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "num" from the "DataField"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 环形占比图 |