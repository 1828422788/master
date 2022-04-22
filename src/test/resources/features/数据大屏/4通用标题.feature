@galaxee @galaxee2   @2.7
Feature: 数据大屏-g通用标题

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 通用标题 RZY-1913,RZY-1973,RZY-1974,RZY-1938
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "通用标题"
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
    And I wait for "Index" will be visible
    And I click the "Index" button

#    ==============================标题
    And I wait for "TitleImg" will be visible
    And I click the "TitleImg" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
     #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "560"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "280"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "434"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "390"
    And I wait for "2000" millsecond

    And I set the parameter "TitleName" with value "数据模块"
    And I click the "VerticalButton" button
    And I wait for "1500" millsecond
    And I set the parameter "TextInterval" with value "15"
    And I wait for "CirleTextStyle" will be visible
    And I click the "CirleTextStyle" button
    And I wait for "2000" millsecond
    And I set the parameter "CircleWorldSize" with value "16"
    And I choose the "bolder" from the "CircleWorleBold"
    And I set the parameter "CircleWorldColor" with value "#993300"
    And I wait for "2000" millsecond
    And I click the "CirleTextStyle" button

    And I wait for "2000" millsecond
    And I click the "BackgroundEyes" button
    And I wait for "BackgroundStyle" will be visible
    And I click the "BackgroundStyle" button
    And I set the parameter "BackgroundColor" with value "#CCCCFF"
    And I wait for "2000" millsecond
    And I set the parameter "AngleRounded" with value "70"
    And I wait for "2000" millsecond
    And I set the parameter "BorderColor1" with value "#FFFF00"
    And I wait for "2000" millsecond
    And I choose the "点线" from the "BorderStyle"
    And I wait for "2000" millsecond
    And I set the parameter "BorderThickness" with value "6"
    And I wait for "1500" millsecond
    And I click the "BackgroundStyle" button
    And I wait for "2000" millsecond

   #   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"




#  Scenario Outline: 发布页截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      | 标题   |



