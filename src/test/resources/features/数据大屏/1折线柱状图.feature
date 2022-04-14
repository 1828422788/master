@galaxee @galaxee1   @1.19
Feature: 数据大屏-s折线柱状图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 折线柱状图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "折线柱状图-静态数据"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

    #    选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    选择常规图表
    And I wait for "Chart" will be visible
    And I click the "Chart" button

    #折线柱状图
    And I wait for "BrokenLineBar" will be visible
    And I click the "BrokenLineBar" button

    #    选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond


#    图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1500"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "635"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "90"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "170"

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
    And I wait for "ExampleOnTop" will be visible
    And I click the "ExampleOnTop" button
    And I wait for "2000" millsecond
    And I set the parameter "ExampleHorizontalSpacing" with value "30"
    And I wait for "1000" millsecond

    #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "1000" millsecond
      #选择静态数据
    And I set the parameter "Xaxis" with value "x"
    And I set the parameter "FirstYaxis" with value "y"
    And I set the parameter "SecondYaxis" with value "z"
    And I wait for "2000" millsecond
    And I wait for element "XaxisFieldText" change text to "匹配成功"
    And I wait for element "FirstYaxisFieldText" change text to "匹配成功"
    And I set the parameter "FirstYaxis" with value "y"
    And I wait for "2000" millsecond
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


##################################无耻的分割线###############################


  Scenario: 折线柱状图-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "折线柱状图-样式搜索"
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

#    ==============================折线柱状图
    And I wait for "BrokenLineBar" will be visible
    And I click the "BrokenLineBar" button

#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond


#    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1500"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "635"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "90"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "170"

#      ============================图表边距布局
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I set the parameter "LayoutBottom" with value "40"
    And I set the parameter "LayoutLeft" with value "40"
    And I wait for "2000" millsecond
    And I set the parameter "LayoutRight" with value "40"
    And I wait for "1000" millsecond

#    ==================================坐标轴设置
    And I click the "Axes" button

#=====================================x轴
    And I wait for "XaxisHeader" will be visible
    And I click the "XaxisHeader" button
    And I wait for "1000" millsecond
#       ===============================打开轴标签元素
    And I click the "Xlable" button
    And I wait for "1000" millsecond
    #   轴标签文字大小
    And  I wait for "XaxisWordSize" will be visible
    And I set the parameter "XaxisWordSize" with value "16"
    #    轴标签文字颜色
    And I wait for "XColorInput" will be visible
    And I set the parameter "XColorInput" with value "#CF3131"
    And I wait for "2000" millsecond
    #    轴标签文字粗细
    And I choose the "bolder" from the "XaxisWordBold"
    #    标签旋转角度
    And I wait for "XaxisAngle" will be visible
    And I set the parameter "XaxisAngle" with value "10"
    #    关闭轴标签元素
    And I click the "Xlable" button
    And I wait for "2000" millsecond

#    =====================================使x轴轴线元素可见
    And I wait for "XaxesLines" will be visible
    And I click the "XaxesLines" button
    #     x轴轴线颜色
    And I wait for "XLineColor" will be visible
    And I set the parameter "XLineColor" with value "#26CC55"
    And I wait for "2000" millsecond
    #    关闭轴线元素
    And I click the "XaxesLines" button

#    ====================================使x轴网格线元素可见
    And I click the "XaxisEyes" button
    And I wait for "XgridLines" will be visible
    And I click the "Xgridlines" button
    #     x轴网格线颜色
    And I wait for "XDividingLineColor" will be visible
    And I set the parameter "XDividingLineColor" with value "#CD9080"
    And I wait for "2000" millsecond
    #    关闭x轴网格线
    And I click the "Xgridlines" button
#关闭x轴
    And I click the "XaxisHeader" button

 #=======================================Y轴
    And I wait for "YaxisHeader" will be visible
    And I click the "YaxisHeader" button
    And I wait for "1000" millsecond

   #    =================================打开轴标签元素
    And I click the "Ylable" button
    And I wait for "1000" millsecond
    #   轴标签文字大小
    And  I wait for "YaxisWordSize" will be visible
    And I set the parameter "YaxisWordSize" with value "16"
    #    轴标签文字颜色
    And I wait for "YColorInput" will be visible
    And I set the parameter "YColorInput" with value "#19B535"
    And I wait for "2000" millsecond
    #    轴标签文字粗细
    And I choose the "bold" from the "YaxisWordBold"
    #    标签旋转角度
    And I wait for "YaxisAngle" will be visible
    And I set the parameter "YaxisAngle" with value "10"
    #    关闭轴标签元素
    And I click the "Ylable" button
    And I wait for "2000" millsecond

    #    ===============================使y轴轴线元素可见
    And I wait for "YaxesLines" will be visible
    And I click the "YaxesLines" button
    #     y轴轴线颜色
    And I wait for "YLineColor" will be visible
    And I set the parameter "YLineColor" with value "#CBD50D"
    And I wait for "2000" millsecond
    #    关闭轴线元素
    And I click the "YaxesLines" button
    And I wait for "2000" millsecond


    #    =================================使y轴网格线元素可见
    And I click the "YaxisEyes" button
    And I wait for "YgridLines" will be visible
    And I click the "Ygridlines" button
    #     y轴网格线颜色
    And I wait for "YDividingLineColor" will be visible
    And I wait for "1000" millsecond
    And I set the parameter "YDividingLineColor" with value "#BBB80B"
    And I wait for "2000" millsecond
    #    关闭y轴网格线
    And I click the "Ygridlines" button
    And I wait for "2000" millsecond

