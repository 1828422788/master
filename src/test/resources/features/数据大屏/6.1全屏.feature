@galaxeeOther @galaxee
Feature: 数据大屏-全屏
  Background:
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible

  Scenario: 全屏

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "全屏"
    And I click the "Ensure" button
      #选择全屏
    And I click the "Other" button
    And I wait for "1000" millsecond
    And I wait for "Fullscreen" will be visible
    And I click the "Fullscreen" button
#设置样式
    And I wait for "2000" millsecond
 #设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
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
    Then I will see the success message "保存成功"


  Scenario Outline: 全屏发布并截图

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name            |
      | 全屏|


