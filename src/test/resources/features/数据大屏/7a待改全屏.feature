@galaxee @galaxee2   @2.8
Feature: 数据大屏-h全屏
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 全屏 RZY-1915

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "全屏"
    And I click the "Ensure" button
      #选择全屏
    And I click the "Other" button
    And I wait for "Fullscreen" will be visible
    And I click the "Fullscreen" button
    And I hide the element "otherDropdown"

 #设置图表尺寸位置
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "560"
    And I set the parameter "Height" with value "560"
    And I set the parameter "ChartXaxis" with value "400"
    And I set the parameter "ChartYaxis" with value "300"

   #全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "全屏修改"
#保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"



#  Scenario Outline: 全屏发布并截图
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
#      | 全屏|
  Scenario: 验证编辑界面发布 
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "验证发布及分享"
    And I click the "Ensure" button
      #选择时间器
    And I click the "Other" button
    And I wait for "Clock" will be visible
    And I click the "Clock" button
    And I hide the element "otherDropdown"
     #发布，发布后自动保存
    And I wait for "Release" will be visible
    And  I wait for "2000" millsecond
    And I click the "Release" button
    And  I wait for "3000" millsecond
    And switch to another window
    And I will see the url contains "/app/galaxee/show"
#    And switch to another window
    And I close all tabs except main tab

  Scenario: 大屏共享
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "验证发布及分享" then I click the "iconfont icon-bianji" edit button
    And switch to another window
    Then I will see the "galaxee.CreatePage" page
#    And switch to another window
    And I wait for "PictureOne" will be visible
    And I click the "PictureOne" button
    And I wait for "6000" millsecond
    And I wait for "Interactive" will be visible
    And I click the "Interactive" button
    And I wait for "500" millsecond
    And I choose the "全屏" from the "ShareGalaxeeDropDown"
    And I hide the element "ShareGalaxeeDropDown"
    And I wait for "ShareGalaxeeDropDown" will be invisible
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I close all tabs except main tab

  Scenario: 验证大屏共享 RZY-4616
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "全屏" then I click the "iconfont icon-bianji" edit button
    And switch to another window
    Then I will see the "galaxee.CreatePage" page
    And I wait for "PictureTwo" will be visible
    Then I will see the element "PictureTwo" value is "时间器"
    And I wait for "1000" millsecond
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "galaxee.ListPage" page
    And I wait for "2000" millsecond
    When the galaxee name is "验证发布及分享" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button