#关闭y轴
    And I click the "YaxisHeader" button

#    =========================================打开Z轴
    And I wait for "ZaxisHeader" will be visible
    And I click the "ZaxisHeader" button
    And I wait for "1000" millsecond

   #    打开轴标签元素
    And I click the "Zlable" button
    And I wait for "1000" millsecond
    #   轴标签文字大小
    And  I wait for "ZaxisWordSize" will be visible
    And I set the parameter "ZaxisWordSize" with value "16"
    #    轴标签文字颜色
    And I wait for "ZColorInput" will be visible
    And I set the parameter "ZColorInput" with value "#9900FF"
    And I wait for "2000" millsecond
    #    轴标签文字粗细
    And I choose the "bold" from the "ZaxisWordBold"
    #    标签旋转角度
    And I wait for "ZaxisAngle" will be visible
    And I set the parameter "ZaxisAngle" with value "10"
    #    关闭轴标签元素
    And I click the "Zlable" button
    And I wait for "2000" millsecond

    #    使Z轴轴线元素可见
    And I wait for "ZaxesLines" will be visible
    And I click the "ZaxesLines" button
    #     Z轴轴线颜色
    And I wait for "ZLineColor" will be visible
    And I set the parameter "ZLineColor" with value "#9900FF"
    And I wait for "2000" millsecond
    #    关闭轴线元素
    And I click the "ZaxesLines" button
    And I wait for "2000" millsecond


#    =================================使Z轴网格线元素可见
    And I click the "ZaxisEyes" button
    And I wait for "ZgridLines" will be visible
    And I click the "Zgridlines" button
    #     Z轴网格线颜色
    And I wait for "ZDividingLineColor" will be visible
    And I wait for "1000" millsecond
    And I set the parameter "ZDividingLineColor" with value "#9900FF"
    And I wait for "2000" millsecond
    #    关闭Z轴网格线
    And I click the "Zgridlines" button
    And I wait for "2000" millsecond
    And I click the "ZaxesLines" button
    #     Z轴轴线颜色
    And I wait for "ZLineColor" will be visible
    And I set the parameter "ZLineColor" with value "#9900FF"
#关闭Z轴
    And I click the "ZaxisHeader" button

#     ===================================系列
    And I wait for "Series" will be visible
    And I click the "Series" button

    And I click the "SeriesOne" button
#   折线
    And I click the "BrokenLine" button
    And I wait for "1000" millsecond
    And I set the parameter "SeriesOfName" with value "count"
    And I set the parameter "Smoothness" with value "0.3"
    And I wait for "2000" millsecond
    And I set the parameter "AreaFillColor" with value "#CC6600"
    And I wait for "2000" millsecond
#   折线样式
    And I click the "SeriesStyle" button
    And I wait for "SeriesOneBold" will be visible
    And I set the parameter "SeriesOneBold" with value "3"
    And I wait for "2000" millsecond
    And I choose the "虚线" from the "XDividingLineType"
    And I wait for "2000" millsecond
    And I wait for "Zcolor2" will be visible
    And I set the parameter "Zcolor2" with value "#0066ff"
    And I wait for "2000" millsecond
    And I click the "SeriesStyle" button
#   数据点标记
    And I click the "DataBuild" button
    And I wait for "1000" millsecond
    And I choose the "方形" from the "DataStyle"
    And I wait for "2000" millsecond
    And I set the parameter "DataSize" with value "10"
    And I click the "DataBuild" button
#   标签
    And I wait for "TagEyes1" will be visible
    And I click the "TagEyes1" button
    And I wait for "2000" millsecond
    And I click the "Tag1" button
    And I wait for "2000" millsecond
    And I set the parameter "TagWordSize2" with value "16"
    And I set the parameter "TagWordColor2" with value "#ffff00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TagWordBold2"
    And I wait for "2000" millsecond
    And I click the "Tag1" button

    And I click the "BrokenLine" button
#   柱子
    And I click the "Pillar" button
    And I wait for "1000" millsecond
    And I set the parameter "SeriesOfName1" with value "dc"
    And I set the parameter "CylindricalColor" with value "#6633FF"
    And I wait for "2000" millsecond
#    标签
    And I click the "TagEyes2" button
    And I wait for "2000" millsecond
    And I click the "Tag2" button
    And I wait for "2000" millsecond
    And I set the parameter "TagWordSize3" with value "16"
    And I set the parameter "TagWordColor3" with value "#ffff00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TagWordBold3"
    And I wait for "2000" millsecond
    And I click the "Tag2" button

    And I click the "Pillar" button

#    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "Xaxis" with value "apache.status"
    And I set the parameter "FirstYaxis" with value "count(apache.status)"
    And I set the parameter "SecondYaxis" with value "dc(apache.status)"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "XaxisFieldText" change text to "匹配成功"
    And I wait for element "FirstYaxisFieldText" change text to "匹配成功"
    And I wait for element "SecondYaxisFieldText" change text to "匹配成功"
    And I wait for "2000" millsecond


#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


##################################无耻的分割线##############################





