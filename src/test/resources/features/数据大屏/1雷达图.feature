@galaxee @galaxee1   @1.14
Feature: 数据大屏-n雷达图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 雷达图-静态数据 RZY-3781
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "雷达图-静态数据"
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
#    ==============================选择常规图表
    And I wait for "Chart" will be visible
    And I click the "Chart" button

#    ==============================雷达图
    And I wait for "RadarChart" will be visible
    And I click the "RadarChart" button under some element

#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

    #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "660"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "476"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "405"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "215"
    And I wait for "2000" millsecond


    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I click the "TagEyes" button
    And I wait for "2000" millsecond
    And I click the "Tag" button
    And I wait for "2000" millsecond
    And I set the parameter "TagWordSize1" with value "16"
    And I set the parameter "TagWordColor1" with value "#ffff00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TagWordBold"
    And I wait for "2000" millsecond
    And I click the "Tag" button
 #    图例
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Layout" will be visible
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I click the "ExampleEyes" button
    And I wait for "Example" will be visible
    And I click the "Example" button
    And I wait for "ExampleWordSize" will be visible
    And I set the parameter "ExampleWordSize" with value "16"
    And I wait for "2000" millsecond
    And I wait for "ExampleColor" will be visible
    And I set the parameter "ExampleColor" with value "#D73535"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "ExampleWordBold"
    And I wait for "ExampleOnMiddle" will be visible
    And I click the "ExampleOnMiddle" button
    And I wait for "2000" millsecond

       #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond
#    选择静态数据
    And I set the parameter "DataField" with value "value"
    And I set the parameter "DivideField" with value "name"
    And I set the parameter "SecYaxis" with value "s"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for element "DivideFieldText" change text to "匹配成功"
    And I wait for "2000" millsecond


    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"



#  Scenario Outline: 雷达图数据之静态数据发布并截图
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
#      |name            |
#      |雷达图数据之静态数据   |
#=================================无耻的分割线==================================


  Scenario: 雷达图-样式搜索 RZY-3783,RZY-3784
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "雷达图-样式搜索"
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
#    ==============================选择常规图表
    And I wait for "Chart" will be visible
    And I click the "Chart" button

#    ==============================雷达图
    And I wait for "RadarChart" will be visible
    And I click the "RadarChart" button under some element

#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

    #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "660"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "476"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "405"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "215"
    And I wait for "2000" millsecond

         #    ==================================坐标轴设置
    And I click the "Axes" button
    And I wait for "1000" millsecond
    And I click the "AngleShaftHeader" button
    And I wait for "2000" millsecond
    And I set the parameter "Radius" with value "100"
    And I set the parameter "InitialAngleMig" with value "90"
    And I wait for "2000" millsecond

    #       ===============================打开轴标签元素
    And I click the "AxisLabels" button
    And I wait for "1000" millsecond
    #   轴标签文字大小
    And  I wait for "AxisWordSize" will be visible
    And I set the parameter "AxisWordSize" with value "16"
    #    轴标签文字颜色
    And I wait for "AxisWordColor" will be visible
    And I set the parameter "AxisWordColor" with value "#CF3131"
    And I wait for "2000" millsecond
    #    轴标签文字粗细
    And I choose the "bolder" from the "AxisWordBold"
    And I wait for "2000" millsecond
    #    关闭轴标签元素
    And I click the "AxisLabels" button
    And I wait for "2000" millsecond
#   =====================================打开值标签元素
    And I click the "ValuesEyes" button
    And I wait for "2000" millsecond
    And I click the "Values" button
    And I wait for "2000" millsecond
    And I set the parameter "ValuesWordSize" with value "16"
    And I set the parameter "ValueWordColor" with value "#FFFF00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "ValuesWordBold"
    And I wait for "2000" millsecond
    And I click the "Values" button

      #    ===============================使轴线元素可见
    And I wait for "AxesLines" will be visible
    And I click the "AxesLines" button
    #     轴线颜色
    And I wait for "LineColor" will be visible
    And I set the parameter "LineColor" with value "#FF0000"
    And I wait for "2000" millsecond
    #    关闭轴线元素
    And I click the "AxesLines" button
    And I wait for "2000" millsecond

   #    ====================================使网格线元素可见
    And I click the "AxisEyes" button
    And I wait for "GridLines" will be visible
    And I click the "GridLines" button
    #     网格线颜色
    And I wait for "DividingLineColor" will be visible
    And I set the parameter "DividingLineColor" with value "#CD9080"
    And I wait for "2000" millsecond
    #    关闭网格线
    And I wait for "AxesLines" will be visible
    And I click the "AxesLines" button
    #     轴线颜色
    And I wait for "LineColor" will be visible
    And I set the parameter "LineColor" with value "#FF0000"
    And I wait for "2000" millsecond

    #     ===================================系列
    And I wait for "Series" will be visible
    And I click the "Series" button

    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "FillColor2" with value "#FF9900"
    And I wait for "2000" millsecond
    And I wait for "FillColor3" will be visible
    And I set the parameter "FillColor3" with value "#0066ff"
    And I wait for "2000" millsecond
    And I set the parameter "HemWidth" with value "2"
    And I wait for "2000" millsecond
#   ===========================================
    And I click the "SeriesTwo" button
    And I wait for "1000" millsecond
    And I set the parameter "FillColor2" with value "#0066ff"
    And I wait for "2000" millsecond
    And I wait for "FillColor3" will be visible
    And I set the parameter "FillColor3" with value "#FF9900"
    And I wait for "2000" millsecond
    And I set the parameter "HemWidth" with value "2"
    And I wait for "2000" millsecond

        #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.method | limit 10"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "count()"
    And I set the parameter "DivideField" with value "apache.clientip"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for element "DivideFieldText" change text to "匹配成功"
    And I wait for "2000" millsecond


#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#  Scenario Outline: 雷达图样式-搜索发布并截图
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
#      |name         |
#      |雷达图样式-搜索|

 ##################################无耻的分割线################################








