@galaxee @galaxee1   @1.3
Feature: 数据大屏-c单值百分比图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 单值百分比图-静态数据 RZY-3782
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "单值百分比图数据-静态数据"
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

#    ==============================单值百分比图
    And I wait for "percent3dChart" will be visible
    And I click the "percent3dChart" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "640"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "300"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "360"

 #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond
     #选择静态数据
    And I set the parameter "DataField" with value "value"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for "2000" millsecond



    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"



#
#  Scenario Outline: 单值百分比图数据之静态数据发布并截图
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
#      |单值百分比图数据之静态数据   |
 ######################################无耻的分割线################################


  Scenario: 单值百分比图-样式搜索 RZY-4364
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "单值百分比图-样式搜索"
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

#    ==============================单值百分比图
    And I wait for "percent3dChart" will be visible
    And I click the "percent3dChart" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "640"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "300"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "360"

    #    饼图属性
    And I wait for "PieProperty" will be visible
    And I click the "PieProperty" button
    And I wait for "InnerRadius" will be visible
    And I set the parameter "InnerRadius" with value "0.4"
    And I set the parameter "OuterRadius" with value "0.8"
    And I wait for "2000" millsecond
    And I set the parameter "PieBgFill" with value "#9999FF"
    And I wait for "2000" millsecond
    And I click the "PieProperty" button
#    扇形配置
    And I wait for "FanCon" will be visible
    And I click the "FanCon" button
    And I set the parameter "Tone" with value "#E0CD41"
    And I wait for "2000" millsecond
    And I click the "FanCon" button

#    中间百分比的部分
    And I wait for "PercentagePortion" will be visible
    And I click the "PercentagePortion" button
    And I wait for "2000" millsecond
    And I wait for "CirleTextStyle" will be visible
    And I click the "CirleTextStyle" button
    And I wait for "2000" millsecond
    And I set the parameter "CircleWorldSize" with value "16"
    And I choose the "bolder" from the "CircleWorleBold"
    And I set the parameter "CircleWorldColor" with value "#9999FF"
    And I wait for "1000" millsecond
    And I click the "CirleTextStyle" button
    And I wait for "2000" millsecond
    And I set the parameter "DecimalPlaces1" with value "3"
    And I wait for "2000" millsecond


    #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/2800"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "p"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for "2000" millsecond

    #   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#
#  Scenario Outline: 单值百分比图数据之样式-搜索发布并截图
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
#      |name               |
#      |单值百分比图数据之样式-搜索   |





