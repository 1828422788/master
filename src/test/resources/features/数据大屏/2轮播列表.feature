@galaxee @galaxee2   @2.1
Feature: 数据大屏-a轮播列表

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 轮播列表-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "轮播列表-静态数据"
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

#    ==============================轮播列表
    And I wait for "listOfTurns" will be visible
    And I click the "listOfTurns" button

 #    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "997"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "526"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "352"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "262"
    And I wait for "2000" millsecond

   #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond

    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "DefineLine" will be visible
    And I click the "DefineLine" button
    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "DefineFileName" with value "area"
    And I set the parameter "DefineShowName" with value "国家"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWidthRatio" with value "20"
    And I choose the "居中对齐" from the "TextAlignMent"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I choose the "bolder" from the "DefineWordBold"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordColor" with value "#FFF0F5"
    And I wait for "2000" millsecond

    And I click the "SeriesTwo" button
    And I wait for "1000" millsecond
    And I set the parameter "DefineFileName" with value "pv"
    And I set the parameter "DefineShowName" with value "流量"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWidthRatio" with value "20"
    And I choose the "居中对齐" from the "TextAlignMent"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I choose the "bolder" from the "DefineWordBold"
    And I wait for "1000" millsecond
    And I set the parameter "DefineWordColor" with value "#FFF0F5"
    And I wait for "2000" millsecond

    And I click the "SeriesThree" button
    And I wait for "1000" millsecond
    And I set the parameter "DefineFileName" with value "attribute"
    And I set the parameter "DefineShowName" with value "用户行为特征"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWidthRatio" with value "20"
    And I choose the "居中对齐" from the "TextAlignMent"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I choose the "bolder" from the "DefineWordBold"
    And I wait for "1000" millsecond
    And I set the parameter "DefineWordColor" with value "#FFF0F5"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I wait for "3000" millsecond

#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"
    ######################################无耻的分割线################################



  Scenario: 轮播列表-样式搜索 RZY-4821,RZY-4370
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "轮播列表-样式搜索"
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

#    ==============================轮播列表
    And I wait for "listOfTurns" will be visible
    And I click the "listOfTurns" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "997"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "526"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "352"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "262"
    And I wait for "2000" millsecond
#   全局
    And I click the "ListOfTurnsAllStyles" button
    And I set the parameter "RowNumber" with value "6"
    And I click the "ListOfTurnsAction" button
    And I wait for "2000" millsecond
    And I choose the "逐行滚动" from the "ActionPattern"
    And I set the parameter "rollF" with value "1"
    And I wait for "1000" millsecond
    And I click the "ListOfTurnsAction" button
    And I wait for "2000" millsecond
    And I click the "listOfTurnsAllStyles" button
#   表头
    And I click the "TableHeader" button
    And I wait for "HeadHeight" will be visible
    And I set the parameter "HeadHeight" with value "18"
    And I set the parameter "TableHeaderBgColor" with value "#D7D55F"
    And I wait for "2000" will be visible
    And I click the "TextStyle" button
    And I wait for "2000" millsecond
    And I choose the "居中对齐" from the "TextAlign"
    And I set the parameter "TableHeaderWordSize" with value "25"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TableHeaderBold"
    And I set the parameter "TableHeaderWordColor" with value "#B8860B"
    And I wait for "2000" will be visible
    And I click the "TextStyle" button
    And I wait for "2000" millsecond
    And I click the "TableHeader" button
#   行配置
    And I click the "LineCon" button
    And I wait for "OddNumberLineBg" will be visible
    And I set the parameter "OddNumberLineBg" with value "#808080"
    And I wait for "2000" will be visible
    And I set the parameter "EvenNumberLineBg" with value "#336633"
    And I wait for "2000" millsecond
    And I click the "LineCon" button
#   序号列
    And I click the "SerialColumn" button
    And I set the parameter "SerialColumnBg" with value "#CCCCCC"
    And I wait for "2000" will be visible
    And I set the parameter "SerialWidthRatio" with value "16"
    And I wait for "1000" millsecond
    And I set the parameter "SerialRadiusRatio" with value "50"
    And I click the "SerialTextStyle" button
    And I set the parameter "CellWordSize" with value "20"
    And I wait for "2000" millsecond
    And I set the parameter "CellWordColor" with value "#080808"
    And I wait for "2000" will be visible
    And I choose the "bolder" from the "CellBold"
    And I click the "SerialTextStyle" button
    And I wait for "2000" millsecond
    And I click the "SerialColumn" button


 #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" will be visible

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"
    And I wait for "2000" millsecond

    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "DefineLine" will be visible
    And I click the "DefineLine" button
    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "DefineFileName" with value "apache.clientip"
    And I set the parameter "DefineShowName" with value "ip地址"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWidthRatio" with value "20"
    And I choose the "居中对齐" from the "TextAlignMent"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I choose the "bolder" from the "DefineWordBold"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordColor" with value "#FFF0F5"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"

    And I click the "SeriesTwo" button
    And I wait for "1000" millsecond
    And I set the parameter "DefineFileName" with value "ip_count"
    And I set the parameter "DefineShowName" with value "访问量"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWidthRatio" with value "20"
    And I choose the "居中对齐" from the "TextAlignMent"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"
    And I choose the "bolder" from the "DefineWordBold"
    And I wait for "1000" millsecond
    And I set the parameter "DefineWordColor" with value "#FFF0F5"
    And I wait for "2000" millsecond
    And I set the parameter "DefineWordSize" with value "20"

    And I click the "SeriesThree" button
    And I wait for "2000" millsecond
    And I click the "DeleteSeries" button
    And I wait for "1000" millsecond
    And I click the "SeriesTwo" button
    And I set the parameter "DefineFileName" with value "ip_count"

#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"









