@galaxee @galaxee2   @2.9
Feature: 数据大屏-p箭头标绘
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 视频流 RZY-4819
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "视频流"
    And I click the "Ensure" button
      #选择视频流
    And I click the "Other" button
    And I wait for "videoFlow" will be visible
    And I click the "videoFlow" button
    And I hide the element "otherDropdown"
    And I wait for loading invisible
    #保存
    And I wait for "Save" will be visible
    And  I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#
#
#  Scenario Outline: 视频流发布并截图
#
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
#      |视频流   |


 ######################################无耻的分割线################################

  Scenario: 视频流样式 RZY-4338
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "视频流样式"
    And I click the "Ensure" button
      #选择视频流
    And I click the "Other" button
    And I wait for "videoFlow" will be visible
    And I click the "videoFlow" button
    And I hide the element "otherDropdown"
    And I wait for loading invisible
#设置样式
    And I click the "Style" button
      #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "700"
    And I set the parameter "Height" with value "400"
    And I set the parameter "ChartXaxis" with value "550"
    And I set the parameter "ChartYaxis" with value "350"
     #修改样式
    And I click the "styleVideoFlow" button
    And I set the parameter "videoAddress" with value "https://media.w3.org/2010/05/sintel/trailer.mp4"
       #3 全局样式修改名成
    And I click the "globalStyle" button
    And I wait for loading invisible
    And I set the parameter "globalStyleName" with value "视频流样式"
     #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 视频流样式发布并截图
#
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
#      |视频流样式   |


