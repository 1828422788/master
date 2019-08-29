@galaxee
Feature: 数据大屏表格

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的表格
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "表格"
    And I click the "Ensure" button
    And I click the "Word" button
    And I click the "Table" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424 | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip,ip_count" from the "DataItem"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Word" button
    And I click the "Table" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "500"
    And I click the "TableHeader" button
    And I set the parameter "TableHeaderWordSize" with value "20"
    And I click the "TableHeaderBgColor" button
    And I set the parameter "ColorInput" with value "#783737"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "TableHeaderBold"
    And I click the "TableCell" button
    And I set the parameter "CellWordSize" with value "20"
    And I choose the "lighter" from the "CellBold"
    And I set the parameter "CellFrameBold" with value "1"
    And I set the parameter "RowNumber" with value "4"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() by appname, tag"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "appname,count(),tag" from the "DataItem"
    And I click the "Style" button
    And I click the "ColumnConfig" button
    And I set the parameter "FieldWidth1" with value "40"
    And I click the "Count" button
    And I choose the "梯度" from the "CountColor"
    And I click the "CountColorSetting" button
    And I click the "Color1" button
    And I click the "OrderNum" button
    And I set the parameter "NumberWidth" with value "1"
    And I choose the "旗标" from the "NumberStyle"
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
      | 表格   |