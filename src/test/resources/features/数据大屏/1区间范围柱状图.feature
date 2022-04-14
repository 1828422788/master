@galaxee @galaxee1   @1.17
Feature: 数据大屏-q区间范围柱状图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 区间范围柱状图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "区间范围柱状图-静态数据"
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

    #区间范围柱状图
    And I wait for "IntervalRangeBar" will be visible
    And I click the "IntervalRangeBar" button

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


#   值标签
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Layout" will be visible
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I click the "ValuesEyes" button
    And I wait for "2000" millsecond
    And I click the "ValueLabels" button
    And I wait for "2000" millsecond
    And I set the parameter "ValuesWordSize" with value "16"
    And I set the parameter "ValueWordColor" with value "#ffffff"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "ValuesWordBold"
    And I wait for "2000" millsecond
    And I click the "ValueLabels" button

    #    图例
#    And I wait for "ChartPosition" will be visible
#    And I click the "ChartPosition" button
#    And I wait for "Layout" will be visible
#    And I click the "Layout" button
#    And I wait for "2000" millsecond
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
    And I wait for "2000" millsecond
      #选择静态数据
    And I set the parameter "Xaxis" with value "x"
    And I set the parameter "Yaxis1" with value "y1"
    And I set the parameter "Yaxis2" with value "y2"
    And I set the parameter "SecYaxis" with value "s"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "XaxisFieldText" change text to "匹配成功"
    And I wait for element "Yaxis1FieldText" change text to "匹配成功"
    And I wait for element "Yaxis2FieldText" change text to "匹配成功"
    And I wait for "2000" millsecond
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


##################################无耻的分割线###############################


  Scenario: 区间范围柱状图-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "区间范围柱状图-样式搜索"
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

#    ==============================双轴折线图
    And I wait for "IntervalRangeBar" will be visible
    And I click the "IntervalRangeBar" button

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

   #   使轴标题元素可见
   #  And I click the "XEyes" button


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
    And I click the "YaxesLines" button
    #     y轴轴线颜色
    And I wait for "YLineColor" will be visible
    And I set the parameter "YLineColor" with value "#CBD50D"
    And I wait for "2000" millsecond
#关闭y轴
    And I click the "YaxisHeader" button
#     ===================================系列
    And I wait for "Series" will be visible
    And I click the "Series" button

    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#0000FF"
    And I wait for "2000" millsecond
    And I set the parameter "TitleText" with value "数据1"
    And I wait for "2000" millsecond
#   ===========================================
    And I click the "SeriesTwo" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#E6E6FA"
    And I wait for "2000" millsecond
    And I set the parameter "TitleText" with value "数据2"
    And I wait for "2000" millsecond
    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#0000FF"
    And I wait for "2000" millsecond

#    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "ConData" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count() as c by ts | esma c timefield = ts"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "Xaxis" with value "ts"
    And I set the parameter "Yaxis1" with value "lower95"
    And I set the parameter "Yaxis2" with value "upper95"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "XaxisFieldText" change text to "匹配成功"
    And I wait for element "Yaxis1FieldText" change text to "匹配成功"
    And I wait for element "Yaxis2FieldText" change text to "匹配成功"
    And I wait for "2000" millsecond

#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"


##################################无耻的分割线##############################





