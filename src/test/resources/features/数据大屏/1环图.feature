@galaxee @galaxee1   @1.12
Feature: 数据大屏-l环图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 环图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "环图-静态数据"
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

#    ==============================环图
    And I wait for "Percent" will be visible
    And I click the "Percent" button under some element

#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

#    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "476"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "16"

#    图例
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I set the parameter "StrokeThickness" with value "5"
    And I set the parameter "StrokeColor" with value "#FFE4E1"
    And I wait for "2000" millsecond
    And I click the "ValuesEyes" button
    And I wait for "2000" millsecond
    And I click the "Values" button
    And I wait for "2000" millsecond
    And I set the parameter "ValuesWordSize" with value "16"
    And I set the parameter "ValueWordColor" with value "#ffff00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "ValuesWordBold"
    And I wait for "2000" millsecond
    And I click the "Values" button


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
    And I wait for "2000" millsecond

   #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond

    And I set the parameter "DataField" with value "value"
    And I set the parameter "DivideField" with value "name"
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
#  Scenario Outline: 环形占比图-静态数据发布并截图
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
#      |环形占比图-静态数据  |
    #####################################无耻的分割线################################


  Scenario: 环图-样式搜索 RZY-3030,RZY-3176,RZY-3180
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "环图-样式搜索"
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

#    ==============================环图
    And I wait for "Percent" will be visible
    And I click the "Percent" button under some element

#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

#    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "476"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "16"

#      ============================图表边距布局
    And I click the "Layout" button
    And I wait for "2000" millsecond
    And I set the parameter "LayoutBottom" with value "40"
    And I set the parameter "LayoutLeft" with value "40"
    And I wait for "2000" millsecond
    And I set the parameter "LayoutRight" with value "40"
    And I wait for "2000" millsecond
    And I set the parameter "StrokeThickness" with value "6"
    And I set the parameter "StrokeColor" with value "#FFE4E1"
    And I wait for "2000" millsecond
    And I set the parameter "StrokeThickness" with value "6"
    And I wait for "2000" millsecond

#    ==================================坐标轴设置
    And I click the "Axes" button
    #半径
    And I wait for "InnerRadius" will be visible
    And I set the parameter "InnerRadius" with value "0.5"
    And I set the parameter "OuterRadius" with value "0.9"
    And I wait for "2000" millsecond

 #     ===================================系列
    And I wait for "Series" will be visible
    And I click the "Series" button

    And I click the "SeriesOne" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#0000FF"
    And I wait for "2000" millsecond
    And I click the "SeriesTwo" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#FFFF00"
    And I wait for "2000" millsecond
    And I click the "SeriesThree" button
    And I wait for "1000" millsecond
    And I set the parameter "fillColor1" with value "#A0522D"
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
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/2800000"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "num"
    And I set the parameter "DivideField" with value "p"
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


#  Scenario Outline: 环形占比图-样式搜索发布页截图
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
#      | name  |
#      | 环形占比图-样式搜索 |



