@galaxee @galaxee2   @2.2
Feature: 数据大屏-b键值表格

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 键值表格-静态数据 RZY-2685,RZY-2687,RZY-2692,RZY-2688,RZY-2691,RZY-2690,RZY-2689
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "键值表格-静态数据"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

#    ===============================选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    ==============================选择表格
    And I wait for "Table" will be visible
    And I click the "Table" button

#    ==============================键值表格
    And I wait for "KeyValueTable" will be visible
    And I click the "KeyValueTable" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
  #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "551"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "100"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "100"
    And I wait for "2000" millsecond

 #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond
     #选择静态数据
    And I set the parameter "DataField" with value "value"
    And I set the parameter "DataSearchLabel" with value "label"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for element "DataLabelText" change text to "匹配成功"
    And I wait for "2000" millsecond

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


#    And I set the parameter "SplInput" with value "tag:sample04061424 AND apache.x_forward:*1 | stats count() by apache.status,apache.clientip"



#  Scenario Outline: 表格数据之静态数据发布并截图
##      Given I will see the "PublicNavBarPage" page
##      And I wait for "Dashboard" will be visible
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name              |
#      |表格数据之静态数据  |
######################################无耻的分割线################################



  Scenario: 键值表格-样式搜索 RZY-1914,RZY-1975,RZY-2038
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "键值表格-样式搜索"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

#    ===============================选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    ==============================选择表格
    And I wait for "Table" will be visible
    And I click the "Table" button

#    ==============================键值表格
    And I wait for "KeyValueTable" will be visible
    And I click the "KeyValueTable" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
  #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "551"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "100"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "100"
    And I wait for "2000" millsecond
#   ================================打开表格
    And I wait for "Table1" will be visible
    And I click the "Table1" button
    And I wait for "BorderLines" will be visible
    And I click the "BorderLines" button
    And I wait for "2000" millsecond
    And I set the parameter "BorderLinesColor" with value "#00FFFF"
    And I wait for "2000" millsecond
    And I set the parameter "BorderLinesThickness" with value "6"
    And I wait for "2000" millsecond
    And I click the "BorderLines" button
    And I wait for "1500" millsecond
    And I click the "Table1" button
#   ================================打开单元格
    And I wait for "TableCell" will be visible
    And I click the "TableCell" button
    And I wait for "2000" millsecond
    And I click the "Space" button
    And I wait for "AboutSpacing" will be visible
    And I set the parameter "AboutSpacing" with value "40"
    And I set the parameter "UpDownSpacing" with value "30"
    And I wait for "2000" millsecond
    And I click the "Space" button
    And I wait for "2000" millsecond
    And I click the "TableCell" button
#   ===============================打开表头
    And I wait for "TableHeader" will be visible
    And I click the "TableHeader" button
    And I set the parameter "TableHeaderBgColor" with value "#8B4513"
    And I wait for "2000" millsecond
    And I click the "TableHeaderTextStyle" button
    And I set the parameter "TableHeaderWordSize" with value "20"
    And I wait for "2000" millsecond
    And I set the parameter "TableHeaderWordColor" with value "#080808"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TableHeaderBold"
    And I wait for "2000" millsecond
    And I click the "TableHeaderTextStyle" button
    And I wait for "2000" millsecond
    And I click the "TableHeader" button
    And I wait for "2000" millsecond
#    =============================打开列
    And I wait for "TableColumn" will be visible
    And I click the "TableColumn" button
    And I set the parameter "WidthPercentage" with value "42"
    And I wait for "ColumnCutOffLine" will be visible
    And I click the "ColumnCutOffLine" button
    And I set the parameter "ColumnCutOffLineColor" with value "#8B4513"
    And I wait for "2000" millsecond
    And I set the parameter "ColumnCutOffLineThickness" with value "3"
    And I wait for "2000" millsecond
    And I click the "ColumnCutOffLine" button
#   ==============================打开第一列
    And I wait for "FirstColumn" will be visible
    And I click the "FirstColumn" button
    And I wait for "FirstColumnBg" will be visible
    And I set the parameter "FirstColumnBg" with value "#F5DEB3"
    And I wait for "2000" millsecond
    And I choose the "居中对齐" from the "FirstColumnTextAlign"
    And I click the "FirstColumnTextStyle" button
    And I set the parameter "FirstColumnWordSize" with value "20"
    And I wait for "2000" millsecond
    And I set the parameter "FirstColumnWordColor" with value "#080808"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "FirstColumnBold"
    And I click the "FirstColumnTextStyle" button
    And I wait for "2000" millsecond
    And I click the "FirstColumn" button
#   ===================================打开第二列
    And I wait for "SecondColumn" will be visible
    And I click the "SecondColumn" button
    And I wait for "2000" millsecond
    And I set the parameter "SecondColumnBg" with value "#7FFFD4"
    And I wait for "2000" millsecond
    And I choose the "居中对齐" from the "SecondColumnTextAlign"
    And I wait for "2000" millsecond
    And I click the "SecondColumnTextStyle" button
    And I set the parameter "SecondColumnWordSize" with value "20"
    And I wait for "2000" millsecond
    And I set the parameter "SecondColumnWordColor" with value "#080808"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "SecondColumnBold"
    And I click the "SecondColumnTextStyle" button
    And I wait for "2000" millsecond
    And I click the "SecondtColumn" button
    And I wait for "2000" millsecond
    And I click the "TableColumn" button

#    ====================================打开行
    And I wait for "TableRow" will be visible
    And I click the "TableRow" button
    And I wait for "2000" millsecond
    And I click the "RowCutOffLine" button
    And I set the parameter "ColumnCutOffLineColor" with value "#8B4513"
    And I wait for "2000" millsecond
    And I set the parameter "ColumnCutOffLineThickness" with value "3"
    And I wait for "2000" millsecond
    And I click the "RowCutOffLine" button
    And I wait for "RowOddNumberLineBg" will be visible
    And I set the parameter "RowOddNumberLineBg" with value "#808080"
    And I wait for "2000" millsecond
    And I set the parameter "RowEvenNumberLineBg" with value "#336633"
    And I wait for "2000" millsecond
    And I click the "TableRow" button

 #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | limit 10"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "ip_count"
    And I set the parameter "DataSearchLabel" with value "apache.clientip"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for element "DataLabelText" change text to "匹配成功"
    And I wait for "2000" millsecond
    #   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


#  Scenario Outline: 发布页截图
##    Given I will see the "PublicNavBarPage" page
##    And I wait for "Dashboard" will be visible
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for "Loading" will be invisible
#    And I wait for "1000" millsecond
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      | name |
#      | 表格   |

