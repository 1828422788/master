@galaxee
Feature: 数据大屏-表格

  Scenario: 新建默认类型的表格
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "表格"
    And I click the "Ensure" button
    And I click the "Word" button
    And I click the "Table" button
    And I click the "Style" button
    And I wait for "Table" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "551"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "100"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip,ip_count" from the "DataItem"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Word" button
#    And I click the "Table" button
    And I click the "Style" button
    And I wait for "Table" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "607"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "574"
    And I set the parameter "ChartYaxis" with value "100"
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
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 表格   |

  Scenario Outline: 发布页截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 表格   |


  Scenario Outline: 删除关于| 表格 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 表格   |