@galaxee @galaxee2   @2.4
Feature: 数据大屏-d世界地图3D
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible


  Scenario: 世界地图3D-样式搜索 RZY-1970,RZY-1971
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "世界地图3D-样式搜索"
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

#    =============================世界地图3D
    And I wait for "World3D" will be visible
    And I click the "World3D" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
    #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "800"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "500"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "70"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "70"

    #    样式
#    相机旋转
    And I wait for "GlobalCon" will be visible
    And I click the "GlobalCon" button
    And I wait for "2000" millsecond
    And I click the "CameraRotation" button
    And I wait for "HoriaontalDirection" will be visible
    And I set the parameter "HoriaontalDirection" with value "88"
    And I set the parameter "VerticalDirection" with value "70"
    And I wait for "2000" millsecond
    And I click the "CameraRotation" button
#    相机中心
    And I wait for "CameraCenter" will be visible
    And I click the "CameraCenter" button
    And I set the parameter "Longitude" with value "52"
    And I set the parameter "Latitude" with value "40"
    And I wait for "2000" millsecond
    And I click the "CameraCenter" button

    And I wait for "CameraDistance" will be visible
    And I set the parameter "CameraDistance" with value "830"
    And I wait for "2000" millsecond
    And I click the "GlobalCon" button

#    填充设置
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
    And I set the parameter "SplInput" with value "tag:sample04061424 | stats count() by apache.geo.country"
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
    And I set the parameter "DivideField" with value "apache.geo.country"
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


#  Scenario Outline: 世界地图-样式搜索发布页截图
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
#      | 世界地图-样式搜索 |



