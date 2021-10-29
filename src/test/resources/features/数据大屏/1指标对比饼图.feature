@galaxee @galaxee1   @1.19
Feature: 数据大屏-t指标对比饼图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 指标对比饼状图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "指标对比饼状图-静态数据"
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

#    =============================指标对比饼状图
    And I wait for "IndicatorComparisonPie" will be visible
    And I click the "IndicatorComparisonPie" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "600"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "400"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "200"

  #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond
     #选择静态数据
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
##################################无耻的分割线###################################

  Scenario: 指标对比饼图-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "指标对比饼图-样式搜索"
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

#    ==============================指标对比饼图
    And I wait for "IndicatorComparisonPie" will be visible
    And I click the "IndicatorComparisonPie" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "600"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "300"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "200"
#    图表
    And I wait for "Diagram" will be visible
    And I click the "Diagram" button
    And I set the parameter "InitialAngleOffset" with value "90"
    And I set the parameter "Radius2" with value "0.9"
    And I wait for "2000" millsecond
    And I click the "Diagram" button
 #    标签
    And I click the "Tag" button
    And I wait for "2000" millsecond
    And I set the parameter "TagWordSize1" with value "16"
    And I set the parameter "TagWordColor1" with value "#ffff00"
    And I wait for "2000" millsecond
    And I choose the "bolder" from the "TagWordBold"
    And I wait for "2000" millsecond
    And I click the "Tag" button
#    数据系列
    And I click the "DataSeries" button
    And I click the "SeriesFirst" button
    And I set the parameter "SeriesFirstColor" with value "#FF9933"
    And I wait for "2000" millsecond
    And I click the "SeriesFirst" button
    And I click the "SeriesSecond" button
    And I set the parameter "SeriesSecondColor" with value "#9999CC"
    And I wait for "2000" millsecond
    And I click the "SeriesSecond" button
    And I click the "SeriesFirst" button
    And I set the parameter "SeriesFirstColor" with value "#FF9933"
    And I click the "DataSeries" button


 #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num by apache.clientip | sort by num | eval p = num/28000 | limit 2"
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


######################################无耻的分割线################################




