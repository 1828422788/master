@galaxee @galaxee2   @2.5
Feature: 数据大屏-e中国地图3D
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 中国地图3D-样式搜索 RZY-1909,RZY-2250,RZY-2251,RZY-1939,RZY-1989
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "中国地图3D-样式搜索"
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
    And I wait for "Map" will be visible
    And I click the "Map" button

#    ==============================中国地图3D
    And I wait for "ChinaMap3D" will be visible
    And I click the "ChinaMap3D" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
    #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "618"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "406"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "680"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "200"

   #    样式
    And I wait for "GlobalCon" will be visible
    And I click the "GlobalCon" button
    And I wait for "2000" millsecond
    And I click the "CameraRotation" button
    And I wait for "HoriaontalDirection" will be visible
    And I set the parameter "HoriaontalDirection" with value "84"
    And I set the parameter "VerticalDirection" with value "66"
    And I wait for "2000" millsecond
    And I click the "CameraRotation" button
#    相机中心
    And I wait for "CameraCenter" will be visible
    And I click the "CameraCenter" button
    And I set the parameter "Longitude" with value "112"
    And I set the parameter "Latitude" with value "30"
    And I wait for "2000" millsecond
    And I click the "CameraCenter" button
#   相机距离
    And I wait for "CameraDistance" will be visible
    And I set the parameter "CameraDistance" with value "170"
    And I wait for "1500" millsecond
    And I click the "GlobalCon" button
#   填充设置
    And I wait for "FillSet" will be visible
    And I click the "FillSet" button
    And I wait for "2000" millsecond
    And I click the "FillColor4" button
    And I wait for "MinColor" will be visible
    And I set the parameter "MinColor" with value "#9955FF"
    And I wait for "2000" millsecond
    And I set the parameter "MaxColor" with value "#00DD77"
    And I wait for "2000" millsecond
    And I set the parameter "NoData" with value "#C0C0C0"
    And I wait for "2000" millsecond
    And I set the parameter "BackFace" with value "#708090"
    And I wait for "2000" millsecond
    And I click the "FillColor4" button
#   边线选项
    And I wait for "LineOptions" will be visible
    And I click the "LineOptions" button
    And I wait for "2000" millsecond
    And I set the parameter "BoundaryColor" with value "#0E0E0E"
    And I wait for "2000" millsecond
    And I set the parameter "BoundaryWidth" with value "8"
    And I wait for "2000" millsecond
    And I set the parameter "Diaphaneity" with value "0.7"
    And I wait for "2000" millsecond
    And I click the "LineOptions" button
    And I wait for "2000" millsecond

 #    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.geo.province"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I wait for "2000" millsecond

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "count()"
    And I set the parameter "DivideField" with value "apache.geo.province"
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


#  Scenario Outline: 中国地图-样式搜索发布并截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |中国地图-样式搜索   |

#####################################无耻的分割线################################



