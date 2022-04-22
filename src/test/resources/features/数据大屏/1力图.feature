@galaxee @galaxee1   @1.1
Feature: 数据大屏-a力图


#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 力图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "力图-静态数据"
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

#    ==============================力图
    And I wait for "Force" will be visible
    And I click the "Force" button
    And I wait for "2000" millsecond
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "611"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "618"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "506"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "20"
    And I wait for "2000" millsecond


 #数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "静态数据" from the "DataSourceType"
    And I wait for "2000" millsecond
     #选择静态数据
    And I set the parameter "SourceField" with value "source"
    And I set the parameter "TargetField" with value "target"
    And I set the parameter "WeightField" with value "size"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "SourceFieldText" change text to "匹配成功"
    And I wait for element "WeightFieldText" change text to "匹配成功"
    And I wait for element "TargetFieldText" change text to "匹配成功"
    And I wait for "2000" millsecond

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#
#  Scenario Outline: 力图-静态数据发布并截图
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
#      |力图-静态数据  |
######################################无耻的分割线################################

  Scenario: 力图-样式搜索 RZY-3034,RZY-3231,RZY-3232
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "力图-样式搜索"
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

#    ==============================力图
    And I wait for "Force" will be visible
    And I click the "Force" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond

 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1200"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "1200"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "300"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "20"

    #    标签
    And I click the "Tag" button
    And I wait for "2000" millsecond
    And I set the parameter "TagWordColor" with value "#FF00FF"
    And I wait for "2000" millsecond
    And I set the parameter "TagWordSize" with value "20"
    And I wait for "2000" millsecond
    And I click the "Tag" button
    And I wait for "1000" millsecond
#   斥力因子
    And I click the "RepulsionFactorHeader" button
    And I wait for "RepulsionFactor" will be visible
    And I set the parameter "RepulsionFactor" with value "1510"
    And I wait for "2000" millsecond
    And I click the "RepulsionFactorHeader" button

#    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "SourceField" with value "apache.clientip"
    And I set the parameter "TargetField" with value "apache.request_path"
    And I set the parameter "WeightField" with value "count()"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "SourceFieldText" change text to "匹配成功"
    And I wait for element "WeightFieldText" change text to "匹配成功"
    And I wait for element "TargetFieldText" change text to "匹配成功"
    And I wait for "2000" millsecond


#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#  Scenario Outline: 力图-样式搜索发布页截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    And I wait for "1000" millsecond
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      | name |
#      | 力图-样式搜索 |

